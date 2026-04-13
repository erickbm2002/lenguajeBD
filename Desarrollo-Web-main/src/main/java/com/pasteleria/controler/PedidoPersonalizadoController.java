package com.pasteleria.controler;

import com.pasteleria.domain.PedidoPersonalizado;
import com.pasteleria.domain.Usuario;
import com.pasteleria.repository.UsuarioRepository;
import com.pasteleria.service.PedidoPersonalizadoService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/pedidos")
public class PedidoPersonalizadoController {

    private final PedidoPersonalizadoService pedidoService;
    private final UsuarioRepository usuarioRepository;

    public PedidoPersonalizadoController(PedidoPersonalizadoService pedidoService,
            UsuarioRepository usuarioRepository) {
        this.pedidoService = pedidoService;
        this.usuarioRepository = usuarioRepository;
    }

    @GetMapping("/personalizado")
    public String pedidoPersonalizado(Model model) {
        model.addAttribute("opcionesProducto", pedidoService.obtenerOpcionesPorCategoria("producto"));
        model.addAttribute("opcionesBizcocho", pedidoService.obtenerOpcionesPorCategoria("sabor_bizcocho"));
        model.addAttribute("opcionesRelleno", pedidoService.obtenerOpcionesPorCategoria("sabor_relleno"));
        model.addAttribute("opcionesTamano", pedidoService.obtenerOpcionesPorCategoria("tamano"));
        return "pedidos/personalizado";
    }

    @PostMapping("/procesar")
    public String procesarPedido(
            @RequestParam("producto") String producto,
            @RequestParam("saborBizcocho") String saborBizcocho,
            @RequestParam("saborRelleno") String saborRelleno,
            @RequestParam("tamano") String tamano,
            @RequestParam(value = "personalizacion", required = false, defaultValue = "") String personalizacion,
            @RequestParam("nombreCliente") String nombreCliente,
            @RequestParam("telefono") String telefono,
            @RequestParam("email") String email,
            @RequestParam("fechaEntrega") String fechaEntrega,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {

        try {
            PedidoPersonalizado pedido = new PedidoPersonalizado();
            pedido.setProducto(producto);
            pedido.setSaborBizcocho(saborBizcocho);
            pedido.setSaborRelleno(saborRelleno);
            pedido.setTamano(tamano);
            pedido.setPersonalizacion(personalizacion);
            pedido.setPrecio(BigDecimal.ZERO); 
            pedido.setEstado("pendiente");
            pedido.setNombreCliente(nombreCliente);
            pedido.setTelefono(telefono);
            pedido.setEmail(email);

            if (fechaEntrega != null && !fechaEntrega.isBlank()) {
                pedido.setFechaEntrega(LocalDate.parse(fechaEntrega).atStartOfDay());
            }


            if (authentication != null) {
                usuarioRepository.findByCorreo(authentication.getName())
                        .ifPresent(u -> {
                            Usuario usuario = new Usuario();
                            usuario.setIdUsuario(u.getIdUsuario());
                            pedido.setUsuario(usuario);
                        });
            }

            pedidoService.guardarPedido(pedido);

            redirectAttributes.addFlashAttribute("mensajeExito",
                    "¡Tu pedido personalizado fue registrado exitosamente! Nos pondremos en contacto contigo pronto.");
            return "redirect:/pedidos/confirmacion";

        } catch (Exception e) {
            System.err.println("ERROR PEDIDO PERSONALIZADO: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("mensajeError",
                    "Ocurrió un error: " + e.getMessage());
            return "redirect:/pedidos/personalizado";
        }
    }

    @GetMapping("/confirmacion")
    public String confirmacionPedido() {
        return "pedidos/confirmacion";
    }
}