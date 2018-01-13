<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Agenda</title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.html">Agenda</a></li>
      <li><a href="#">The Band</a>
        <ul>
          <li><a href="director.html">The director</a></li>
          <li><a href="history.html">The band History</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.html">We play for You</a></li>
      <li><a href="comePlayWithUs.html">Come play with us</a></li>
      <li><a href="news.html">News</a></li>
    </ul>
  </div>
  <div id="pageBody">
    <div id="calendarContent">
    	<!---CF now() function returns current datetime--->
    	<cfquery datasource="hdStreet" name="rsCurrentEvents">
    		SELECT FLD_EVENTID,FLD_EVENTNAME,FLD_EVENTDATETIME,FLD_EVENTLOCATION,FLD_EVENTVENUE
    		FROM TBL_EVENTS
    		WHERE FLD_EVENTDATETIME >= #now()#
    		ORDER BY FLD_EVENTDATETIME ASC 
    	</cfquery>
    	<cfdump var="#rsCurrentEvents#" >
<h1> Agenda</h1>
      <!---Chapter 4 - Remove static version of table and replace with dynamic version--->

      <!---Chapter 4 - To HERE--->
</div>
    <div id="calendarSideBar">
<h1>Next Event</h1>
      <div id="EventDetails">
        <p id="eventDate"><span id="month">Jul</span> <span id="days">19</span></p>
        <h2>Summer sounds Festival</h2>
      </div>
      <p> Phasellus ac justo sapien, vitae mattis  justo. Cras malesuada posuere ante, non eleifend magna auctor sit amet.  Cras placerat mi eu lectus viverra rutrum. </p>
      <p class="alignRight"><a href="events/20110719.html">Read More</a></p>
</div>
  </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
