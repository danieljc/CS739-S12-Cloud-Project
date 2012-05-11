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
String brainstormName = "QuestionText";
%>

    <form action="/sign" method="post">
      <div><textarea name="content" rows="3" cols="60"></textarea></div>
      <div><input type="submit" value="Post Greeting" /></div>
      <input type="hidden" name="brainstormName" value="<%= brainstormName %>"/>
    </form>
    
<%
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    Key brainstormKey = KeyFactory.createKey("Brainstorm", brainstormName);
    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Brainstorm.
    Query query = new Query("Greeting", brainstormKey).addSort("date", Query.SortDirection.DESCENDING);
    List<Entity> greetings = datastore.prepare(query).asList(FetchOptions.Builder.withDefaults());
    if (greetings.isEmpty()) {
        %>
        <p>No comments in '<%= brainstormName %>'.</p>
        <%
    } else {
        %>
        <p>Comments in '<%= brainstormName %>'.</p>
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