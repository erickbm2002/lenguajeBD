/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pasteleria.repository;

import com.pasteleria.domain.PedidoPersonalizado;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PedidoPersonalizadoRepository {

    private final JdbcTemplate jdbc;

    public PedidoPersonalizadoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public PedidoPersonalizado save(PedidoPersonalizado pedido) {
        return pedido;
    }

    public List<PedidoPersonalizado> findByUsuarioIdUsuario(Long idUsuario) {
        return new ArrayList<>();
    }

    public List<PedidoPersonalizado> findByEstado(String estado) {
        return new ArrayList<>();
    }
}
