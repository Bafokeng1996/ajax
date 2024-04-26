package ajax;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; // Import the necessary annotation
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet("/autocomplete")
public class AutoCompleteServlet extends HttpServlet {
    
    private final ComposerData compData = new ComposerData();
    private final HashMap<String, Composer> composers = compData.getComposers();

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuilder sb = new StringBuilder();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        boolean namesAdded = false;
        if (action != null && action.equals("complete")) {

            if (!targetId.equals("")) {

                for (String id : composers.keySet()) {
                    Composer composer = composers.get(id);
                    if (composer.getFirstName().toLowerCase().startsWith(targetId) ||
                            composer.getLastName().toLowerCase().startsWith(targetId) ||
                            (composer.getFirstName() + " " + composer.getLastName()).toLowerCase().startsWith(targetId)) {

                        sb.append("<composer>");
                        sb.append("<id>").append(composer.getId()).append("</id>");
                        sb.append("<firstName>").append(composer.getFirstName()).append("</firstName>");
                        sb.append("<lastName>").append(composer.getLastName()).append("</lastName>");
                        sb.append("</composer>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<composers>" + sb.toString() + "</composers>");
            } else {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action != null && action.equals("lookup")) {
            if (targetId != null && composers.containsKey(targetId.trim())) {
                request.setAttribute("composer", composers.get(targetId));
                request.getRequestDispatcher("/composer.jsp").forward(request, response);
            }
        }
    }
}
