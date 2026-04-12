/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package com.pasteleria.repository;

import com.pasteleria.domain.Producto;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class ProductoRepository {

    private final JdbcTemplate jdbc;

    public ProductoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<Producto> findByActivoTrue() {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_GET_PRODUCTOS(?) }")) {
                cs.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<Producto> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(1)) {
                    while (rs != null && rs.next()) {
                        lista.add(mapProducto(rs));
                    }
                }
                return lista;
            }
        });
    }

    public Optional<Producto> findById(Long id) {
        List<Producto> todos = findByActivoTrue();
        return todos.stream().filter(p -> p.getIdProducto().equals(id)).findFirst();
    }

    private Producto mapProducto(ResultSet rs) throws java.sql.SQLException {
        Producto p = new Producto();
        p.setIdProducto(rs.getLong("id_producto"));
        p.setNombre(rs.getString("nombre"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setConservacion(rs.getString("conservacion"));
        BigDecimal precio = rs.getBigDecimal("precio");
        p.setPrecio(precio);
        p.setStock(rs.getInt("stock"));
        int activo = rs.getInt("activo");
        p.setActivo(activo == 1);
        return p;
    }
}