using System;

public static class Calc
{
	// Normal random number N(0,1)
	public static double randomNormal() {
		Random rand = new Random(); 
		double u1 = 1.0-rand.NextDouble(); 
		double u2 = 1.0-rand.NextDouble();
		double randNormal = Math.Sqrt(-2.0 * Math.Log(u1)) * Math.Sin(2.0 * Math.PI * u2); 
		return randNormal;
	}
	
	// Standard normal probability density function
	public static double normalPDF(double x) {
    	return (1.0/(Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x);
	}

	// An approximation to the cumulative distribution function for the standard normal distribution
	// This is a recursive function
	public static double normalCDF(double x) {
    	double k = 1.0/(1.0 + 0.2316419 * x);
    	double k_sum = k * (0.319381530 + k * (-0.356563782 + k * (1.781477937 + k * (-1.821255978 + 1.330274429 * k))));
    	if (x >= 0.0) {
        	return (1.0 - (1.0 / (Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x) * k_sum);
    	} else {
        	return 1.0 - normalCDF(-x);
    	}
	}

	// Heaviside step function
	public static double heaviside(double val) {
		if (val >= 0) {
			return 1.0;
		} else {
			return 0.0;
		}
	}




}

