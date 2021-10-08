<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <title>Projeto JSP</title>
    <!-- custom CSS -->
    <link href="<%= request.getContextPath() %>/css/cadastro-usuario.css" type="text/css" rel="stylesheet" />
    <jsp:include page="fragments/head.jsp"></jsp:include>
</head>

  <body>
  <!-- Loading da página -->
  <jsp:include page="fragments/pre-loader.jsp"></jsp:include>
  
  <!-- Containers Wrappers -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <!-- Main Header -->
          <jsp:include page="fragments/header.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  
                  <!-- Menu SideBar -->
                  <jsp:include page="fragments/sidebar-menu.jsp"></jsp:include>
                  
                  <!-- Wrapper Content -->
                  <div class="pcoded-content">
                  
                      <!-- Page-header -->
                      <jsp:include page="fragments/page-header.jsp"></jsp:include>
                      
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">                     
                                        	<div class="col-md-12 shadow">
                                        		<div class="card">
                                        			<div class="card-header">
                                                        <h5>Formulário de usuários</h5>
                                                    </div>
                                                    <div class="alert alert-info text-center" role="alert">
														<span id="msg">
															${msg}
														</span>
													</div>
                                        			<div class="card-block">
                                        				<form enctype="multipart/form-data" action="<%= request.getContextPath() %>/ServletUserController" method="post" class="form-material" id="form-user">
                                        					<!-- INPUT DE DELEÇÃO -->
                                        					<input type="hidden" name="acao" value="" id="acao" />
                                        					<c:if test="${userDto.id != null}">
	                                        					<div class="form-group form-default form-static-label">
	                                        						<input type="text" name="id" id="id" class="form-control" value="${userDto.id}" placeholder="Aqui vai o id" required="required" readonly="readonly">
	                                        						<span class="form-bar"></span>
	                                        						<label class="float-label">Id</label>
	                                        					</div>
                                        					</c:if>
                                        					<div class="form-group form-default form-static-label">
                                        						<input type="text" name="nome" id="nome" class="form-control" value="${userDto.nome}" placeholder="Digite o seu nome" required="required">
                                        						<span class="form-bar"></span>
                                        						<label class="float-label">Nome completo</label>
                                        					</div>
                                        					<div class="form-group">
                                        						<label class="form-label">Gênero: </label>
                                        						<br>
                                        						<input type="radio" name="genero" id="sexo-m" value="masculino" required="required" ${userDto.genero=='masculino' ? 'checked' : ''}> Masculino
                                        						<input type="radio" name="genero" id="sexo-f" value="feminino" required="required" <c:if test="${userDto.genero=='feminino'}">checked</c:if>> Feminino
                                        						<input type="radio" name="genero" id="sexo-o" value="outros" required="required" ${userDto.genero=='outros' ? 'checked' : ''}> Outros
                                        						<span class="form-bar"></span>
                                        					</div>
                                        					<hr>
                                        					<div class="form-group form-default form-static-label">
                                        						<input type="email" name="email" id="email" class="form-control" value="${userDto.email}" placeholder="Digite o seu e-mail" required="required">
                                        						<span class="form-bar"></span>
                                        						<label class="float-label">email</label>
                                        					</div>
                                        					<div class="form-group form-default form-static-label">
                                                                 <select name="perfil" id="perfil" class="form-control" required>
                                                                     <option value="" ${userDto.perfil == null ? 'disabled selected hidden' : ''}>Selecione o perfil de usuário</option>
                                                                     <option value="administrador" ${userDto.perfil == "administrador" ? 'selected' : ''}>Administrador</option>
                                                                     <option value="colaborador" ${userDto.perfil == "colaborador" ? 'selected' : ''}>Colaborador</option>
                                                                     <option value="cliente" ${userDto.perfil == "cliente" ? 'selected' : ''}>Cliente</option>
                                                                 </select>
                                                                 <span class="form-bar"></span>
                                        						<label class="float-label">Perfil</label>
                                        					</div>
                                        					<div class="form-group form-default form-static-label row">
                                        						<div class="col-md-4">
	                                        						<input type="text" name="cep" id="cep" class="form-control" value="${userDto.cep}" placeholder="Digite o seu CEP">
	                                        						<span class="form-bar"></span>
	                                        						<label class="float-label">CEP</label>
	                                        					</div>
	                                        					<div class="col-md-8">
	                                        						<input type="text" name="logradouro" id="logradouro" class="form-control" value="${userDto.logradouro}" placeholder="Logradouro">
                                        							<span class="form-bar"></span>
                                        							<label class="float-label">Logradouro</label>
	                                        					</div>
                                        					</div>
                                        					<div class="form-group form-default form-static-label row">
                                        						<div class="col-md-4">
                                        							<input type="text" name="bairro" id="bairro" class="form-control" value="${userDto.bairro}" placeholder="Bairro">
	                                        						<span class="form-bar"></span>
	                                        						<label class="float-label">Bairro</label>
                                        						</div>
                                        						<div class="col-md-4">
                                        							<input type="text" name="cidade" id="cidade" class="form-control" value="${userDto.cidade}" placeholder="Cidade">
	                                        						<span class="form-bar"></span>
	                                        						<label class="float-label">Cidade</label>
                                        						</div>
                                        						<div class="col-md-4">
                                        							<input type="text" name="uf" id="uf" class="form-control" value="${userDto.uf}" placeholder="UF">
	                                        						<span class="form-bar"></span>
	                                        						<label class="float-label">UF</label>
                                        						</div>
                                        					</div>
                                        					<div class="form-group form-default form-static-label">
                                        						<c:choose>
                                       								<c:when test="${userDto.userImage != null}">
		                                        						<img alt="img perfil" id="img64" src="${userDto.userImage}" width="70px" class="my-2 img-fluid">                                    						                                       								
                                       								</c:when>
                                       								<c:otherwise>
                                       								    <img alt="img perfil" id="img64" src="<%=request.getContextPath()%>/principal/files-upload/default/profile.png" width="70px" class="my-2 img-fluid"> 								
                                       								</c:otherwise>
                                        						</c:choose>
                                        						<input type="file" name="userImage" id="fileImg" accept="image/*" onchange="vizualizaImg('img64', 'fileImg')" class="form-control my-2">
                                        						<span class="form-bar"></span>
                                        						<label class="float-label">Foto de perfil</label>
                                        					</div>
                                        					<div class="form-group form-default form-static-label">
                                        						<input type="text" name="user" id="user" class="form-control" value="${userDto.user}" placeholder="Digite o seu nick" required="required">
                                        						<span class="form-bar"></span>
                                        						<label class="float-label">Nome de usuário</label>
                                        					</div>
                                        					<div class="form-group form-default form-static-label">
                                        						<input type="password" name="password" id="password" class="form-control" required="required">
                                        						<span class="form-bar"></span>
                                        						<label class="float-label">Senha</label>
                                        					</div>
                                        					<div class="d-flex flex-row-reverse">
                                        						<button type="submit" class="btn btn-primary waves-effect waves-light">Salvar</button>
                                        						<button type="reset" onclick="limpaForm()" id="btn-limpaTela"  class="btn btn-warning waves-effect waves-light mx-2">Novo</button>
                                        						<button type="button" onclick="deletarComAjax()" class="btn btn-danger waves-effect waves-light mx-2">Remover</button>
																<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pesquisarUserModal">Pesquisar</button>
                                        					</div>
                                        				</form>
                                        			</div>
                                        		</div>
                                        	
                                        	</div>
                                        </div>
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
    <!-- Avisos de navegador desatualizado -->
    <jsp:include page="fragments/warnings.jsp"></jsp:include>
    
    <!-- Js -->
    <jsp:include page="fragments/main-javascript.jsp"></jsp:include>
    
     <!-- Modal -->
	<div class="modal fade" id="pesquisarUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Pesquisar usuário</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="input-group mb-3">
			  <input type="text" class="form-control" id="usernamePesquisa" name="username" placeholder="Nome" aria-label="nome de usuário" aria-describedby="basic-addon2">
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" onclick="pesquisaUser()">Pesquisar</button>
			  </div>
			</div>
			<div class="scrollable">
				<table class="table table-sm table-striped">
				  <thead>
				    <tr>
				      <th scope="col">id</th>
				      <th scope="col">Nome</th>
				      <th scope="col">Usuário</th>
				      <th scope="col">Email</th>
				      <th scope="col">ações</th>
				    </tr>
				  </thead>
				  <tbody>
				    
				  </tbody>
				</table>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <!-- Funcões -->
    <script type="text/javascript">
    	
    	/* function deletar(){
    		document.getElementById("form-user").method = 'get';
    		document.getElementById("acao").value = 'excluirUser';
    		document.getElementById("form-user").submit;
    	} */
    	
    	$(".alert-info").hide();
    	
    	var msg_0 = $("#msg").html();
     	
    	if(msg_0 != null && msg_0.trim().length > 0){
    		$(".alert-info").show();
    	}
    	
    	function showMsg(msg){
    		$(".alert-info").show();
    		$("#msg").text(msg);
    	}
    	
    	function acaoForm(){
    		if($("#id").val != null){
	    		event.preventDefault();
	    		$.confirm({
	    		    title: 'Cadastro de telefones.',
	    		    content: 'Deseja cadastrar os telefones para este usuário agora?',
	    		    buttons: {
	    		        sim: function () {
	    		        	$("#form-user").removeAttr("onsubmit");
	    		        	
	    		        	$("#acao").val("cadastraTelefones")
	    		        	
	    		        	$("#form-user").trigger( "submit" );
	    		        },
	    		        não: function () {
	    		        	$("#form-user").removeAttr("onsubmit");
	    		            $("#form-user").trigger( "submit" );
	    		        },   
	    		    }
	    		});
    		}else{
    			$("#form-user").removeAttr("onsubmit");
	            $("#form-user").trigger( "submit" );
    		}
    	}
    	
    	function limpaForm(){
    		$.confirm({
    		    title: 'Confirmação!',
    		    content: 'Deseja limpar os campos do formulário?',
    		    buttons: {
    		        sim: function () {
    		        	  $("#id").attr('value', "");
    		    		  $("#nome").attr('value', "");
    		    		  $("#email").attr('value', "");
    		    		  $("#user").attr('value', "");
    		    		  $("#password").attr('value', "");
    		    		  $("#perfil").attr('value', "");
    		    		  $("#cep").attr('value', "");
    		    		  $("#logradouro").attr('value', "");
    		    		  $("#cidade").attr('value', "");
    		    		  $("#bairro").attr('value', "");
    		    		  $("#uf").attr('value', "");
    		    		  $("#genero").attr('value', "");
    		    		  $("#userImage").attr('value', "");
    		    		  $("#img64").attr('src', "<%=request.getContextPath()%>/principal/files-upload/default/profile.png");
    		    		  showMsg('Formulário limpo!');
    		        },
    		        não: function () {
    		            $.alert('Ação cancelada!');
    		        },   
    		    }
    		});	
    	}
    	
    	function selectUser(obj){
    		$("#pesquisarUserModal").modal('hide');
    		$(obj).each(function(index, element) {
    		  $("#id").attr('value', element.id);
    		  $("#nome").attr('value', element.nome);
    		  $("#email").attr('value', element.email);
    		  $("#user").attr('value', element.user);  
    		  $("#perfil").attr('value', element.perfil);
    		  $("#cep").attr('value', element.cep);
    		  $("#logradouro").attr('value', element.logradouro);
    		  $("#cidade").attr('value', element.cidade);
    		  $("#bairro").attr('value', element.bairro);
    		  $("#uf").attr('value', element.uf);
    		  $("#userImage").attr('value', "");
    		  $("#img64").attr('src', element.userImage);
    		  switch(element.genero){
    		  	case 'masculino': $("#sexo-m").prop('checked', true);
    		  		break;
    		  	case 'feminino': $("#sexo-f").prop('checked', true);
    		  		break;
    		  	case 'outros': $("#sexo-o").prop('checked', true);
    		  		break;
    		  }
    		});
    	}
    	
    	function pesquisaUser(){
    		var userP = $("#usernamePesquisa").val();
    		
    		if(userP !=null && userP != "" && userP.trim() != ""){
    			var urlAction = $("#form-user").attr("action");
            	
	        	$.ajax({
	        		
	        		method: "get",
	        		url: urlAction,
	        		data: "nomeP="+userP+"&acao=buscarComAjax",
	        		success: function (response){
	        			
	        			$(".modal-dialog").css({
	        				'max-width': $(document).width() * 0.5
	        			});
	        			
	        			$(".scrollable")
	        				.css({
	        					'max-height': '38em',
								'overflow': 'scroll'
							});
	        			
						var jsonResult = JSON.parse(response);
						
						$(".table-sm > tbody > tr").remove();
						
						for(var i = 0; i < jsonResult.length; i++){
							
							var user = JSON.stringify(jsonResult[i]);
							var txt = '<tr>';
							txt += '<td>'+jsonResult[i].id+'</td>';
							txt += '<td>'+jsonResult[i].nome+'</td>';
							txt += '<td>'+jsonResult[i].user+'</td>';
							txt += '<td>'+jsonResult[i].email+'</td>';
							txt += "<td><button onclick='selectUser("+user+")' type='button' class='btn btn-secondary btn-sm'>Selecionar</button></td>";
							txt += '</tr>';
							
							$(".table-sm > tbody").append(txt);
						}
	        			
	        		}
	        		
	        	}).fail(function(xhr, status, errorThrown){
	        		$.alert({
	        		    title: 'ERRO!',
	        		    content: 'erro ao buscar por nome: '+xhr.textResponse
	        		});
	        	});
    		}
    	}
    	
   		function deletar(){
    		$.confirm({
    		    title: 'Confirmação!',
    		    content: 'Deseja excluir o cadastro atual?',
    		    buttons: {
    		        sim: function () {
    		        	$("#form-user").attr("method", "get");
    	    			$("#acao").attr("value", "excluirUser");
    	    			$("#form-user").submit();
    		        },
    		        não: function () {
    		            $.alert('Ação cancelada!');
    		        },   
    		    }
    		});	
   		}
    	
    	function deletarComAjax(){
    		
    		var idUser = $("#id").attr("value");
    		
    		if(idUser == null || idUser == ""){
    			showMsg("Nenhum dado informado!");
    		}else{
    			$.confirm({
        		    title: 'Confirmação!',
        		    content: 'Deseja excluir o cadastro atual?',
        		    buttons: {
        		        sim: function () {
        		        	
        		        	var urlAction = $("#form-user").attr("action");
        	
        		        	$.ajax({
        		        		
        		        		method: "get",
        		        		url: urlAction,
        		        		data: "id="+idUser+"&acao=deletarComAjax",
        		        		success: function (response){
        		        			$("#id").attr('value', "");
        	    		    		$("#nome").attr('value', "");
        	    		    		$("#email").attr('value', "");
        	    		    		$("#user").attr('value', "");
        	    		    		$("#password").attr('value', "");
        		        			
        		        			showMsg(response);
        		        		}
        		        		
        		        	}).fail(function(xhr, status, errorThrown){
        		        		$.alert({
        		        		    title: 'ERRO!',
        		        		    content: 'erro ao deletar por id: '+xhr.textResponse
        		        		});
        		        	});
        		        	
        		        },
        		        não: function () {
        		            $.alert('Ação cancelada!');
        		        },   
        		    }
        		});	
    		} 		
    		
    	}
    	
    	function vizualizaImg(img64, fileImg){
    		
    		var preview = document.getElementById("img64");
    		var fileUser = document.getElementById("fileImg").files[0];
    		var reader = new FileReader();
    		
    		reader.onloadend = function(){
    			preview.src = reader.result;
    		};
    		
    		if (fileUser){
    			reader.readAsDataURL(fileUser);
    		}else{
    			preview.src = '';
    		}
    	}
    	
    	//Quando o campo cep perde o foco.
    	$("#cep").blur(function() {

    	    //Nova variável "cep" somente com dígitos.
    	    var cep = $(this).val().replace(/\D/g, '');

    	    //Verifica se campo cep possui valor informado.
    	    if (cep != "") {

    	        //Expressão regular para validar o CEP.
    	        var validacep = /^[0-9]{8}$/;

    	        //Valida o formato do CEP.
    	        if(validacep.test(cep)) {

    	            //Preenche os campos com "..." enquanto consulta webservice.
    	            $("#rua").val("...");
    	            $("#bairro").val("...");
    	            $("#cidade").val("...");
    	            $("#uf").val("...");
    	            $("#ibge").val("...");

    	            //Consulta o webservice viacep.com.br/
    	            $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

    	                if (!("erro" in dados)) {
    	                    //Atualiza os campos com os valores da consulta.
    	                    $("#logradouro").val(dados.logradouro);
    	                    $("#bairro").val(dados.bairro);
    	                    $("#cidade").val(dados.localidade);
    	                    $("#uf").val(dados.uf);
    	                } //end if.
    	                else {
    	                    //CEP pesquisado não foi encontrado.
    	                    limpa_formulário_cep();
    	                    alert("CEP não encontrado.");
    	                }
    	            });
    	        } //end if.
    	        else {
    	            //cep é inválido.
    	            alert("Formato de CEP inválido.");
    	        }
    	    } //end if.
    	    else {
    	        //cep sem valor, limpa formulário.
    	        limpa_formulário_cep();
    	    }
    	});
    
    </script>
</body>
</html>