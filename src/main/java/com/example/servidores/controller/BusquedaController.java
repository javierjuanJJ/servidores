package com.example.servidores.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.servidores.dao.DbConnection;
import com.example.servidores.dao.ServidorDao;
import com.example.servidores.model.Servidor;

public class BusquedaController extends HttpServlet {
    /**
     * Metodo POST para hacer la busqueda de servidores solicitados por el usuario.
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recibimos la cadena de busqueda del usuario
        String q = request.getParameter("query");               
        List<Servidor> lista = null;
        DbConnection conn = new DbConnection();
        // Con nuestro objeto DAO, hacemos la busqueda de servidores
        ServidorDao servidorDao = new ServidorDao(conn);
        lista = servidorDao.getByQuery(q);
        conn.disconnect();
        RequestDispatcher rd;
        request.setAttribute("servidores", lista);
        rd = request.getRequestDispatcher("/servidores.jsp");
        rd.forward(request, response);
    }

}
