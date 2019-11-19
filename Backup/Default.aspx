<%@ Page Language="C#" Inherits="AP.Default" %>


<html>
  <form id="Form1" runat="server">
      <link rel="stylesheet" href="style.css"> 
       <link href="style_main.css" rel="stylesheet">
	<link href="responsive.css" rel="stylesheet">
      <link rel="stylesheet" href="bootstrap.min.css">
      <script src="canvasjs.min.js"></script>
	
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
					<li class="active smooth-scroll"><a href="#home">Главная</a></li>
					<li class="smooth-scroll"><a href="#service">Услуги</a></li>
					<li class="smooth-scroll"><a href="#table_data">Калькулятор</a></li>
				
				</ul>
			</div>
		</div>
	</nav>
</header>
        <!--Home Section-->
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
					<h2>Наши <span>услуги</span></h2>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3  wow bounceIn">
				<div class="single-item text-center">
					<i class="fa fa-laptop"></i>
					<h4 class="text-uppercase">Разработка программ для опицонов</h4>

					<p>Разработка программ для оценки стоимости опционов.</p>
					<a href="#" class="btn btn-red text-uppercase">Далее</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow bounceInUp">
				<div class="single-item text-center">
					<i class="fa fa-globe"></i>
					<h4 class="text-uppercase">Разработка сайтов с калькуляторами</h4>

					<p>Разработка сайтов с калькуляторами стоимости опционов.</p>
					<a href="#" class="btn btn-red text-uppercase">Далее</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow pulse">
				<div class="single-item text-center">
					<i class="fa fa-cloud"></i>
					<h4 class="text-uppercase">Анализ алгоритмов</h4>

					<p>Анализ алгоритмов, используемых для оценки стоимости опционов.</p>
					<a href="#" class="btn btn-red text-uppercase">Далее</a>
				</div>
			</div>
			<div class="col-sm-6 col-md-3 wow shake">
				<div class="single-item text-center">
					<i class="fa fa-mobile"></i>
					<h4 class="text-uppercase">Сопровождение ПО</h4>

					<p>Сопровождение, разработанного нами ПО.</p>
					<a href="#" class="btn btn-red text-uppercase">Далее</a>
				</div>
			</div>
		</div>
	</div>
</section>


        <section id="table_data" >

        

        <h2>Расчет стоимости опционов  методом Блэка-Шоулса</h2> 
      <table class="table table-hover"  style=" margin-left:60px;">
<thead>
	<tr>
		<td>Показатели</td>
		<td class="black">Введенные данные</td>
		
	</tr>
</thead>
 
<tbody>
	<tr>
		<td >Цена базового актива</td>
		<td class="yellow" style=" margin-left:5px;"><asp:textbox id="spt" runat="server" /></td>
	</tr>
 <tr>
		<td >Цена страйк</td>
		<td class="grey" ><asp:textbox id="ept" runat="server" /> </td>
	</tr>
    <tr>
		<td >Безрисковая проц. ставка</td>
		<td class="yellow"><asp:textbox id="rfrt" runat="server" /></td>
	</tr>
	<tr>
		<td >Волатильность</td>
		<td class="grey"><asp:textbox id="sigmat" runat="server" /></td>
	</tr>
 <tr>
		<td >Время</td>
		<td class="yellow"><asp:textbox id="timet" runat="server" /> </td>
	</tr>
     
</tbody>
        
</table>
       
          <asp:button id="btn1" runat="server" text=" РАССЧИТАТЬ " Onclick="PickL" style=" margin-left:60px;" />
         
        <table class="table table-hover"    style=" margin-left:60px; margin-top:30px;" >
<thead>
	<tr>
		<td>Показатели</td>
		<td class="black">Колл</td>
        <td class="black">Пут</td>
		
	</tr>
</thead>
 
<tbody>
	<tr>
		<td >Цена опциона </td>
		<td class="yellow"><asp:textbox id="valuecallt" runat="server" /></td>
        <td class="yellow"><asp:textbox id="valueputt" runat="server" /> </td>
	</tr>
 
    <tr>
		<td >Дельта опциона</td>
		<td class="grey"><asp:textbox id="valuedeltacall" runat="server" /> </td>
        <td class="grey"><asp:textbox id="valuedeltaput" runat="server" /> </td>
	</tr>
    
    
    <tr>
		<td >Гамма опциона</td>
		<td class="yellow"><asp:textbox id="valuegammacall" runat="server" /> </td>
       	<td class="yellow"><asp:textbox id="valuegammaput" runat="server" /> </td>
	</tr>
   
    <tr>
		<td > Тэта колл опциона</td>
		<td class="grey"><asp:textbox id="valuethetacall" runat="server" /> </td>
        <td class="grey"><asp:textbox id="valuethetaput" runat="server" /> </td>
	</tr>
    
      <tr>
		<td > Рхо колл опциона</td>
		<td class="yellow"><asp:textbox id="valuerhocall" runat="server" /> </td>
          <td class="yellow"><asp:textbox id="valuerhoput" runat="server" /> </td>
	</tr>
  
    
</tbody>
</table>
         
        </section>

       
        <!-- footer-area-->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-2 text-center">
				<a href=""><img src="logo.png" alt="logo"></a>
			</div>
			<div class="col-sm-8">
				<div class="footer-p text-center">
					<p>© Copyright 2016 - 2017, All Rights Reserved, Designed by: Ann Vertinskaya</p>
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