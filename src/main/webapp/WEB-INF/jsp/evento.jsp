<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
	<jsp:include page="template/head.jsp"/>
    <body>
        <div class="container">            
            <jsp:include page="template/navbar.jsp"/>   
            <div class="row">
				<div class="col-md-12">
					<jsp:include page="template/user.jsp" />
				</div>
			</div>          
            <div class="row">
                <div class="col-md-8 main-content">
                    <div>   
                    	<div class="panel panel-default">
                            <div class="panel-body">
                                <div class="page-header">
                                    <h1 class="page-header-main">
                                        <t:message code="page.evento.titulo"/>
                                        <i class="icon-envelope"></i>
                                    </h1>       
                                </div>                                
                                <f:form id="form-registro-evento" method="post" action="registrar-evento.html" commandName="evento" >
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">
                                            	<t:message code="page.evento.label.fecha"/>
                                            </label>
                                            <div class="col-lg-10">
                                            	<f:hidden path="fechaEvento" id="fecha-evento"/>    
                                            	<t:message code="page.evento.placeholder.fecha" var="placeholder_fecha"/>                                        	
                                            	<div class="input-group date" id="dpFechaEvento" data-date-format="DD, d MM yy">
													<input class="form-control" type="text" readonly="" placeholder="${placeholder_fecha}"/>
													<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
												</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
											<label class="col-lg-2 control-label"> 
												<t:message code="page.evento.label.titulo" />
											</label>
											<div class="col-lg-10">
												<t:message code="page.evento.placeholder.titulo"
													var="placeholder_titulo" />
												<f:input path="titulo" cssClass="form-control"
													id="inputTitulo" placeholder="${placeholder_titulo}" />
											</div>
										</div>
                                        <div class="form-group">
                                            <label for="inputDescripcion" class="col-lg-2 control-label">
                                            	<t:message code="page.evento.label.descripcion"/>
                                            </label>
                                            <div class="col-lg-10">
                                            	<t:message code="page.evento.placeholder.descripcion" var="placeholder_descripcion"/>
                                            	<f:textarea path="descripcion" cssClass="form-control" id="inputDescripcion" 
                                            	placeholder="${placeholder_descripcion}" rows="3"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10"> 
                                                <button type="button" class="btn btn-default">
                                                	<t:message code="btn.default.limpiar" />
                                               	</button>
                                               	<button type="submit" class="btn btn-primary pull-right">
                                                	<t:message code="btn.default.registar" />
                                               	</button>
                                            </div>
                                        </div>
                                    </div>
                                </f:form>
                            </div>
                        </div>                     
                    </div>
                </div>
                <jsp:include page="template/sidemain.jsp"/>     
            </div>
            <jsp:include page="template/footer.jsp"/>
        </div>
        <script type="text/javascript">
			$(function(){
				$(".input-group.date").datepicker({ 
					autoclose: true, 
					todayHighlight: true,
					language: 'es'
				});

				$("#form-registro-evento").on('submit', function(e){		
					var date = $('#dpFechaEvento').datepicker('getDate');
				 	$('#fecha-evento').val(date);
				});
			});
        </script>
    </body>
</html>