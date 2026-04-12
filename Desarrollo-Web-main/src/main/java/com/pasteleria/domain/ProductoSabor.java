/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.pasteleria.domain;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ProductoSabor {
    private Long idSabor;
    private Producto producto;
    private String etiqueta;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaModificacion;
}
