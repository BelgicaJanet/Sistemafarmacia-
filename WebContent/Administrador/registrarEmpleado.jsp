<%@page import="beans.DistritoBean"%>
<%@page import="beans.RolBean"%>
<%@page import="java.util.Vector"%>
<%@include file="menuPrincipal.jsp" %>
<%Vector<RolBean> cargo=(Vector<RolBean>)request.getAttribute("cargo");
Vector<DistritoBean> distrito=(Vector<DistritoBean>)request.getAttribute("distrito");%>
<script src="<%=request.getContextPath()%>/js/validCampo.js"></script>
<script src="<%=request.getContextPath()%>/js/valid.js"></script>
<link href="<%=request.getContextPath()%>/css/calendario.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/calendar.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/calendar-es.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/calendar-setup.js" type="text/javascript"></script>
<script>
	function validarexistente(){
		var dnivar = $('#dni').val();
		$.post('Usuario', {
			accion : 'verificarUsuarioExistente',
			dni: dnivar,
		}, function(responseText) {
			$('#resultado').html(responseText);
		});
	}
	function validarform(){
		var x=document.getElementById("dnicomp").value;
		if(form10.nombres.value==""||form10.distrito.value==""||form10.apellidoPaterno.value==""||form10.apellidoMaterno.value==""||form10.usuario.value==""||form10.clave.value==""||form10.dni.value==""||form10.fecha.value==""||form10.celular.value==""||form10.correo.value==""||form10.direccion.value==""){
		}else{
			if(x=='existente'){
				return false;
			}else{
				return true;
			}
		}
	}
	</script>
<div id="header"><h1>NUEVO EMPLEADO</h1></div>
	<div class="table-responsive" style="width: auto;">
  	<div id="tablapedido">
  		<form id="form10" name="form10" action="<%=request.getContextPath()%>/Usuario" method="post">
  		<table class="table table-hover">
 			<thead>
 			<tr class="btn-info">
 			<th style="width:100%; text-align: left;" valign="middle" colspan="4">GENERAL</th>
 			</tr>
 			</thead>
 			<tbody>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Cargo</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 					<select size="1" class="form-control" name="cargo" style="text-align: center;" required="required">
 					<%for(int i=0;i<cargo.size();i++){%>
 						<option value="<%=cargo.get(i).getCodRol()%>" <%if(cargo.get(i).getDescripcion().equals("Tecnico")){%>selected=selected<%}%> <%if(cargo.get(i).getDescripcion().equals("Cliente")){%>style="display: none;"<%}%>><%=cargo.get(i).getDescripcion()%></option>
 					<%}%>
 					</select>
 				</td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Direcci&oacute;n</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" id="letras1" style="text-align:center;" name="direccion" class="form-control" value="" required="required"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Nombres</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" name="nombres" id="letras2" class="form-control" style="text-align:center;" value="" required="required"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Distrito</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 					<select size="1" class="form-control" style="text-align: center;" name="distrito" required="required">
 					<option style="display: none;" value="">Seleccionar</option>
 					<%for(int i=0;i<distrito.size();i++){%>
 						<option value="<%=distrito.get(i).getCodDistrito()%>"><%=distrito.get(i).getNombre()%></option>
 					<%}%>
 					</select>
 				</td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Apellido Paterno</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" id="letras3" name="apellidoPaterno" style="text-align:center;" value="" required="required"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Usuario</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" style="text-align:center;" id="letras4" name="usuario" class="form-control" value="" required="required"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Apellido Materno</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" class="form-control" id="letras5" style="text-align:center;" name="apellidoMaterno" value="" required="required"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Password</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;"><input type="text" style="text-align:center;" id="letras9" class="form-control" value="" name="clave" required="required"></td>
 			</tr>
 			<tr>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>DNI</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;" ><input type="text" maxlength="8"  id="dni" class="form-control dnival" onblur="validarexistente();" style="text-align:center;" name="dni" value="" required="required"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Fecha de Nacimiento</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;">
 				<input type="text" class="form-control" style="text-align:center; cursor: pointer;" name="fecha" value="" id="fecha" required="required">
 				<script src="<%=request.getContextPath()%>/js/calendar-config.js" type="text/javascript"></script>
 				</td>
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
 				<td style="width:30%; text-align: left;  vertical-align:middle;" ><input type="text" maxlength="9" id="letras8" class="form-control" name="celular" style="text-align:center;" value="" required="required"></td>
 				<td style="width:20%; text-align: right; vertical-align:middle;"><b>Correo Electronico</b></td>
 				<td style="width:30%; text-align: left; vertical-align:middle;" ><input type="email" class="form-control" name="correo" style="text-align:center;" value="" required="required"></td>
 			</tr>
 			<tr>
 			<td style="width:100%; text-align: right; vertical-align:middle;" colspan="4">
 				<input type="hidden" name="accion" value="registrarEmpleado">
 				<button class="btn-large btn btn-info" onclick="return validarform();" type="submit"><b>Guardar</b></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<button class="btn btn-info" type="button" onclick="location.href='Usuario?accion=empleados'"><b>Cancelar</b></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<br><br>
 				<div id="resultado"></div>
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