<!---Get news years--->
<cfquery datasource="hdStreet" name="rsNewsYears">
	<!---Use YEAR() function to get only the year--->
	SELECT YEAR(FLD_NEWSCREATIONDATE) AS FLD_NEWSYEARS
	FROM TBL_NEWS
	ORDER BY FLD_NEWSCREATIONDATE DESC 
</cfquery>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - News</title>
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
    	<!---Check if newsID parameter exists in URL --->
    	<cfif isDefined("url.newsID")>
    		<!---Query and output that single news--->
    		<cfquery datasource="hdStreet" name="rsSingleNews">
    			SELECT TBL_NEWS.FLD_NEWSCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_USERS.FLD_USERFIRSTNAME, TBL_USERS.FLD_USERLASTNAME
    			<!---INNER JOIN to take data only if it exists in both tables--->
    			FROM TBL_NEWS INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
    			WHERE FLD_NEWSID = #url.newsID#
    		</cfquery>
    		<cfoutput >
    			<h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
    			<p class="metadata">Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE, "mm/dd/yyyy")# by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#</p>
    			#rsSingleNews.FLD_NEWSCONTENT#
    		</cfoutput>
		<cfelse>
			<!---Output all news if url scope newsID not present in URL--->
			
			<!---Get all news --->
			<cfquery datasource="hdStreet" name="rsAllNews">
				SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
				FROM TBL_NEWS
				ORDER BY FLD_NEWSCREATIONDATE DESC 
			</cfquery>
			  <h1> News</h1>
		      <table>
				<!---Output  news in a table--->
				<!---Adding query attribute allows it to loop through--->
				<cfoutput query="rsAllNews">
					<tr>
						<td>#dateFormat(FLD_NEWSCREATIONDATE, 'mm/dd/yyyy')#</td>
						<td>#FLD_NEWSTITLE#</td>
						<td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
					</tr>
				</cfoutput>
		      </table>
	      </cfif>
	</div>
	<div id="calendarSideBar">
	<!---Change static <li> tags to use dynamic database content--->
	<h1>News archive</h1>
	      <ul>
	      	<!---group="FLD_NEWSYEARS" groups together similar years --->
	        <cfoutput query="rsNewsYears" group="FLD_NEWSYEARS">
	        	<!---#FLD_NEWSYEARS# comes from the SQL alias--->
	        	<li><a href="news.cfm?year=#FLD_NEWSYEARS#">#FLD_NEWSYEARS#</li>
	        </cfoutput>
	      </ul>
	      <p class="alignRight">&nbsp;</p>
	</div>
	</div>
	  <div id="footer">
	    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
	  </div>
	</div>
</body>
</html>