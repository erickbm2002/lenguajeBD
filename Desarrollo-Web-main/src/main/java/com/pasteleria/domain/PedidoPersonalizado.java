/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pasteleria.domain;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class PedidoPersonalizado {
    private Long idPedido;
    private String producto;
    private String saborBizcocho;
    private String saborRelleno;
    private String tamano;
    private String personalizacion;
    private BigDecimal precio;
    private String estado;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaEntrega;
    private Usuario usuario;
    private String nombreCliente;
    private String telefono;
    private String email;
}
