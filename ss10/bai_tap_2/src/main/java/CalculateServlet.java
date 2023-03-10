import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculateServlet", value = "/CalculateServlet")
public class CalculateServlet extends HttpServlet {
    Calculator calculator = new Calculator();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer firstOperand = Integer.parseInt(request.getParameter("one"));
        Integer secondOperand = Integer.parseInt(request.getParameter("two"));
        String operator= request.getParameter("operator");
        Integer result = calculator.calculate(firstOperand,secondOperand,operator);
        request.setAttribute("one",firstOperand);
        request.setAttribute("two",secondOperand);
        request.setAttribute("operator",operator);
        request.setAttribute("result",result);
        request.getRequestDispatcher("calculate.jsp").forward(request,response);
    }
}
