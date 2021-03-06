package dto;

import java.io.Serializable;
import java.sql.Date;

import models.ModelEmpresa;
import models.ModelLogin;

public class ModelLoginDTO implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private String email;
	private String username;
	private String genero;
	private String userImage;
	private String cep;
	private String logradouro;
	private String bairro;
	private String cidade;
	private String uf;
	private boolean admin;
	private String perfil;
	private ModelEmpresa empresa;
	private Date dataNasc;

	public ModelLoginDTO(ModelLogin model) {
		this.setId(model.getId());
		this.setNome(model.getNome());
		this.setUser(model.getUser());
		this.setEmail(model.getEmail());
		this.setAdmin(model.isAdmin());
		this.setGenero(model.getGenero());
		this.setUserImage(model.getUserImage());
		this.setCep(model.getCep());
		this.setLogradouro(model.getLogradouro());
		this.setBairro(model.getBairro());
		this.setCidade(model.getCidade());
		this.setUf(model.getUf());
		this.setPerfil(model.getPerfil());
		this.setEmpresa(model.getEmpresa());
		this.setDataNasc(model.getDataNasc());
	}

	public ModelLoginDTO() {
	}

	public ModelEmpresa getEmpresa() {
		return empresa;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public void setEmpresa(ModelEmpresa empresa) {
		this.empresa = empresa;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser() {
		return username;
	}

	public void setUser(String user) {
		this.username = user;
	}
}
