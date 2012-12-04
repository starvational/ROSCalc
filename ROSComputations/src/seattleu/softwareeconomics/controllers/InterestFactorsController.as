package seattleu.softwareeconomics.controllers
{
	import flashx.textLayout.formats.Float;
	
	import seattleu.softwareeconomics.models.InterestFactorsModel;

	public class InterestFactorsController
	{
		private var m_model:InterestFactorsModel;
		
		public function InterestFactorsController(model:InterestFactorsModel)
		{
			m_model = model;
		}
		
		public function updateInterestFactors(interestRate:Number, compoundingPeriods:int):void
		{
			m_model.SetSinglePaymentCompoundAmountFactorFP(interestRate, compoundingPeriods);
			m_model.SetSinglePaymentPresentWorthFactorPF(interestRate, compoundingPeriods);
			
			m_model.SetEqualPaymentSeriesCompoundAmountFactorFA(interestRate, compoundingPeriods);
			m_model.SetEqualPaymentSeriesSinkingFundFactorAF(interestRate, compoundingPeriods);
			m_model.SetEqualPaymentSeriesPresentWorthFactorPA(interestRate, compoundingPeriods);
			m_model.SetEqualPaymentSeriesCapitalRecoveryFactorAP(interestRate, compoundingPeriods);
		}
	}
}