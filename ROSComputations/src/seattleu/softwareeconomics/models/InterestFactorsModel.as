package seattleu.softwareeconomics.models
{
	import seattleu.softwareeconomics.math.InterestFactorCalculator;

	[Bindable]
	public class InterestFactorsModel
	{
		// Single-payment
		public var CompoundAmountFP:Number = 0;
		public var PresentWorthPF:Number = 0;
		
		// Equal-payment series
		public var CompoundAmountFA:Number = 0;
		public var SinkingFundAF:Number = 0;
		public var PresentWorthPA:Number = 0;
		public var CapitalRecoveryAP:Number = 0;
		
		public function InterestFactorsModel()
		{
		}
		
		public function SetSinglePaymentCompoundAmountFactorFP(interestRatePercent:Number, n:Number):void
		{
			CompoundAmountFP = InterestFactorCalculator.FP(interestRatePercent, n);
		}
		
		public function SetSinglePaymentPresentWorthFactorPF(interestRatePercent:Number, n:Number):void
		{
			PresentWorthPF = InterestFactorCalculator.PF(interestRatePercent, n);
		}
		
		public function SetEqualPaymentSeriesCompoundAmountFactorFA(interestRatePercent:Number, n:Number):void
		{
			CompoundAmountFA = InterestFactorCalculator.FA(interestRatePercent, n);
		}
		
		public function SetEqualPaymentSeriesSinkingFundFactorAF(interestRatePercent:Number, n:Number):void
		{
			SinkingFundAF = InterestFactorCalculator.AF(interestRatePercent, n);
		}
		public function SetEqualPaymentSeriesPresentWorthFactorPA(interestRatePercent:Number, n:Number):void
		{
			PresentWorthPA = InterestFactorCalculator.PA(interestRatePercent, n);
		}
		
		public function SetEqualPaymentSeriesCapitalRecoveryFactorAP(interestRatePercent:Number, n:Number):void
		{
			CapitalRecoveryAP = InterestFactorCalculator.AP(interestRatePercent, n);
		}
	}
}