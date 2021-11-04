package servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dao.DAOChamadoRepository;
import dao.DAOEmpresaRepository;
import dao.DAOLoginRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ModelChamado;
import models.ModelLogin;

@WebServlet({ "/ServletChamadoController", "/principal/abrir-chamado/", "/principal/ver-chamados/", "/principal/ver-conluidos" })
public class ServletChamadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DAOLoginRepository userRepo = new DAOLoginRepository();
	private DAOEmpresaRepository empresaRepo = new DAOEmpresaRepository();
	private DAOChamadoRepository chamadoRepo = new DAOChamadoRepository();
	
    public ServletChamadoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//perfil de usuário
		String userPerfil = (String) request.getSession().getAttribute("perfilUser");
		
		//Abrir chamado page
		if(request.getRequestURI().contains("/principal/abrir-chamado/")) {
			request.getRequestDispatcher("/principal/abrir-chamado.jsp").forward(request, response);	
		}
		
		//Ver chamados page
		else if (request.getRequestURI().contains("/principal/ver-chamados/")) {
			
			List<ModelChamado> chamadosAbertos = new ArrayList<ModelChamado>();
			List<ModelChamado> chamadosEmAtendimento = new ArrayList<ModelChamado>();
			List<ModelChamado> chamadosEmPendencia = new ArrayList<ModelChamado>();
			
			//CHAMADOS CLIENTE
			if(userPerfil != null && !userPerfil.isEmpty() && userPerfil.equalsIgnoreCase("cliente")) {
				Long userId = (Long) request.getSession().getAttribute("userId");
				chamadosAbertos = chamadoRepo.findAllByCliente(userId, "aberto");				
				chamadosEmAtendimento = chamadoRepo.findAllByCliente(userId, "Em atendimento");				
				chamadosEmPendencia = chamadoRepo.findAllByCliente(userId, "pendencia");				
				request.setAttribute("chamadosAbertos", chamadosAbertos);
				request.setAttribute("chamadosEmAtendimento", chamadosEmAtendimento);
			}
			
			//CHAMADOS ADMINISTRADOR
			else if(userPerfil != null && !userPerfil.isEmpty() && userPerfil.equalsIgnoreCase("administrador")) {
				Long empresaId = (Long) request.getSession().getAttribute("empresaUserSession");
				chamadosAbertos = chamadoRepo.findAllByEmpresaResp(empresaId, "aberto");				
				chamadosEmAtendimento = chamadoRepo.findAllByEmpresaResp(empresaId, "Em atendimento");		
				request.setAttribute("chamadosAbertos", chamadosAbertos);
				request.setAttribute("chamadosEmAtendimento", chamadosEmAtendimento);
			}
			
			request.getRequestDispatcher("/principal/ver-chamados.jsp").forward(request, response);	
			return;
		
		}else if(request.getRequestURI().contains("/principal/ver-conluidos")) {
		
			List<ModelChamado> chamadosConcluidos = new ArrayList<ModelChamado>();
			
			//Concluídos do cliente
			if(userPerfil != null && !userPerfil.isEmpty() && userPerfil.equalsIgnoreCase("cliente")) {
				Long userId = (Long) request.getSession().getAttribute("userId");
				chamadosConcluidos = chamadoRepo.findAllByCliente(userId, "concluido");						
				request.setAttribute("chamadosConcluidos", chamadosConcluidos);
			}
			
			//Concluídos administrador
			else if(userPerfil != null && !userPerfil.isEmpty() && userPerfil.equalsIgnoreCase("administrador")) {
				Long empresaId = (Long) request.getSession().getAttribute("empresaUserSession");
				chamadosConcluidos = chamadoRepo.findAllByCliente(empresaId, "concluido");						
				request.setAttribute("chamadosConcluidos", chamadosConcluidos);
			}
			
			request.getRequestDispatcher("/principal/ver-concluidos.jsp").forward(request, response);	
			return;
			
		}else if(request.getRequestURI().contains("/ServletChamadoController")) {
			
			String acao = request.getParameter("acao");
			
			//Ações Servlet
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				
				Long id = Long.parseLong(request.getParameter("id") != null ? request.getParameter("id") : null);
				
				chamadoRepo.deleteById(id);
				
				response.getWriter().write("Chamado excluido com sucesso");
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("verChamado")) {
				
				Long id = Long.parseLong(request.getParameter("id") != null ? request.getParameter("id") : null);

				ModelChamado chamado = chamadoRepo.findById(id);
				
				request.setAttribute("chamado", chamado);
				request.getRequestDispatcher("/principal/ver-chamado.jsp").forward(request, response);
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("alteraStatus")) {
				
				String chamadoId = request.getParameter("chamadoId");
				Long id = Long.parseLong(chamadoId);
				String status = request.getParameter("status");
				Long userId = (Long) request.getSession().getAttribute("userId");
				
				chamadoRepo.alteraStatus(id, status, userId);				
			}
			
		} 
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//parâmetros do form
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		
		//parametros da Session
		Long empresaCliente = (Long) request.getSession().getAttribute("empresaUserSession");
		String username = (String) request.getSession().getAttribute("usuario");
		
		ModelChamado chamado = new ModelChamado();
		chamado.setTitulo(titulo);
		chamado.setDescricao(descricao);
		chamado.setCliente(userRepo.searchByUser(username));
		chamado.setEmpresaCliente(empresaRepo.findById(empresaCliente));
		chamado.setEmpresaResp(empresaRepo.findEmpresaResp(empresaCliente));
		chamado.setCriadoEm(LocalDateTime.now());
		chamado.setStatus("aberto");
		
		try {
			
			chamadoRepo.save(chamado);
			
			request.setAttribute("msg", "Chamado registrado com êxito");
			request.getRequestDispatcher("/principal/abrir-chamado.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}