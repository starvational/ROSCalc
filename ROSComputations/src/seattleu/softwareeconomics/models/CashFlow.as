package seattleu.softwareeconomics.models
{
	[Bindable]
	public class CashFlow
	{
		public var period:Number;
		
		public var discountedCashflowValue:Number;
		public var discountedCashflowValueString:String;
		
		public var projectBalance:Number;
		public var projectBalanceString:String;
		
		public function CashFlow(period:Number, discountedCashflowValue:Number, projectBalance:Number)
		{
			this.period = period;
			
			this.discountedCashflowValue = discountedCashflowValue;
			this.discountedCashflowValueString = "$" + discountedCashflowValue.toFixed(2);
			
			this.projectBalance = projectBalance;
			this.projectBalanceString = "$" + projectBalance.toFixed(2);
		}
	}
}