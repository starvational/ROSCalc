ROSCalc
=======

ROSCalc is a Seattle University individual project for SEGR-530 Software Economics (taught by Mike McKee).  The project is a Mobile calculator that implements various economics calculations from the Return On Software book (by Steve Tockey).

## ROSCalc Features

Compound interest factor calculator
Loan Ammortization Schedule
Cashflow Stream calculator for n number of cashflows

## Project Components

#### 1) ROSCalc

Contains all the Mobile User Interface components

#### 2) ROSCalcComputations

Contains the business logic for generating the compounding interest factors, Loan Ammortization calculations and the Cashflow stream calculator

#### 3)  NewtonRaphsonIRRCalculator (GPL v3.0)

The NewtonRhapsonIRRCalculator library is a direct port from C# to ActionScript.  Info about the original implementation is below:

Author: Joseph A. Nyirenda <joseph.nyirenda@gmail.com>
Mai Kalange<code5p@yahoo.co.uk>
irr-newtonraphson-calculator:  Internal Rate of Return(IRR) using the Newton-Raphson Method
http://code.google.com/p/irr-newtonraphson-calculator/

Joseph wrote a blogpost about his IRR implementation:

blog post about the implementation:
http://zainco.blogspot.com/2008/08/internal-rate-of-return-using-newton.html


Note:  If you find any bugs in the port, shoot me an email or fix it and let me know.  For all other non-port issues, contact Joseph Nyirenda - All credit goes out to him for sharing his work)