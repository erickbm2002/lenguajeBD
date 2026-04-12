/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pasteleria.domain;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class OpcionPedido {
    private Long idOpcion;
    private String categoria;
    private String valor;
    private String descripcion;
    private BigDecimal precioAdicional;
    private Boolean activo;
}
