/* 
 NewtonRaphsonIRRCalculator.cs - Calculate the Internal rate of return for a given set of cashflows.
 Zainco Ltd
 Author: Joseph A. Nyirenda <joseph.nyirenda@gmail.com>
             Mai Kalange<code5p@yahoo.co.uk>
 Copyright (c) 2008 Joseph A. Nyirenda, Mai Kalange, Zainco Ltd

 This program is free software; you can redistribute it and/or
 modify it under the terms of version 2 of the GNU General Public
 License as published by the Free Software Foundation.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 General Public License for more details.

 You should have received a copy of the GNU General Public
 License along with this program; if not, write to the
 Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 Boston, MA 02111-1307, USA.
*/
package Zainco.NewtonRaphson.IRRCalculator.Domain
{
	import mx.collections.ArrayCollection;

	public class NewtonRaphsonIRRCalculator implements ICalculator
	{
		private var m_cashflows:ArrayCollection;
		
		private const m_tolerance:Number 	 = 0.00000001;
		private const m_maxIterations:Number = 50000;
		
		private const MIN_NO_CASH_FLOW_PERIODS:Number = 2;
		
		private var m_result:Number;
		private var m_numberOfIterations:Number = 0;

		// Initialize with a collection of cashflow values (at least 2 required)
		public function NewtonRaphsonIRRCalculator(cashflows:ArrayCollection)
		{
			m_cashflows = cashflows;
		}
		
		// Gets a value indicating whether this instance is valid cash flows.
		// Returns true if this instance is valid cash flows, false otherise.
		public function isValidCashFlows():Boolean
		{
			// Rules for a valid cash flow stream:
			//
			// 1) Cash flows for the first period must be positive
			// 2) There should be at least two cash flow periods
			if (m_cashflows != null && 
				m_cashflows.length >= MIN_NO_CASH_FLOW_PERIODS &&
				Number(m_cashflows[0]) < 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		// Gets the initial guess
		private function initialGuess():Number
		{
			var initialGuess:Number = -1 * (1 + ( Number(m_cashflows[1])/Number(m_cashflows[0]) ));
			return initialGuess;
		}
		
		// ICalculator implementation:  attemps to find the IRR using
		// the Newton-Rhapson method
		//
		// Returns the IRR if found, NaN otherwise
		public function calculate():Number
		{
			m_result = NaN;
			
			if (isValidCashFlows())
			{
				doNewtonRapshonCalculation(initialGuess());
			}
			
			return m_result;
		}
		
		private function doNewtonRapshonCalculation(estimatedReturn:Number):void
		{
			m_numberOfIterations++;
			
			m_result = estimatedReturn - sumOfIRRPolynomial(estimatedReturn)/irrDerivativeSum(estimatedReturn);
			
			while(!hasConverged(m_result) && m_maxIterations != m_numberOfIterations)
			{
				doNewtonRapshonCalculation(m_result);
			}
			
			if (m_maxIterations == m_numberOfIterations)
			{
				m_result = NaN;
			}
		}
		
		private function sumOfIRRPolynomial(estimatedReturnRate:Number):Number
		{
			var sumOfPolynomial:Number = 0.0;
			
			if (isValidIterationBounds(estimatedReturnRate))
			{
				for (var j:Number = 0; j < m_cashflows.length; j++)
				{
					sumOfPolynomial += Number(m_cashflows[j]) / (Math.pow(1 + estimatedReturnRate, j));
				}
			}
			
			return sumOfPolynomial;
		}
		
		// Determines whether the specified estimated return rate has converged.
		//
		// Returns:  true if the specified estimated return rate has converged; otherwise, false
		private function hasConverged(estimatedReturnRate:Number):Boolean
		{
			// Check that the calculated value makes the IRR polynomial zero.
			var isWithinTolerance:Boolean = Math.abs(sumOfIRRPolynomial(estimatedReturnRate)) <= m_tolerance;
			return isWithinTolerance;
		}
		
		// IRRs the derivative sum
		private function irrDerivativeSum(estimatedReturnRate:Number):Number
		{
			var sumOfDerivative:Number = 0.0;
			
			if (isValidIterationBounds(estimatedReturnRate))
			{
				for (var i:Number = 1; i < m_cashflows.length; i++)
				{
					sumOfDerivative += (Number(m_cashflows[i]) * i) / Math.pow((1 + estimatedReturnRate), i);
				}
			}
			
			return sumOfDerivative * -1;
		}
		
		// Determines whether [is valid iteration bounds] [the specified estimated return rate].
		//
		// Returns:  if [is valid iteration bounds] [the specified estimated return rate]; otherwise, false
		private function isValidIterationBounds(estimatedReturnRate:Number):Boolean
		{
			return estimatedReturnRate != 1 && (estimatedReturnRate < int.MAX_VALUE) && (estimatedReturnRate > int.MIN_VALUE);
		}
	}
}