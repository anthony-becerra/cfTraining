<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create an array using explicit notation--->
	<cfset aColors = arrayNew(1)/>
	<cfset aColors[1] = 'Red' />
	<cfset aColors[2] = 'White' />
	<cfset aColors[3] = 'Blue' />
	<p>Dump the explicit array</p>
	<cfdump var="#aColors#" label="Explicit Array" />
	
	<!---Step 2 - Create an array using the implicit array notation--->
	<cfset aColorsImplicit = ['Red', 'White', 'Blue'] />
	<p>Dump the implicit array</p>
	<cfdump var="#aColorsImplicit#" label="Implicit Array" />
	
	<!---Step 3 - use arrayLen()--->
    
	<h3>The aColors array contains <cfoutput>#arrayLen(aColors)#</cfoutput> Elements</h3>
    
	<!---Step 4 - use <cfloop> to loop over the array--->
    <cfoutput >
    	<cfloop from="1" to="#arrayLen(aColors)#" index="i">
    		#i# - #aColors[i]#<br />
    	</cfloop>
    </cfoutput>

	<!--- Step 5 - Use arrayAppend() and arrayPrepend() --->
	<br />
	<cfset arrayAppend(aColors,'Magenta')/>
	<cfset arrayPrepend(aColors,'Green')>
	<cfdump var="#aColors#" label="Explicit Array after append and prepend">
	<br />
	
	<!---Step 6 - Use arrayDeleteAt() --->
	<cfset arrayDeleteAt(aColors,5)>
	<cfdump var="#aColors#" label="Explicit Array after arrayDeleteAt position 5" >

</body>
</html>