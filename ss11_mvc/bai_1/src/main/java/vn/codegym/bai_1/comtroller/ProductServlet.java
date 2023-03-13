package vn.codegym.bai_1.comtroller;

import vn.codegym.bai_1.model.Product;
import vn.codegym.bai_1.service.IProductService;
import vn.codegym.bai_1.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static jdk.nashorn.internal.objects.NativeString.search;


@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "edit":
                showUpdateForm(request,response);
                break;
            case "view":
                showViewForm(request,response);
            default:
                listProduct(request, response);
        }

    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.getProductById(id);
        request.setAttribute("product", product);
        response.sendRedirect("/detail.jsp");
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.sendRedirect("update.jsp");
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.disPlay();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    public void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("create.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "delete":

                break;
            case "edit":
                update(request,response);
                break;
            case "search":
                searchList(request,response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void searchList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> products = new ArrayList<>();
//        String name = request.getParameter("searchName");
//        for (Product product : productService.search(name)){
//            products.add(product);
//        }
//        request.setAttribute("products",products);
//        request.getRequestDispatcher("search.jsp").forward(request,response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String information =request.getParameter("infor");
        String producer =request.getParameter("producer");
        Product productU = new Product(id, name, price,information,producer);
        productService.update(id, productU);
        request.setAttribute("productU" ,productU);
        request.getRequestDispatcher("update.jsp").forward(request,response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String information = request.getParameter("information");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, information, producer);
        productService.create(product);
        response.sendRedirect("/product");
    }
}
