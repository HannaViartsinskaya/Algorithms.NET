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
		
		//public class OptionPricing
		//{

		//	public static int ITMAX = 100;
		//	public static double EPS = 3.0e-7;  // don't use 3.0d-7
		//	public static double pricep;

		//	static public double normPDF(double x)
		//	{
		//		return (1.0 / (Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x);
		//	}


		//	// Приближение к интегральной функции распределения для стандартного нормального распределения
		//	static public double normCDF(double x)
		//	{
		//		double k = 1.0 / (1.0 + 0.2316419 * x);
		//		double k_sum = k * (0.319381530 + k * (-0.356563782 + k * (1.781477937 + k * (-1.821255978 + 1.330274429 * k))));
		//		if (x >= 0.0)
		//		{
		//			return (1.0 - (1.0 / (Math.Pow(2 * Math.PI, 0.5))) * Math.Exp(-0.5 * x * x) * k_sum);
		//		}
		//		else
		//		{
		//			return 1.0 - normCDF(-x);
		//		}
		//	}

		//	//Этот термин появляется в закрытой форме решения для европейского колл или пут опциона
		//	static public double dJ(int j, double S, double K, double r, double v, double T)
		//	{
		//		return (Math.Log(S / K) + (r + (Math.Pow(-1, j - 1)) * 0.5 * v * v) * T) / (v * (Math.Pow(T, 0.5)));
		//	}

		//	//Вычисление Европейский колл акций базирующийся на цене базового актива, цене страйк, безрисковая процентная ставка, влатильности и времени
		//	static public double callPrice(double S, double K, double r, double v, double T)
		//	{
		//		return S * normCDF(dJ(1, S, K, r, v, T)) - K * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
		//	}

		//	//Вычисление Европейский пут акций базирующийся на цене базового актива, цене страйк, безрисковая процентная ставка, влатильности и времени
		//	static public double putPrice(double S, double K, double r, double v, double T)
		//	{
		//		return -S * normCDF(-dJ(1, S, K, r, v, T)) + K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
		//	}


		//	static public double call_delta(double S, double K, double r, double v, double T)
		//	{
		//		return normCDF(dJ(1, S, K, r, v, T));
		//	}
		//	static public double call_gamma(double S, double K, double r, double v, double T)
		//	{
		//		return normPDF(dJ(1, S, K, r, v, T)) / (S * v * Math.Sqrt(T));
		//	}
		//	static public double call_vega(double S, double K, double r, double v, double T)
		//	{
		//		return S * normPDF(dJ(1, S, K, r, v, T)) * Math.Sqrt(T);
		//	}
		//	static public double call_theta(double S, double K, double r, double v, double T)
		//	{
		//		return -(S * normPDF(dJ(1, S, K, r, v, T)) * v) / (2 * Math.Sqrt(T))
		//		  - r * K * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
		//	}
		//	static public double call_rho(double S, double K, double r, double v, double T)
		//	{
		//		return K * T * Math.Exp(-r * T) * normCDF(dJ(2, S, K, r, v, T));
		//	}
		//	static public double put_delta(double S, double K, double r, double v, double T)
		//	{
		//		return normCDF(dJ(1, S, K, r, v, T)) - 1;
		//	}
		//	static public double put_gamma(double S, double K, double r, double v, double T)
		//	{
		//		return call_gamma(S, K, r, v, T); // Identical to call by put-call parity
		//	}
		//	static public double put_vega(double S, double K, double r, double v, double T)
		//	{
		//		return call_vega(S, K, r, v, T); // Identical to call by put-call parity
		//	}
		//	static public double put_theta(double S, double K, double r, double v, double T)
		//	{
		//		return -(S * normPDF(dJ(1, S, K, r, v, T)) * v) / (2 * Math.Sqrt(T))
		//		  + r * K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
		//	}
		//	static public double put_rho(double S, double K, double r, double v, double T)
		//	{
		//		return -T * K * Math.Exp(-r * T) * normCDF(-dJ(2, S, K, r, v, T));
		//	}
		//}
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
				double S = Convert.ToDouble(S_txt.Text);
				double K = Convert.ToDouble(K_txt.Text);
				double r = Convert.ToDouble(r_txt.Text);
				double v = Convert.ToDouble(v_txt.Text);
				double T = Convert.ToDouble(T_txt.Text);

				Option option = new Option(S, K, r, v, T);
				double callPrice =  option.europeanCall();
				double putPrice = option.europeanPut();

				//double deltacall = nd1;
				//double deltaput = nd1 - 1.0;
				double deltaCall = 0.0;
				double gammaCall = 0.0;
				double thetaCall = 0.0;
				double rhoCall = 0.0;
				double deltaPut = 0.0;
				double gammaPut = 0.0;
				double thetaPut = 0.0;
				double rhoPut = 0.0;

				call_txt.Text = callPrice.ToString();
				put_txt.Text = putPrice.ToString();
				call_delta_txt.Text = deltaCall.ToString();
				put_delta_txt.Text = deltaPut.ToString();
				call_gamma_txt.Text = gammaCall.ToString();
				put_gamma_txt.Text = gammaPut.ToString();
				call_theta_txt.Text = thetaCall.ToString();
				put_theta_txt.Text = thetaPut.ToString();
				call_rho_txt.Text = rhoCall.ToString();
				put_rho_txt.Text = rhoPut.ToString();


				var callPrice1 = option.europeanCall();
				var putPrice1 = option.europeanPut();
				var callPrice2 = option.europeanCall();
				var putPrice2 = option.europeanPut();
             

			}
			catch
			{
				//      lblAnswer.Text = "An error occurred";
			}
		}
       /* public void Delete(object sender, EventArgs e) 
        {
            S_txt.Text = " ";
            K_txt.Text = " ";
            r_txt.Text = " ";
            v_txt.Text = " ";
            T_txt.Text = "";
            call_txt.Text = " ";
            put_txt.Text = " ";

        }*/

	}
}