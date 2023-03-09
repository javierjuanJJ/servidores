<%@ page import="com.example.servidores.dao.DbConnection" %>
<%@ page import="com.example.servidores.model.Solicitud" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.servidores.dao.SolicitudDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Lista de todas las Solicitudes</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/justified-nav.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">

      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <h3 class="text-muted">Administración</h3>
        <nav>
          <ul class="nav nav-justified">
            <li><a href="admin?action=crear">Alta de Servidor</a></li>
            <li><a href="servidor?action=lista">Servidores</a></li>             
            <li><a href="solicitud?action=solicitudes">Solicitudes</a></li>                        
            <li><a href="admin?action=logout">Salir</a></li>            
          </ul>
        </nav>
      </div>
      <br>

      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><b>Lista de solicitudes recibidas</b></h3>
        </div>
        <div class="panel-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="left">Fecha</th>
                <th>Nombre</th>
                <th>Email</th>                
                <th>Teléfono</th>
                <th>Ubicación</th>
                <th>Servidor solicitado</th>
                <th>Adjuntos</th>
              </tr>
            </thead>
            <tbody>
              <% DbConnection dbConnection = new DbConnection();
                List<Solicitud> solicitudes = new SolicitudDao(dbConnection).getAll();
                for (Solicitud solicitud : solicitudes) {
              %>
<%--              <c:forEach items="${solicitudes}" var="solicitud" varStatus="status">--%>
                <tr>
                  <td class="left"><%= solicitud.getFecha() %></td>
                  <td><%= solicitud.getNombre() %></td>
                  <td><%= solicitud.getEmail() %></td>
                  <td><%= solicitud.getTelefono() %></td>
                  <td><%= solicitud.getDireccion() %></td>
                  <td><%= solicitud.getServidor().getNombre() %></td>
                  <td>
                    <left>   
                      <!-- Mostramos un link para el archivo subido por el usuario. El nombre del archivo lo tenemos
                      guadado en el campo archivo de la tabla solicitud y estan almacenados en la carpeta uploads en nuestro
                      directorio raiz de nuestra aplicacion.
                      -->
                      <a href="uploads/<%= solicitud.getArchivo() %>" target="_blank">
                        <img src="images/download.png" title="Descargar adjunto">
                      </a>
                    </left>
                  </td>                                      
                </tr>
<%--              </c:forEach>                      --%>
                <% }
                  dbConnection.disconnect();%>
            </tbody>           
          </table>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2017 JASR.</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>
