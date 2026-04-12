/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.pasteleria.domain;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Usuario {
    private Long idUsuario;
    private String nombre;
    private String correo;
    private String passwordHash;
    private Boolean activo;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaModificacion;
}
