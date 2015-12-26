<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% List<String> messages = (List<String>)pageContext.findAttribute("messages"); %>
<% if(messages != null && messages.size() > 0) { %>
	<div class="col-md-12">
		<p class="well red">
			<% for(String msg : messages) { %>
				<%= msg %><br>
			<% } %>
		</p>
	</div>
<% } %>
