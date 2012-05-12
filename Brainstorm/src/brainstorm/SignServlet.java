package brainstorm;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.http.*;
import java.util.Date;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

public class SignServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(SignServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
    	
    	String linkID = req.getParameter("linkID");
    	if(linkID.equals("new question")){
    		Key qKey = KeyFactory.createKey("Question", "QuestionType");
    		String content = req.getParameter("content");
            Date date = new Date();
            Integer timeout = Integer.parseInt(req.getParameter("timeout"));
            
            Entity question = new Entity("Question", qKey);
            
            question.setProperty("date", date);
            question.setProperty("content", content);
            question.setProperty("timeout", timeout);
            
            DatastoreService datastore =
                    DatastoreServiceFactory.getDatastoreService();
            datastore.put(question);

            resp.sendRedirect("/brainstorm.jsp");
            return;
    	}else if(linkID.equals("track")){
    		Key qKey = KeyFactory.createKey("Question", "QuestionType");
    		String content = req.getParameter("content");
            Date date = new Date();
            Integer timeout = Integer.parseInt(req.getParameter("timeout"));
            
            Entity question = new Entity("Question", qKey);
            
            question.setProperty("date", date);
            question.setProperty("content", content);
            question.setProperty("timeout", timeout);
            
            DatastoreService datastore =
                    DatastoreServiceFactory.getDatastoreService();
            datastore.put(question);

            resp.sendRedirect("/brainstorm.jsp?lid=wtf");
            return;
    	}
    	
        String brainstormName = req.getParameter("brainstormName");
        Key brainstormKey = KeyFactory.createKey("Brainstorm", brainstormName);

        String content = req.getParameter("content");
        Date date = new Date();
        Integer timeout = Integer.parseInt(req.getParameter("timeout"));
        
        Entity greeting = new Entity("Greeting", brainstormKey);

        greeting.setProperty("date", date);
        greeting.setProperty("content", content);
        greeting.setProperty("timeout", timeout);
        greeting.setProperty("linkID", linkID);

        DatastoreService datastore =
                DatastoreServiceFactory.getDatastoreService();
        datastore.put(greeting);

        resp.sendRedirect("/brainstorm.jsp?lid="+linkID);
        		//+ "?brainstormName="
                //+ brainstormName);

        
    }
}
