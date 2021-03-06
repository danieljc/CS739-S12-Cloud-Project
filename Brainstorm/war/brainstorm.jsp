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

<a href="../generator.jsp">Add a new questions.</a>

<a href="../trackList.jsp">Track List</a>

<%
String brainstormName = "TopLevel"; //"QuestionText";


    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    //Key brainstormKey = KeyFactory.createKey("Brainstorm", brainstormName);
    Key qKey = KeyFactory.createKey("Question", "QuestionType");
    
    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Brainstorm.
    //Query query = new Query("Greeting", brainstormKey).addSort("date", Query.SortDirection.DESCENDING);

    Query query = new Query("Question", qKey).addSort("date", Query.SortDirection.DESCENDING);
    List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
    if (greetings.isEmpty()) {
        %>
        <p>No questions in store.</p>
        <%
    } else {
        %>
        <p>Active Questions</p>
        <%
        for (Entity greeting : greetings) {
            %>
            <blockquote><a href="../trackAdder.jsp?QID=<%= greeting.getProperty("content").hashCode() %>">
            <%= greeting.getProperty("content") %></a></blockquote>
            <blockquote><%= greeting.getProperty("date") %></blockquote>
            <%
        }
    }
%>


  </body>
</html>
