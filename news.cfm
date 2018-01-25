<!---Create instance of newsService component --->
<cfset newsService = createObject("component",'cfTraining.components.newsService' ) />
<!---Get news years--->
<cfset rsNewsYears = newsService.getNewsYears() />
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - News">
  <div id="pageBody">
    <div id="calendarContent">
    	<!---If newsID parameter exists in URL --->
    	<cfif isDefined("url.newsID")>
    		<!---Query and output that single news--->
    		<cfset rsSingleNews = newsService.getNewsByID(url.newsID) />
    		<cfoutput >
    			<h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
    			<p class="metadata">Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE, "mm/dd/yyyy")# by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#</p>
    			#rsSingleNews.FLD_NEWSCONTENT#
    		</cfoutput>
		<!---Elseif year parameter exists in URL--->
		<cfelseif isDefined('url.year')>
			<!---Query and output the news for that year--->
			<cfset rsNewsOfYear = newsService.getNewsForYear(url.year)/>
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
			<cfset rsAllNews = newsService.getLatestNews() />
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
</cfmodule>