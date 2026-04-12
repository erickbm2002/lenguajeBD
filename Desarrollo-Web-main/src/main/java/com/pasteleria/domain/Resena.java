package com.pasteleria.domain;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Resena {
    private Long idResena;
    private Producto producto;
    private Usuario usuario;
    private Pedido pedido;
    private Integer calificacion;
    private String comentario;
    private Boolean aprobada;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaModificacion;
}
