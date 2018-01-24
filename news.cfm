<!---Get news years--->
<cfquery datasource="hdStreet" name="rsNewsYears">
	<!---Use YEAR() function to get only the year--->
	SELECT YEAR(FLD_NEWSCREATIONDATE) AS FLD_NEWSYEARS
	FROM TBL_NEWS
	ORDER BY FLD_NEWSCREATIONDATE DESC 
</cfquery>
<!---Include header --->
<cfinclude template="includes/header.cfm" >
  <div id="pageBody">
    <div id="calendarContent">
    	<!---If newsID parameter exists in URL --->
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
		<!---Elseif year parameter exists in URL--->
		<cfelseif isDefined('url.year')>
			<!---Query and output the news for that year--->
			<cfquery datasource="hdStreet" name="rsNewsOfYear">
				SELECT TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_NEWS.FLD_NEWSID
				FROM TBL_NEWS
				WHERE year(FLD_NEWSCREATIONDATE) = #url.year#
				ORDER BY FLD_NEWSCREATIONDATE DESC				
			</cfquery>
			<h1>All the news of the year <cfoutput>#url.year#</cfoutput></h1>
		      <table>
				<!---Output  news in a table--->
				<!---Adding query attribute allows it to loop through--->
				<cfoutput query="rsNewsOfYear">
					<tr>
						<td>#dateFormat(FLD_NEWSCREATIONDATE, 'mm/dd/yyyy')#</td>
						<td>#FLD_NEWSTITLE#</td>
						<td><a href="news.cfm?newsID=#FLD_NEWSID#">Read More</a></td>
					</tr>
				</cfoutput>
		      </table>
		<!---Else newsID parameter not present in URL --->
		<cfelse>
			<!---Query and output all news --->
			<cfquery datasource="hdStreet" name="rsAllNews">
				SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
				FROM TBL_NEWS
				ORDER BY FLD_NEWSCREATIONDATE DESC 
			</cfquery>
			  <h1>News</h1>
		      <table>
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
<cfinclude template="includes/footer.cfm" >