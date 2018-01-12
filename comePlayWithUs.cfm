<!---Get page content for fld_pageID = 4--->
<cfquery datasource="hdStreet" name="rsPage">
	SELECT FLD_PAGETITLE, FLD_PAGECONTENT
	FROM TBL_PAGES
	WHERE FLD_PAGEID = 4 AND FLD_PAGEISACTIVE = 1
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Come play with us</title>
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
    <!---Insert database content from here--->
	<cfoutput>
		<h1>#rsPage.FLD_PAGETITLE#</h1>
		#rsPage.FLD_PAGECONTENT#
	</cfoutput>
    <!---To here--->
	</div>
	<div id="calendarSideBar">
		<h2>Complete the form below to join our band</h2>
		<form id="frm_newUser" action="mailto:name@company.com">
				<fieldset>
					<legend>Join our band</legend>
					<dl>
						<dt><label>First Name</label></dt>
						<dd><input type="text" name="fld_userFirstName" id="fld_userFirstName" /></dd>
						<dt><label>Last Name</label></dt>
						<dd><input type="text" name="fld_userLastName" id="fld_userLastName" /></dd>
						<dt><label>E-mail Address</label></dt>
						<dd><input  type="text" name="fld_userEmail" id="fld_userEmail" /></dd>
						<dt><label>Instrument</label></dt>
						<dd>
							<select name="fld_userInstrument" id="fld_userInstrument" >
								<option value="0">Please choose your instrument</option>
								<option value="1">Flute</option>
								<option value="1">Oboe</option>
								<option value="3">Clarinet</option>
								<option value="4">Saxophone</option>
								<option value="5">Trumpet</option>
								<option value="6">Trombone</option>
								<option value="7">Tuba</option>
								<option value="8">String bass</option>
								<option value="9">Harp</option>
								<option value="10">Percussion</option>
								<option value="11">Other</option>
							</select>
						</dd>
						<dt><label>Comment</label></dt>
						<dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
					</dl>
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band" />
				</fieldset>
			</form>
	</div>
	</div>
 </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
