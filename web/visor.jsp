<%-- 
    Document   : visor
    Created on : 25-oct-2014, 21:45:04
    Author     : Ger
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="index" scope="session" class="Entidad.datos"  />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                background-color: activecaption;
                border: 1px;
                width: 600px;
                height: 600px;
                margin: 0 auto;
            }
            .viva{
                background-color: blue;
            }
            .muerta{
                background-color: activecaption;
            }
            body{
                background-color: lavender;
            }
            #id2{
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
        <% if (request.getParameter("tiempoGeneracion") == null) { %>

        <form method="POST" action="visor.jsp" >
            <b>Avanzar X generacion</b>:<input type="number" name="tiempoGeneracion" value="1"/>          
            <input type="submit" value="Jugar"/> 
        </form>
          <% index.primigenea_Generacion();%>
        <%} else { %>
        <div id="id2">
            <form method="POST" action="visor.jsp">
                <b>Avanzar X generacion</b>:<input type="number" name="tiempoGeneracion" value="1" />          
                <input type="submit" value="Jugar"/> 
            </form>
            <%! private int hacer_X_Generaciones;%>
            <%  hacer_X_Generaciones = Integer.parseInt(request.getParameter("tiempoGeneracion"));%>
            <jsp:setProperty name="index" property="avance" value="<%= hacer_X_Generaciones%>" />

            <% index.evolucion_De_Generaciones();%>
            <%}%>
            <table border="1">
                <%! private int fila, columna;
                             %> 
                <%  for (fila = 1; fila < index.getX() - 1; fila++) {%>
                <tr>   
                    <%  for (columna = 1; columna < index.getY() - 1; columna++) {%>
                    <% if (index.getCelulas()[fila][columna] == 1) {%>
                    <td class="viva">    
                        <%} else { %>   
                    <td class="muerta"> 
                        <% } %>
                    </td>                
                    <% } %>
                </tr>    
                <% }%>    
            </table> 
        </div>
    </body>
</html>