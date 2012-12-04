package seattleu.softwareeconomics.models
{
	[Bindable]
	public class LoanPayment
	{
		public var paymentNumber:Number = 0;
		
		public var interest:Number = 0;
		public var interestString:String;
		
		public var principal:Number = 0;
		public var principalString:String;
		
		public var balance:Number = 0;
		public var balanceString:String;
		
		public function LoanPayment(paymentNumber:Number, interest:Number, principal:Number, balance:Number)
		{
			this.paymentNumber = paymentNumber;
			
			this.interest = interest;
			this.interestString = "$" + interest.toFixed(2);
			
			this.principal = principal;
			this.principalString = "$" + principal.toFixed(2);
			
			this.balance = balance;
			this.balanceString = "$" + this.balance.toFixed(2);
		}
	}
}