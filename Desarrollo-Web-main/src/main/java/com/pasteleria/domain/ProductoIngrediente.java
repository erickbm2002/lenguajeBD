/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.pasteleria.domain;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ProductoIngrediente {
    private Long idIngrediente;
    private Producto producto;
    private String nombre;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaModificacion;
}