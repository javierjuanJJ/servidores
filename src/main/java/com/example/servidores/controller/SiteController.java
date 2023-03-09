package com.example.servidores.controller;

import com.example.servidores.dao.DbConnection;
import com.example.servidores.dao.ServidorDao;
import com.example.servidores.model.Servidor;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


public class SiteController extends HttpServlet {
    /**
     * Controller que sirve para mostrar la página principal de la aplicacion. Se encarga de mandar al index.jsp
     * un objeto de tipo List con las 3 ultimos servidores
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd;        
        DbConnection conn = new DbConnection();
        ServidorDao servidorDao = new ServidorDao(conn);
        List<Servidor> lista = servidorDao.getUltimos();
        conn.disconnect();
        request.setAttribute("ultimos", lista);
        rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

}
