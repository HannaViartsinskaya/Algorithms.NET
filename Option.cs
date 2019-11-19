using System;
using System.Collections.Generic;
using System.Linq;


class Option
{
	public double S;
	public double K;
	public double r;
	public double v;
	public double T;
	public Option(double S, double K, double r, double v, double T)
	{
		this.S = S;
		this.K = K;
		this.r = r;
		this.v = v;
		this.T = T;
	}

	// Calculate dJ, for j in {1,2}. This term appears in the close form solution for the European call or put price
	private double dJ(int j)
	{
		return (Math.Log(S / K) + (r + (Math.Pow(-1, j - 1)) * 0.5 * v * v) * T) / (v * (Math.Pow(T, 0.5)));
	}

	// Calculate the European vanilla call price based on underlying S, strike K, risk-free rate r, volatility of underlying sigma and time to maturity T
	public double europeanCall() {
		return S * Calc.normalCDF(dJ(1)) - K * Math.Exp(-r * T) * Calc.normalCDF(dJ(2));
	}

	// Calculate the European vanilla put price based on underlying S, strike K, risk-free rate r, volatility of underlying sigma and time to maturity T
	public double europeanPut() {
		return -S * Calc.normalCDF(-dJ(1)) + K * Math.Exp(-r * T) * Calc.normalCDF(-dJ(2));
	}

	// Pricing a European vanilla call option with a Monte Carlo method
	public double europeanCallMonteCarlo(int numSims) {
		double S_adjust = S * Math.Exp(T*(r-0.5*v*v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;
    	for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += Math.Max(S_cur - K, 0.0);
		}
		return (payoff_sum / numSims) * Math.Exp(-r*T);
	}

	// Pricing a European vanilla put option with a Monte Carlo method
	public double europeanPutMonteCarlo(int numSims) {
		double S_adjust = S * Math.Exp(T * (r - 0.5 * v * v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;
		
		for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += Math.Max(K - S_cur, 0.0);
		}
		return (payoff_sum / numSims) * Math.Exp(-r * T);
	}

	// Pricing a digital call option with a Monte Carlo method
	public double digitalCallMonteCarlo(int numSims) {
		double S_adjust = S * Math.Exp(T * (r - 0.5 * v * v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;

		for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += Calc.heaviside(S_cur - K);
		}
		return (payoff_sum / numSims) * Math.Exp(-r * T);
	}

	// Pricing a digital put option with a Monte Carlo method
	public double digitalPutMonteCarlo(int numSims) {
		double S_adjust = S * Math.Exp(T * (r - 0.5 * v * v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;

		for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += Calc.heaviside(K - S_cur);
		}
		return (payoff_sum / numSims) * Math.Exp(-r * T);
	}

	// Pricing a double digital call option with a Monte Carlo method
	// Pay-off function for a double digital option
	private double payoffDoubleDigital(double KL, double KU, double x) {
		if (x >= KL && x <= KU) {
			return 1.0;
		} else {
			return 0.0;
		}
	}

	public double doubleDigitalCallMonteCarlo(int numSims, double KL, double KU) {
		double S_adjust = S * Math.Exp(T * (r - 0.5 * v * v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;

		for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += payoffDoubleDigital(KL, KU, S_cur - K);
		}
		return (payoff_sum / numSims) * Math.Exp(-r * T);
	}

	// Pricing a double digital put option with a Monte Carlo method
	public double doubleDigitalPutMonteCarlo(int numSims, double KL, double KU) {
		double S_adjust = S * Math.Exp(T * (r - 0.5 * v * v));
		double S_cur = 0.0;
		double payoff_sum = 0.0;

		for (int i=0; i<numSims; i++) {
			double N = Calc.randomNormal();
			S_cur = S_adjust * Math.Exp(Math.Sqrt(v * v * T) * N);
			payoff_sum += payoffDoubleDigital(KL, KU, S_cur - K);
		}
		return (payoff_sum / numSims) * Math.Exp(-r * T);
	}

	// Asian option

	// This provides a vector containing sampled points of a Geometric Brownian Motion stock price path for an Asian Option
	private static void calcPathSpotPrices(ref List<double> spotPrices, double r, double v, double T) { 
		// Since the drift and volatility of the asset are constant we will precalculate as much as possible for maximum efficiency
		double dt = T / spotPrices.Count;
		double drift = Math.Exp(dt * (r - 0.5 * v * v));
		double vol = Math.Sqrt(v * v * dt);
		for (int i=1; i<spotPrices.Count; i++) {
			double N = Calc.randomNormal();
			spotPrices[i] = spotPrices[i-1] * drift * Math.Exp(vol * N);
		}
	}

	// Arithmetic mean pay-off price for an Asian Option
	private double arithmeticPayoff(List<double> spotPrices) {
		return spotPrices.Average();
	}

	// Geometric mean pay-off price for an Asian Option
	private double geometricPayoff(List<double> spotPrices) {
		int numTimes = spotPrices.Count;
		double logSum = 0.0;
		for (int i=0; i<spotPrices.Count; i++) {
			logSum += Math.Log(spotPrices[i]);
		}
		double geomMean = Math.Exp(logSum / numTimes );
		return geomMean;
	}


}
