<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>

<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  <body>

<%
String brainstormName = "TopLevel";
%>

Enter a question and the number of minutes it will remain available.
</p>

    <form action="/sign" method="post">
      <div><textarea name="content" rows="5" cols="50"></textarea></div>
      <div> Timeout Value: <input type="int" name="timeout" min="1" value="15" /> </div>
      <div><input type="submit" value="Post Question" /></div>
      <input type="hidden" name="brainstormName" value="<%= brainstormName %>"/>
      <input type="hidden" name="linkID" value="new question"/>
    </form>
   

  </body>
</html>