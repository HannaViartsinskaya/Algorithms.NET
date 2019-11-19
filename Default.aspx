<%@ Page Language="C#" Inherits="AP.Default" MaintainScrollPositionOnPostback="true" %>


<html>
  <form id="Form1" runat="server">
      <link rel="stylesheet" href="style.css"> 
       <link href="style_main.css" rel="stylesheet">
	<link href="responsive.css" rel="stylesheet">
      <link rel="stylesheet" href="bootstrap.min.css">
        <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,600' rel='stylesheet' type='text/css'>
      
      <script src="canvasjs.min.js"></script>
      <link rel="stylesheet" href="font-awesome.css">
	
	<body>
        
        <header>
	 <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="logo.png" alt=""></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="active smooth-scroll"><a href="#home">Home</a></li>
					<li class="smooth-scroll"><a href="#service">Services</a></li>
					<li class="smooth-scroll"><a href="#table_data">Calculator</a></li>
				
				</ul>
			</div>
		</div>
	</nav>
</header>
        
<!--Home Section-->
<section id="home">
	<div class="overlay"></div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!--Indicator-->
		<img src="main.jpg" alt="">
		

	</div>

</section>
       <!--SERVICES AREA-->
<section id="service">
	<div class="container">
		<div class="row">
			<div class="col-md-12  wow bounce">
				<div class="section-heading text-center text-uppercase  wow bounceInUp">
					<h2>We offer<span></span></h2>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3  wow bounceIn">
				<div class="single-item1 text-center">
					<i class="fa fa-area-chart"></i>
					<h4 class="text-uppercase">Derivatives</h4>
				
					<p>Financial models for option pricing pricing.</p>
					<a id="first" onclick="removeElementForAll(this)" href="#Section1" class="btn btn-red text-uppercase">Next</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow bounceInUp">
				<div class="single-item2 text-center">
					<i class="fa fa-percent "></i>
					<h4 class="text-uppercase">Volatility</h4>

					<p>Implied volatility modelling for options.</p>
					<a id="second" onclick="removeElementForAll(this)" href="#Section2" class="btn btn-red text-uppercase">Next</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow pulse">
				<div class="single-item text-center">
					<i class="fa fa-line-chart "></i>
					<h4 class="text-uppercase">Interest rates</h4>

					<p>Stochastic models for interest rates.</p>
					<a id="third" onclick="removeElementForAll(this)" href="#Section4" class="btn btn-red text-uppercase">Next</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow shake">
				<div class="single-item4 text-center">
					<i class="fa fa-tags  "></i>
					<h4 class="text-uppercase">Price indicator</h4>

					<p>Predictor of the market price direction.</p>
					<a id="fourth" onclick="removeElementForAll(this)" href="#Section6" class="btn btn-red text-uppercase">Next</a>
				</div>
			</div>
		</div>
	</div>
</section>

        <!--Калькулятор1-->
        <section id="Section1">
	<div class="container">
		<div class="row">
			<div class="col-md-12  wow bounce">
				<div class="section-heading text-center text-uppercase  wow bounceInUp">
					<h2>Solution for the <span>European Option</span> </h2> 
				</div>
			</div>
		</div>
	</div>
        <section id="table_data" >

        

        
      <table class="table table-hover"  style=" margin-left:60px; margin-top:20px;">
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Input data</td>
		
	</tr>
</thead>
 
<tbody>
	<tr>
		<td >Price of the underlying asset</td>
		<td class="yellow" style=" margin-left:5px;"><asp:textbox id="S_txt" runat="server" /></td>
	</tr>
 <tr>
		<td >Strike price</td>
		<td class="grey" ><asp:textbox id="K_txt" runat="server" /> </td>
	</tr>
    <tr>
		<td >Risk-free rate</td>
		<td class="yellow"><asp:textbox id="r_txt" runat="server" /></td>
	</tr>
	<tr>
		<td >Volatility</td>
		<td class="grey"><asp:textbox id="v_txt" runat="server" /></td>
	</tr>
 <tr>
		<td >Time to expiry</td>
		<td class="yellow"><asp:textbox id="T_txt" runat="server" /> </td>
	</tr>
     
</tbody>
        
</table>
       <!--button-->
          <asp:button id="btn1" runat="server" text=" CALCULATE "  
  Onclick="PickL"    style=" margin-left:60px;" />
            
         
        <table class="table table-hover"    style=" margin-left:60px; margin-top:30px;" >
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Call Price</td>
        <td class="black">Put Price</td>
		
	</tr>
</thead>
 

	<tr>
		<td >Option Price</td>
		<td class="yellow"><asp:textbox id="call_txt" runat="server" /></td>
        <td class="yellow"><asp:textbox id="put_txt" runat="server" /> </td>
	</tr>
 
 <!--   <tr>
		<td >Option Delta</td>
		<td class="grey"><asp:textbox id="call_delta_txt" runat="server" /> </td>
        <td class="grey"><asp:textbox id="put_delta_txt" runat="server" /> </td>
	</tr>
    
    
    <tr>
		<td >Option Gamma</td>
		<td class="yellow"><asp:textbox id="call_gamma_txt" runat="server" /> </td>
       	<td class="yellow"><asp:textbox id="put_gamma_txt" runat="server" /> </td>
	</tr>
   
    <tr>
		<td >Option Theta</td>
		<td class="grey"><asp:textbox id="call_theta_txt" runat="server" /> </td>
        <td class="grey"><asp:textbox id="put_theta_txt" runat="server" /> </td>
	</tr>
    
      <tr>
		<td >Option Rho</td>
		<td class="yellow"><asp:textbox id="call_rho_txt" runat="server" /> </td>
          <td class="yellow"><asp:textbox id="put_rho_txt" runat="server" /> </td>
	</tr>
  -->
    </table> 

     
        </section>
            </section>


     
          <!--Калькулятор2-->
        <section id="Section2">
	<div class="container">
		<div class="row">
			<div class="col-md-12  wow bounce">
				<div class="section-heading text-center text-uppercase  wow bounceInUp">
					<h2>Solution for the <span>Asian Option</span> </h2> 
				</div>
			</div>
		</div>
	</div>
        <section id="Section3" >
  <table class="table table-hover"  style=" margin-left:60px; margin-top:20px;">
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Input data</td>
		
	</tr>
</thead> 
<tbody>
	<tr>
		<td >Price of the underlying asset</td>
		<td class="yellow" style=" margin-left:5px;"><asp:textbox id="Textbox1" runat="server" /></td>
	</tr>
 <tr>
		<td >Strike price</td>
		<td class="grey" ><asp:textbox id="Textbox2" runat="server" /> </td>
	</tr>
    <tr>
		<td >Risk-free rate</td>
		<td class="yellow"><asp:textbox id="Textbox3" runat="server" /></td>
	</tr>
	<tr>
		<td >Volatility</td>
		<td class="grey"><asp:textbox id="Textbox4" runat="server" /></td>
	</tr>
 <tr>
		<td >Time to expiry</td>
		<td class="yellow"><asp:textbox id="Textbox5" runat="server" /> </td>
	</tr>
     
</tbody>
        
</table>
       <!--button-->
          <asp:button id="Button1" runat="server" text=" CALCULATE " Onclick="PickL" style=" margin-left:60px;" />
         
        <table class="table table-hover"    style=" margin-left:60px; margin-top:30px;" >
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Call Price</td>
        <td class="black">Put Price</td>
		
	</tr>
</thead>
 

	<tr>
		<td >Option Price</td>
		<td class="yellow"><asp:textbox id="Textbox6" runat="server" /></td>
        <td class="yellow"><asp:textbox id="Textbox7" runat="server" /> </td>
	</tr>


  
</table>      
        </section>
            </section>

          <!--Калькулятор3-->
        <section id="Section4">
	<div class="container">
		<div class="row">
			<div class="col-md-12  wow bounce">
				<div class="section-heading text-center text-uppercase  wow bounceInUp">
					<h2>Solution for the <span>3 Option</span> </h2> 
				</div>
			</div>
		</div>
	</div>
        <section id="Section5" >
  <table class="table table-hover"  style=" margin-left:60px; margin-top:20px;">
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Input data</td>
		
	</tr>
</thead> 
<tbody>
	<tr>
		<td >Price of the underlying asset</td>
		<td class="yellow" style=" margin-left:5px;"><asp:textbox id="Textbox8" runat="server" /></td>
	</tr>
 <tr>
		<td >Strike price</td>
		<td class="grey" ><asp:textbox id="Textbox9" runat="server" /> </td>
	</tr>
    <tr>
		<td >Risk-free rate</td>
		<td class="yellow"><asp:textbox id="Textbox10" runat="server" /></td>
	</tr>
	<tr>
		<td >Volatility</td>
		<td class="grey"><asp:textbox id="Textbox11" runat="server" /></td>
	</tr>
 <tr>
		<td >Time to expiry</td>
		<td class="yellow"><asp:textbox id="Textbox12" runat="server" /> </td>
	</tr>
     
</tbody>
        
</table>
       <!--button-->
          <asp:button id="Button2" runat="server" text=" CALCULATE " Onclick="PickL" style=" margin-left:60px;" />
         
        <table class="table table-hover"    style=" margin-left:60px; margin-top:30px;" >
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Call Price</td>
        <td class="black">Put Price</td>
		
	</tr>
</thead>
 

	<tr>
		<td >Option Price</td>
		<td class="yellow"><asp:textbox id="Textbox13" runat="server" /></td>
        <td class="yellow"><asp:textbox id="Textbox14" runat="server" /> </td>
	</tr>

  
  
</table>      
        </section>
            </section>

        <!--Калькулятор4-->
        <section id="Section6">
	<div class="container">
		<div class="row">
			<div class="col-md-12  wow bounce">
				<div class="section-heading text-center text-uppercase  wow bounceInUp">
					<h2>Solution for the <span>4 Option</span> </h2> 
				</div>
			</div>
		</div>
	</div>
        <section id="Section7" >
  <table class="table table-hover"  style=" margin-left:60px; margin-top:20px;">
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Input data</td>
		
	</tr>
</thead> 
<tbody>
	<tr>
		<td >Price of the underlying asset</td>
		<td class="yellow" style=" margin-left:5px;"><asp:textbox id="Textbox15" runat="server" /></td>
	</tr>
 <tr>
		<td >Strike price</td>
		<td class="grey" ><asp:textbox id="Textbox16" runat="server" /> </td>
	</tr>
    <tr>
		<td >Risk-free rate</td>
		<td class="yellow"><asp:textbox id="Textbox17" runat="server" /></td>
	</tr>
	<tr>
		<td >Volatility</td>
		<td class="grey"><asp:textbox id="Textbox18" runat="server" /></td>
	</tr>
 <tr>
		<td >Time to expiry</td>
		<td class="yellow"><asp:textbox id="Textbox19" runat="server" /> </td>
	</tr>
     
</tbody>
        
</table>
       <!--button-->
          <asp:button id="Button3" runat="server" text=" CALCULATE " Onclick="PickL" style=" margin-left:60px;" />
         
        <table class="table table-hover"    style=" margin-left:60px; margin-top:30px;" >
<thead>
	<tr>
		<td>Parameters</td>
		<td class="black">Call Price</td>
        <td class="black">Put Price</td>
		
	</tr>
</thead>
 

	<tr>
		<td >Option Price</td>
		<td class="yellow"><asp:textbox id="Textbox20" runat="server" /></td>
        <td class="yellow"><asp:textbox id="Textbox21" runat="server" /> </td>
	</tr>

  
  
</table>      
        </section>
            </section>

         <script>
             



             var x = 0;
             var y = 0;
             var z = 0;
             var t = 0;
             function removeElementForAll(obj) {
                 var id = obj.id;
                
                
                 // при вызове функции счетчик увеличился на единицу...
                 if (id == "first")
                 {

                     x++;
                     y=0;
                     z=0;
                     t=0;
                     if (x % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section1").style.display = "block";
                         document.getElementById("table_data").style.display = "block";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                     if (x % 2 == 0) {  // если же 2/2 = 1 без остатка
                         document.getElementById("S_txt").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                 }
                 if (id == "second") {
                     x=0;
                     y++;
                     z=0;
                     t=0;
                     if (y % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "block";
                         document.getElementById("Section3").style.display = "block";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                     else {  // если же 2/2 = 1 без остатка
                         document.getElementById("S_txt").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                 }

                 if (id == "third") {
                     x=0;
                     y=0;
                     z++;
                     t=0;
                     if (z % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "block";
                         document.getElementById("Section5").style.display = "block";
                     }
                     else {  // если же 2/2 = 1 без остатка
                         document.getElementById("S_txt").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                 }
                 if (id == "fourth") {
                     x=0;
                     y=0;
                     z=0;
                     t++;
                     if (t % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "block";
                         document.getElementById("Section7").style.display = "block";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     } else {  // если же 2/2 = 1 без остатка
                         document.getElementById("S_txt").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                 }

             }



                 function DeleteElem()
                 {
                     document.getElementById("S_txt").value = " ";
                 }

                 var x = 0; // Это будет счетчик нажатия на кнопку...
                /* function removeElement1() {
                     x++; // при вызове функции счетчик увеличился на единицу...
                 
                     if (x % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section1").style.display = "block";
                         document.getElementById("table_data").style.display = "block";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     } else {  // если же 2/2 = 1 без остатка
                         document.getElementById("S_txt").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                     }
                 }*/
           
                 window.onload=function DeleteElem()
                 {
                     var s = document.getElementById("S_txt").value;
                     var s2 = document.getElementById("Textbox1").value;
                     var s3 = document.getElementById("Textbox8").value;
                     var s4 = document.getElementById("Textbox15").value;
                     // var valuecall = document.getElementById("call_txt").value;
                     if(s==0 && s2==0 && s3==0 && s4==0)
                     {
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                     if(s!=0 )
                     {
                         document.getElementById("Section1").style.display = "block";
                         document.getElementById("table_data").style.display = "block";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                     if (s == 0 && s2 == 0 && s3 == 0 && s4 == 0) {
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                     if (s2 != 0) {
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "block";
                         document.getElementById("Section3").style.display = "block";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                     if (s3 != 0) {
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "block";
                         document.getElementById("Section5").style.display = "block";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }

                     if (s4 != 0) {
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "block";
                         document.getElementById("Section7").style.display = "block";
                     }
                 }

             

             
             
                 function removeAllElementsExcept1() {
                     document.getElementById("Section1").style.display = "block";
                     document.getElementById("table_data").style.display = "block";
                     document.getElementById("Section2").style.display = "none";
                     document.getElementById("Section3").style.display = "none";
              

                 }

        /*         var z = 0; // Это будет счетчик нажатия на кнопку...
                 function removeElement2() {
                 
                     z++; // при вызове функции счетчик увеличился на единицу...
                     if (z % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section2").style.display = "block";
                         document.getElementById("Section3").style.display = "block";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     } else {  // если же 2/2 = 1 без остатка
                         document.getElementById("Textbox1").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                 }

                 var y = 0; // Это будет счетчик нажатия на кнопку...
                 function removeElement3() {
                
                     y++; // при вызове функции счетчик увеличился на единицу...
                     if (y % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section4").style.display = "block";
                         document.getElementById("Section5").style.display = "block";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     } else {  // если же 2/2 = 1 без остатка
                         document.getElementById("Textbox8").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                 }

                 var t = 0; // Это будет счетчик нажатия на кнопку...
                 function removeElement4() {
                 
                     t++; // при вызове функции счетчик увеличился на единицу...
                     if (t % 2 !== 0) { // "Если длина остатка от деления не равна нулю (1/2 = 0.5)"
                         document.getElementById("Section6").style.display = "block";
                         document.getElementById("Section7").style.display = "block";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                     } else {  // если же 2/2 = 1 без остатка
                         document.getElementById("Textbox15").value = " ";
                         document.getElementById("Section1").style.display = "none";
                         document.getElementById("table_data").style.display = "none";
                         document.getElementById("Section2").style.display = "none";
                         document.getElementById("Section3").style.display = "none";
                         document.getElementById("Section4").style.display = "none";
                         document.getElementById("Section5").style.display = "none";
                         document.getElementById("Section6").style.display = "none";
                         document.getElementById("Section7").style.display = "none";
                     }
                 }*/

         </script>
       
        <!-- footer-area-->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-2 text-center">
				<a href=""><img src="logo.png" alt="logo"></a>
			</div>
			<div class="col-sm-8">
				<div class="footer-p text-center">
					<p>Copyright 2016 - 2017, All Rights Reserved, Designed by: Ann Vertinskaya</p>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="footer-social text-center">
					<a href=""><i class="fa fa-facebook"></i></a>
					<a href=""><i class="fa fa-twitter"></i></a>
					<a href=""><i class="fa fa-instagram"></i></a>
					<a href=""><i class="fa fa-google-plus"></i></a>
					<a href=""><i class="fa fa-rss"></i></a>
				</div>
			</div>
		</div>
	</div>
</footer>

	</body>

  </form>
</html>