/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pasteleria.domain;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Producto {
    private Long idProducto;
    private String nombre;
    private String descripcion;
    private String conservacion;
    private BigDecimal precio;
    private Boolean activo;
    private Integer stock;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaModificacion;
    private List<ProductoTamano> tamanos;
    private List<ProductoSabor> sabores;
    private List<ProductoIngrediente> ingredientes;
}
