package seattleu.softwareeconomics.models
{
	import mx.collections.ArrayCollection;
	
	import seattleu.softwareeconomics.math.InterestFactorCalculator;

	[Bindable]
	public class LoanScheduleModel
	{
		public var payments:ArrayCollection = new ArrayCollection();
		
		public var monthlyPaymentAmount:Number = 0;
		public var monthlyPaymentAmountString:String;
		
		public var totalInterestPaid:Number = 0;
		public var totalInterestPaidString:String;
		
		public function LoanScheduleModel()
		{
			
		}
		
		public function setLoanSchedule(apr:Number, loanAmount:Number, loanTermInMonths:Number):void
		{
			this.payments = new ArrayCollection();
			this.totalInterestPaid = 0;
			
			// Get monthly interest rate from APR
			var monthlyInterest:Number = apr / 12;
			
			// Calculate the monthly payment (loanAmount * P/F,i,n)
			monthlyPaymentAmount = loanAmount * InterestFactorCalculator.AP(monthlyInterest, loanTermInMonths);
			
			// To calculate the principal payment, we need the period, so the value of n
			// in (P/F, i, n) starts as the number of monthly payments, and we decrement
			// that as we calculate the principal amount of subsequent payments
			var n:Number = loanTermInMonths;
			
			var loanBalance:Number = loanAmount;
			var paymentNumberCount:Number = 1;
			
			for (paymentNumberCount = 1; paymentNumberCount <= loanTermInMonths; paymentNumberCount++)
			{
				// Calculate the principaly payment
				var principal:Number = monthlyPaymentAmount * InterestFactorCalculator.PF(monthlyInterest, n);
				
				// Calculate the interest payment
				var interest:Number = monthlyPaymentAmount - principal;
				
				// Update the total interest paid so far
				this.totalInterestPaid += interest;
				
				if (paymentNumberCount != loanTermInMonths)
				{
					// Calculate the new balance after this payment
					loanBalance = loanBalance - principal;
				}
				else
				{
					// nothing owed after the last payment
					loanBalance = 0;
				}
				
				// Update the list of payments
				var payment:LoanPayment = new LoanPayment(paymentNumberCount, interest, principal, loanBalance);
				this.payments.addItem(payment);
				
				--n;
			}
			
			this.monthlyPaymentAmountString = "$" + this.monthlyPaymentAmount.toFixed(2);
			this.totalInterestPaidString = "$" + this.totalInterestPaid.toFixed(2);
		}
	}
}