package seattleu.softwareeconomics.models
{
	import Zainco.NewtonRaphson.IRRCalculator.Domain.NewtonRaphsonIRRCalculator;
	import Zainco.NewtonRaphson.IRRCalculator.Test.TestCalculatorProgram;
	
	import mx.collections.ArrayCollection;
	
	import seattleu.softwareeconomics.math.InterestFactorCalculator;

	[Bindable]
	public class CashflowStreamModel
	{
		public var cashflowStream:ArrayCollection;
		
		public var presentWorth:Number;
		public var presentWorthString:String;
		
		public var futureWorth:Number;
		public var futureWorthString:String;
		
		public var annualEquivalent:Number;
		public var annualEquivalentString:String;
		
		public var internalRateofReturn:Number;
		public var internalRateOfReturnPercentageString:String;
		
		public function CashflowStreamModel()
		{
			cashflowStream = new ArrayCollection();
		}
		
		public function updateCashflowStream(payments:ArrayCollection, interestRatePercent:Number):void
		{
			this.cashflowStream.removeAll();
			this.presentWorth = 0;
			this.futureWorth = 0;
			this.internalRateofReturn = NaN;
			
			var projectBalance:Number = 0;

			var year:Number = 0;
			for (year = 0; year < payments.length; year++)
			{
				var cashflowAmount:Number = Number(payments[year]);
				
				// Discounted cash flow = current amount * (P/F, i, n)
				var discountedCashFlow:Number = cashflowAmount * InterestFactorCalculator.PF(interestRatePercent, year);
				
				// At year 0, the project balance is the first cash flow amount
				if (year == 0)
				{
					projectBalance = cashflowAmount;
				}
				// Subsequent years, the project balance is the current balance + the discounted cash flow
				else
				{
					projectBalance += discountedCashFlow;
				}
				
				var processedCashFlow:CashFlow = new CashFlow(year, discountedCashFlow, projectBalance);
				cashflowStream.addItem(processedCashFlow);
			}
			
			// The final present worth is the total project balance
			this.presentWorth = projectBalance;
			this.presentWorthString = "$" + presentWorth.toFixed(2);
			
			var periods:Number = payments.length - 1;
			
			// Compute the Future worth:  PW(i) * (F/P, i, n)
			this.futureWorth = presentWorth * InterestFactorCalculator.FP(interestRatePercent, periods);
			this.futureWorthString  = "$" + futureWorth.toFixed(2);
			
			// Compute the Annual Equivalent - AE(i):  PW(i) * (A/P, i, n)
			this.annualEquivalent = presentWorth * InterestFactorCalculator.AP(interestRatePercent, periods);
			this.annualEquivalentString = "$" + annualEquivalent.toFixed(2);
			
			// compute the IRR if the cash flow stream is valid
			var irrCalc:NewtonRaphsonIRRCalculator = new NewtonRaphsonIRRCalculator(payments);
			if (irrCalc.isValidCashFlows())
			{
				internalRateofReturn = irrCalc.calculate();
			}
			
			if (isNaN(internalRateofReturn))
			{
				internalRateOfReturnPercentageString = "N/A";
			}
			else
			{
				internalRateOfReturnPercentageString = (internalRateofReturn * 100).toFixed(2) + "%";
			}
		}
	}
}