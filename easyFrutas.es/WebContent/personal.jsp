<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

tus datos son los siguientes!
${userLoged.getNombre()}<br>
${userLoged.getApellido()}<br>
${userLoged.getEmail()}<br>
${userLoged.getDireccion()}<br>
${userLoged.getTelefono()}<br>
${userLoged.getFechaReg()}<br>

<button onclick="window.location.href='ZonaUsuario?accion=modificarDatos'">Actualiza tus datos</button>





</body>
</html>