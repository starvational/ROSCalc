package Zainco.NewtonRaphson.IRRCalculator.Test
{
	import Zainco.NewtonRaphson.IRRCalculator.Domain.ICalculator;
	import Zainco.NewtonRaphson.IRRCalculator.Domain.NewtonRaphsonIRRCalculator;
	
	import mx.collections.ArrayCollection;

	public class TestCalculatorProgram
	{
		public function TestCalculatorProgram()
		{
			var cashflows:ArrayCollection = new ArrayCollection();
			cashflows.addItem(-3000);
			cashflows.addItem(510);
			cashflows.addItem(131);
			cashflows.addItem(-100);
			cashflows.addItem(9845);
			cashflows.addItem(43);
			cashflows.addItem(52867);
			
			var calc:ICalculator = new NewtonRaphsonIRRCalculator(cashflows);
			
			trace(calc.calculate());
		}
	}
}