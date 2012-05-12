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

<a href="../brainstorm.jsp">Back</a>

<%
String brainstormName = "TopLevel"; //"QuestionText";


    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    Key qKey = KeyFactory.createKey("Brainstorm", "TopLevel");
    //Key qKey = KeyFactory.createKey("Question", "QuestionType");

    Query query = new Query("Greeting", qKey).addSort("date", Query.SortDirection.DESCENDING);
    List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
    if (greetings.isEmpty()) {
        %>
        <p>No tracks in store.</p>
        <%
    } else {
        %>
        <p>Tracks</p>
        <%
        for (Entity greeting : greetings) {
            %>
            <blockquote><%= greeting.getProperty("content") %></blockquote>
            <%
        }
    }
%>


  </body>
</html>
