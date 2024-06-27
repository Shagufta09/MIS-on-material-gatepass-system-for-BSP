<html>
<head>
<title>Gate Pass Form</title>
</head>
<body>
<h1>Gate Pass Form</h1>

<form method="post" action="submit.jsp">
<table>
<tr>
<td>VENDOR NO:</td>
<td>
<select name="VENDOR_NO">
<option value="1000000149">1000000149</option>
</select>
</td>
</tr>
<tr>
<td>DOC TYPE:</td>
<td>
<select name="DOC_TYPE">
<option value="157">157</option>
<option value="158">158</option>
</select>
</td>
</tr>
<tr>
<td>MOVEMENT TYPE:</td>
<td>
<select name="MOVEMENT_TYPE">
<option value="IN">IN</option>
<option value="OUT">OUT</option>
</select>
</td>
</tr>
<tr>
<td>DATE FROM:</td>
<td>
<input type="date" name="DATE_FROM" />
</td>
</tr>
<tr>
<td>DATE TO:</td>
<td>
<input type="date" name="DATE_TO" />
</td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="Submit" /></td>
</tr>
</table>
</form>
</body>
</html>