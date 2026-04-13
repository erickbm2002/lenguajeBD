/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pasteleria.repository;

import com.pasteleria.domain.PedidoPersonalizado;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PedidoPersonalizadoRepository {

    private final JdbcTemplate jdbc;

    public PedidoPersonalizadoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public PedidoPersonalizado save(PedidoPersonalizado pedido) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall(
                    "{ call SP_INSERTAR_PEDIDO_PERSONALIZADO(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }")) {

                cs.setString(1, pedido.getProducto());
                cs.setString(2, pedido.getSaborBizcocho());
                cs.setString(3, pedido.getSaborRelleno());
                cs.setString(4, pedido.getTamano());
                cs.setString(5, pedido.getPersonalizacion());
                cs.setBigDecimal(6, pedido.getPrecio());
                cs.setString(7, pedido.getEstado() != null ? pedido.getEstado() : "pendiente");

                if (pedido.getFechaEntrega() != null) {
                    cs.setTimestamp(8, Timestamp.valueOf(pedido.getFechaEntrega()));
                } else {
                    cs.setNull(8, Types.TIMESTAMP);
                }

                if (pedido.getUsuario() != null && pedido.getUsuario().getIdUsuario() != null) {
                    cs.setLong(9, pedido.getUsuario().getIdUsuario());
                } else {
                    cs.setNull(9, Types.NUMERIC);
                }

                cs.setString(10, pedido.getNombreCliente());
                cs.setString(11, pedido.getTelefono());
                cs.setString(12, pedido.getEmail());
                cs.registerOutParameter(13, Types.NUMERIC);

                cs.execute();

                long idGenerado = cs.getLong(13);
                pedido.setIdPedido(idGenerado);
                return pedido;
            }
        });
    }

    public List<PedidoPersonalizado> findByUsuarioIdUsuario(Long idUsuario) {
        return new ArrayList<>();
    }

    public List<PedidoPersonalizado> findByEstado(String estado) {
        return new ArrayList<>();
    }
}