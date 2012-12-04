package seattleu.softwareeconomics.math
{
	public class InterestFactorCalculator
	{
		public function InterestFactorCalculator()
		{
		}
		
		public static function FP(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			return Math.pow(1 + i, compoundingPeriods); 
		}
		
		public static function PF(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			return 1 / ( Math.pow(1 + i, compoundingPeriods) );
		}
		
		public static function FA(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			return (Math.pow((1 + i), compoundingPeriods) - 1) / i;
		}
		
		public static function AF(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			return 1 / ( (Math.pow((1 + i), compoundingPeriods) - 1) / i );
		}
		public static function PA(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			var singlePaymentFactor:Number = Math.pow((1 + i), compoundingPeriods);
			
			return 1 / ( (i * singlePaymentFactor) / (singlePaymentFactor - 1) );
		}
		
		public static function AP(interestRatePercent:Number, compoundingPeriods:Number):Number
		{
			// Get the decimal percentage equivalent
			var i:Number = interestRatePercent / 100;
			
			var singlePaymentFactor:Number = Math.pow((1 + i), compoundingPeriods);
			
			return (i * singlePaymentFactor) / (singlePaymentFactor - 1);
		}
	}
}