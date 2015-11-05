<%@page import="beans.DistritoBean"%>
<%@page import="beans.RolBean"%>
<%@page import="java.util.Vector"%>
<%@include file="menuPrincipal.jsp" %>
<%UsuarioBean empleado=(UsuarioBean)request.getAttribute("empleado");
Vector<RolBean> cargo=(Vector<RolBean>)request.getAttribute("cargo");
Vector<DistritoBean> distrito=(Vector<DistritoBean>)request.getAttribute("distrito");%>
<script src="<%=request.getContextPath()%>/js/validCampo.js"></script>
<script src="<%=request.getContextPath()%>/js/valid.js"></script>
<link href="<%=request.getContextPath()%>/css/calendario.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/calendar.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/calendar-es.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/calendar-setup.js" type="text/javascript"></script>
<div id="header"><h1>DETALLE DE EMPLEADO</h1></div>
	<div class="table-responsive" style="width: auto;">
  	<div id="tablapedido">
  		<form action="<%=request.getContextPath()%>/Usuario" method="post">
  		<table class="table table-hover">
 			<thead>
 			<tr class="btn-info">
 			<th style="width:100%; text-align: left;" valign="middle" colspan="4">GENERAL</th>
 			</tr>
 			</thead>
 			<tbody>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Cod. de Empleado</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" name="id" style="text-align:center;" readonly="readonly" value="<%=empleado.getPersona().getCodPersona()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Direcci&oacute;n</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" style="text-align:center;" id="letras1" name="direccion" class="form-control" value="<%=empleado.getPersona().getDireccion()%>" required="required"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Cargo</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 					<select size="1" class="form-control" style="text-align: center;" name="cargo" required="required">
 					<%for(int i=0;i<cargo.size();i++){%>
 						<option value="<%=cargo.get(i).getCodRol()%>" <%if(cargo.get(i).getCodRol()==empleado.getCodRol()){%> selected="selected" <%}%> <%if(cargo.get(i).getDescripcion().equals("Cliente")){%>style="display: none;"<%}%>><%=cargo.get(i).getDescripcion()%></option>
 					<%}%>
 					</select>	
 				</td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Distrito</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 					<select size="1" class="form-control" style="text-align: center;" name="distrito" required="required">
 					<%for(int i=0;i<distrito.size();i++){%>
 						<option value="<%=distrito.get(i).getCodDistrito()%>" <%if(distrito.get(i).getCodDistrito()==empleado.getPersona().getCodDistrito()){%> selected="selected" <%}%>><%=distrito.get(i).getNombre()%></option>
 					<%}%>
 					</select>
 				</td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Nombres</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" id="letras2" name="nombres" required="required" style="text-align:center;" value="<%=empleado.getPersona().getNombres()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Usuario</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" style="text-align:center;" name="usuario" class="form-control" readonly="readonly" value="<%=empleado.getUsuario()%>"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Apellido Paterno</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" id="letras3" name="apellidoPaterno" required="required" style="text-align:center;" value="<%=empleado.getPersona().getApellidoPaterno()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Password</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="password" style="text-align:center;" id="letras9" name="clave" required="required" class="form-control" value="<%=empleado.getClave()%>"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Apellido Materno</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" id="letras5" name="apellidoMaterno" required="required" style="text-align:center;" value="<%=empleado.getPersona().getApellidoMaterno()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Fecha de Nacimiento</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 				<input type="text" class="form-control" style="text-align:center; cursor: pointer;" name="fecha" value="<%=empleado.getPersona().getFechaNacimiento()%>" id="fecha" required="required">
 				<script src="<%=request.getContextPath()%>/js/calendar-config.js" type="text/javascript"></script>
 				</td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>DNI</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;" ><input type="text" readonly="readonly" class="form-control" id="letras7" name="dni" maxlength="8" required="required" style="text-align:center;" value="<%=empleado.getPersona().getDni()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"></td>
 			</tr>
 			</tbody>
 			<thead>
 			<tr class="btn-info">
 			<th style="width:100%; text-align: left;" valign="middle" colspan="4">COMUNICACI&Oacute;N</th>
 			</tr>
 			</thead>
 			<tbody>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Celular</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;" ><input type="text" class="form-control" id="letras8" name="celular" maxlength="9" style="text-align:center;" required="required" value="<%=empleado.getPersona().getCelular()%>"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Correo Electronico</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;" ><input type="email" class="form-control" name="correo" required="required" style="text-align:center;" value="<%=empleado.getPersona().getCorreo()%>"></td>
 			</tr>
 			<tr>
 			<td style="width:100%; text-align: right; vertical-align:middle;" colspan="4">
 				<input type="hidden" name="accion" value="modificarUsuario">
 				<button class="btn-large clickSubmit btn btn-info"><b>Guardar</b></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<button class="btn btn-info" type="button" onclick="location.href='Usuario?accion=empleados'"><b>Cancelar</b></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			</td>
 			</tr>
 			</tbody>
  		</table>
  		</form>
	</div>
</div>
</div>
</body>
</html>
<%}%>