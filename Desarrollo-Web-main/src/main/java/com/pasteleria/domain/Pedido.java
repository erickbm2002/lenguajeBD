package com.pasteleria.domain;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Pedido {
    private Long idPedido;
    private Long idUsuario;
    private LocalDateTime fecha;
    private Double total;
    private String metodoPago;
    private String estado;
    private List<DetallePedido> detalles;
}
