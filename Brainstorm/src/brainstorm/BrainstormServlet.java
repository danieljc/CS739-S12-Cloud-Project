package brainstorm;

import java.io.IOException;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class BrainstormServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		int today = 1;
		
		//if(user != null){
		resp.setContentType("text/plain");
		resp.getWriter().println("Bye Bye, world " + today);
		//}else
		//	resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
	}
}
