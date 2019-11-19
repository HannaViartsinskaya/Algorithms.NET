using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AP
{
	public partial class Default : System.Web.UI.Page
	{
		
		public class blackscholes
		{

			public static int ITMAX = 100;
			public static double EPS = 3.0e-7;  // don't use 3.0d-7
			public static double pricep;

			static public double normPDF(double x)
			{
				return (1.0 / (Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x);
			}


			// Приближение к интегральной функции распределения для стандартного нормального распределения
			static public double normCDF(double x)
			{
				double k = 1.0 / (1.0 + 0.2316419 * x);
				double k_sum = k * (0.319381530 + k * (-0.356563782 + k * (1.781477937 + k * (-1.821255978 + 1.330274429 * k))));
				if (x >= 0.0)
				{
					return (1.0 - (1.0 / (Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x) * k_sum);
				}
				else
				{
					return 1.0 - normCDF(-x);
				}
			}

			//Этот термин появляется в закрытой форме решения для европейского колл или пут опциона
			static public double dJ(int j, double S, double K, double r, double v, double T)
			{
				return (Math.Log(S / K) + (r + (Math.Pow(-1, j - 1)) * 0.5 * v * v) * T) / (v * (Math.Pow(T, 0.5)));
			}

			//Вычисление Европейский колл акций базирующийся на цене базового актива, цене страйк, безрисковая процентная ставка, влатильности и времени
			static public double callPrice(double S, double K, double r, double v, double T)
			{
				return S * normCDF(dJ(1, S, K, r, v, T)) - K * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
			}

			//Вычисление Европейский пут акций базирующийся на цене базового актива, цене страйк, безрисковая процентная ставка, влатильности и времени
			static public double putPrice(double S, double K, double r, double v, double T)
			{
				return -S * normCDF(-dJ(1, S, K, r, v, T)) + K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
			}


			static public double call_delta(double S, double K, double r, double v, double T)
			{
				return normCDF(dJ(1, S, K, r, v, T));
			}
			static public double call_gamma(double S, double K, double r, double v, double T)
			{
				return normPDF(dJ(1, S, K, r, v, T)) / (S * v * Math.Sqrt(T));
			}
			static public double call_vega(double S, double K, double r, double v, double T)
			{
				return S * normPDF(dJ(1, S, K, r, v, T)) * Math.Sqrt(T);
			}
			static public double call_theta(double S, double K, double r, double v, double T)
			{
				return -(S * normPDF(dJ(1, S, K, r, v, T)) * v) / (2 * Math.Sqrt(T))
				  - r * K * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
			}
			static public double call_rho(double S, double K, double r, double v, double T)
			{
				return K * T * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
			}
			static public double put_delta(double S, double K, double r, double v, double T)
			{
				return normCDF(dJ(1, S, K, r, v, T)) - 1;
			}
			static public double put_gamma(double S, double K, double r, double v, double T)
			{
				return call_gamma(S, K, r, v, T); // Identical to call by put-call parity
			}
			static public double put_vega(double S, double K, double r, double v, double T)
			{
				return call_vega(S, K, r, v, T); // Identical to call by put-call parity
			}
			static public double put_theta(double S, double K, double r, double v, double T)
			{
				return -(S * normPDF(dJ(1, S, K, r, v, T)) * v) / (2 * Math.Sqrt(T))
				  + r * K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
			}
			static public double put_rho(double S, double K, double r, double v, double T)
			{
				return -T * K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
			}


		}
		public void Page_Load()
		{
			FunctionPickL();
		}
		public void PickL(object sender, EventArgs e)
		{

			FunctionPickL();
		}

		public void FunctionPickL()
		{
			try
			{
				double sp = Convert.ToDouble(spt.Text);

				double ep = Convert.ToDouble(ept.Text);
				double rfr = Convert.ToDouble(rfrt.Text);
				double sigma = Convert.ToDouble(sigmat.Text);
				double time = Convert.ToDouble(timet.Text);

				//double nd1=0.0;
				//double nd2=0.0;
				//double timey = time/365.0;
				double rfrr = rfr / 100;
				double sigmar = sigma / 100;
				double callp = blackscholes.callPrice(sp, ep, rfrr, sigmar, time);
				double putp = blackscholes.putPrice(sp, ep, rfrr, sigmar, time);

				//double deltacall = nd1;
				//double deltaput = nd1 - 1.0;
				double deltacall = blackscholes.call_delta(sp, ep, rfrr, sigmar, time);
				double gammacall = blackscholes.call_gamma(sp, ep, rfrr, sigmar, time);
				double vegacall = blackscholes.call_vega(sp, ep, rfrr, sigmar, time);
				double thetacall = blackscholes.call_theta(sp, ep, rfrr, sigmar, time);
				double rhocall = blackscholes.call_rho(sp, ep, rfrr, sigmar, time);
				double deltaput = blackscholes.put_delta(sp, ep, rfrr, sigmar, time);
				double gammaput = blackscholes.put_gamma(sp, ep, rfrr, sigmar, time);
				double vegaput = blackscholes.put_vega(sp, ep, rfrr, sigmar, time);
				double thetaput = blackscholes.put_theta(sp, ep, rfrr, sigmar, time);
				double rhoput = blackscholes.put_rho(sp, ep, rfrr, sigmar, time);

				valuecallt.Text = callp.ToString();
				valueputt.Text = putp.ToString();
				valuedeltacall.Text = deltacall.ToString();
				valuedeltaput.Text = deltaput.ToString();
				valuegammacall.Text = gammacall.ToString();
				valuegammaput.Text = gammaput.ToString();
				valuethetacall.Text = thetacall.ToString();
				valuethetaput.Text = thetaput.ToString();
				valuerhocall.Text = rhocall.ToString();
				valuerhoput.Text = rhoput.ToString();


				var callp1 = blackscholes.callPrice(sp, ep, rfrr, sigmar, time);
				var putp1 = blackscholes.putPrice(sp, ep, rfrr, sigmar, time);
				var callp2 = blackscholes.callPrice(sp + 10, ep, rfrr, sigmar, time);
				var putp2 = blackscholes.putPrice(sp + 10, ep, rfrr, sigmar, time);
				//valuedeltacallt.Text = deltacall.ToString();
				//valuedeltaputt.Text = deltaput.ToString();
			}
			catch
			{
				//      lblAnswer.Text = "An error occurred";
			}
		}

	}
}