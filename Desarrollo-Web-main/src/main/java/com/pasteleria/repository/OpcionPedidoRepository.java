/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pasteleria.repository;

import com.pasteleria.domain.OpcionPedido;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class OpcionPedidoRepository {

    private final JdbcTemplate jdbc;

    public OpcionPedidoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<OpcionPedido> findByCategoriaAndActivoTrue(String categoria) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_OPCION_PEDIDO_CATEGORIA_ACTIVO(?, ?) }")) {
                cs.setString(1, categoria);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<OpcionPedido> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        OpcionPedido o = new OpcionPedido();
                        o.setIdOpcion(rs.getLong("id_opcion"));
                        o.setCategoria(rs.getString("categoria"));
                        o.setValor(rs.getString("valor"));
                        BigDecimal precio = rs.getBigDecimal("precio_adicional");
                        o.setPrecioAdicional(precio);
                        int activo = rs.getInt("activo");
                        o.setActivo(activo == 1);
                        lista.add(o);
                    }
                }
                return lista;
            }
        });
    }

    public List<OpcionPedido> findByCategoria(String categoria) {
        return findByCategoriaAndActivoTrue(categoria);
    }
}