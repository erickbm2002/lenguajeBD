package com.pasteleria.domain;

import lombok.Data;

@Data
public class DetallePedido {
    private Long idDetalle;
    private Pedido pedido;
    private Producto producto;
    private Integer cantidad;
    private Double precioUnitario;
}
