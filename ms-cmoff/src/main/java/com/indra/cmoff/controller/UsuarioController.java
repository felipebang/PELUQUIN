package com.indra.cmoff.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.indra.cmoff.dto.PaginatedFilter;
import com.indra.cmoff.dto.PersonaDTO;
import com.indra.cmoff.dto.RegistroCortesDTO;
import com.indra.cmoff.dto.UsuarioDTO;
import com.indra.cmoff.dto.UsuarioRolDTO;
import com.indra.cmoff.service.IPersonaService;
import com.indra.cmoff.service.IRolService;
import com.indra.cmoff.service.IUsuarioRolService;
import com.indra.cmoff.service.IUsuarioService;
import com.indra.cmoff.utils.util.Constantes;
import com.indra.cmoff.utils.util.ConstantesRolesMP;

@RestController
@RequestMapping(path = "/usuarios")
@PreAuthorize("hasRole('"+ConstantesRolesMP.ROLE_ADM+"')")
@CrossOrigin(origins = "*", methods= {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE, RequestMethod.OPTIONS})
public class UsuarioController {
	
	private HashMap<String, Object> jsonResponse = new HashMap<>();
	private String messageResponse;
	private HttpStatus statusResponse;
	
	@Autowired
	PasswordEncoder encoder;
	private final IUsuarioService usuarioService;
	private final IRolService rolService;
	private final IPersonaService PersonaService;
	private final IUsuarioRolService usuarioRolService; 
	
	public UsuarioController(IUsuarioService usuarioService, IRolService rolService, IPersonaService PersonaService, IUsuarioRolService usuarioRolService) {
		this.usuarioService = usuarioService;
		this.rolService = rolService;
		this.PersonaService = PersonaService;
		this.usuarioRolService = usuarioRolService;
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_L +"')")
	@GetMapping("/{id}")
	public Optional<UsuarioDTO> one(@PathVariable Long id) {
		return usuarioService.findById(id);
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_A +"')")
	@PutMapping("/actualizar/{id}")
	public Object update(@Valid @RequestBody UsuarioDTO newUser, @PathVariable Long id) {
		try {
			newUser.setClave(encoder.encode(newUser.getClave()));
			usuarioService.save(newUser);
			statusResponse = HttpStatus.CREATED;
			messageResponse = Constantes.USUARIO_ACTUALIZADO;
		} catch (DataIntegrityViolationException exception) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = exception.getMostSpecificCause().getMessage();
			messageResponse = Constantes.ERROR_USUARIO_EXISTENTE;
		} catch (Exception e) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = Constantes.ERROR_SOLICITUD;
		}
		jsonResponse.put(Constantes.MESSAGE, messageResponse);
		jsonResponse.put(Constantes.CODE, statusResponse);

		return new ResponseEntity<>(jsonResponse, statusResponse);
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_C +"')")
	@PostMapping("/crear")
	public Object createNew(@Valid @RequestBody UsuarioDTO newUser) {
		Long idUsuario = null;
		try {
		
			newUser.setClave(encoder.encode(newUser.getClave()));
			usuarioService.save(newUser);
			statusResponse = HttpStatus.CREATED;
			messageResponse = Constantes.USUARIO_CREADO;
		} catch (DataIntegrityViolationException exception) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = exception.getMostSpecificCause().getMessage();
			messageResponse = Constantes.ERROR_USUARIO_EXISTENTE;
		} catch (Exception e) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = Constantes.ERROR_SOLICITUD;
		}
		jsonResponse.put(Constantes.MESSAGE, messageResponse);
		jsonResponse.put(Constantes.CODE, statusResponse);
		jsonResponse.put("idUsuario", idUsuario);

		return new ResponseEntity<>(jsonResponse, statusResponse);
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_L +"')")
	@PostMapping("/buscar")
	public Page<UsuarioDTO> buscar(@RequestBody PaginatedFilter<UsuarioDTO> filtro) {
		return usuarioService.filterPaginated(filtro.getPage(), filtro.getSizePerPage(), filtro.getFilter(),
			 filtro.getColumn(), filtro.getOrder());
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_C +"')")
	@GetMapping("/buscarPorCodEmpleado/{codEmpleado}")
	public UsuarioDTO findByEmpleadoId(@PathVariable Long codEmpleado) {
		return usuarioService.findByPersonaCodigoEmpleado(codEmpleado);
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_L +"')")
	@GetMapping("/obtenerrolesusuario/{idUsuario}")
	public List<UsuarioRolDTO> obtenerRolesUsuario(@PathVariable Long idUsuario) {
		return rolService.findUsuarioRolByIdIdUsuario(idUsuario);
	}
	
	@PreAuthorize("hasRole('"+ ConstantesRolesMP.ROLE_ADM +"') "
			+ "or hasAuthority('"+ ConstantesRolesMP.ADMU + ConstantesRolesMP.PRM_A +"')")
	@PutMapping("/actualizarrolesusuario/{idUsuario}")
	public Object actualizarRolesUsuario(@PathVariable Long idUsuario, @RequestBody List<UsuarioRolDTO> roles) {
		try {
			rolService.saveRolesUsuario(idUsuario, roles);
			statusResponse = HttpStatus.CREATED;
			messageResponse = Constantes.ROLES_ASIGNADOS;
		} catch (DataIntegrityViolationException exception) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = exception.getMostSpecificCause().getMessage();
			messageResponse = messageResponse.substring(messageResponse.indexOf("Detail:") + 7);
		} catch (Exception e) {
			statusResponse = HttpStatus.BAD_REQUEST;
			messageResponse = Constantes.ERROR_SOLICITUD;
		}
		jsonResponse.put(Constantes.MESSAGE, messageResponse);
		jsonResponse.put(Constantes.CODE, statusResponse);

		return new ResponseEntity<>(jsonResponse, statusResponse);
	}


	
	
	
	// eliminar

	/*
	 * public colaborador delete(@PathVariable("id") int id) { return
	 * registroCorteService.deleteRegistroCortes(id); }
	 */

	@PreAuthorize("hasRole('" + ConstantesRolesMP.ROLE_ADM + "') " + "or hasAuthority('" + ConstantesRolesMP.ROLPE
			+ ConstantesRolesMP.PRM_L + "')" + "or hasAuthority('" + ConstantesRolesMP.ROLPE + ConstantesRolesMP.PRM_C
			+ "')" + "or hasAuthority('" + ConstantesRolesMP.ROLPE + ConstantesRolesMP.PRM_A + "')")
	@DeleteMapping(path = { "/delete/{id}" })
	public Object delete(@PathVariable("id") long id) {
		try {

			
			// llamo y borro en REGISTROCORTES,
			List<PersonaDTO> lista = new ArrayList<>();
			lista = listarPersona();
			for (int i = 0; i < lista.size(); i++) {
				if (lista.get(i).getCodigoEmpleado() == id) {
					PersonaService.deleteById(id);

				}

			}

		
			
			// llamo y borro en REGISTROCORTES,
			List<UsuarioRolDTO> list = new ArrayList<>();
			list = listarUsuarioRol();
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getIdUsuario() == id) {
					usuarioRolService.deleteById(id);

				}

			}

			
			
			
			//usuarioRolService

			usuarioService.deleteById(id);
			statusResponse = HttpStatus.OK;
			jsonResponse.put(Constantes.CODE, statusResponse);
		} catch (Exception e) {
			System.out.printf("   " + e.getMessage() + "" + e.toString());
			// TODO: handle exception
			statusResponse = HttpStatus.OK;
			jsonResponse.put(Constantes.CODE, statusResponse);
			return new ResponseEntity<>(jsonResponse, statusResponse);

		}
		jsonResponse.put(Constantes.MESSAGE, messageResponse);
		jsonResponse.put(Constantes.CODE, statusResponse);
		return new ResponseEntity<>(jsonResponse, statusResponse);
	}


	
	


	private List<PersonaDTO> listarPersona() {
		
		// TODO Auto-generated method stub
		return  PersonaService.findAll();
	}

	public  IPersonaService getPersonaService() {
		// TODO Auto-generated method stub
		return PersonaService;
	}
	
	
	
private List<UsuarioRolDTO> listarUsuarioRol() {
		
		// TODO Auto-generated method stub
		return   usuarioRolService.findAll();
	}

	public  IUsuarioRolService getUsuarioRolService() {
		// TODO Auto-generated method stub
		return  usuarioRolService;
	}
}
