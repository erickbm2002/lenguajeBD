/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package com.pasteleria.repository;

import com.pasteleria.domain.ProductoIngrediente;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductoIngredienteRepository {

    private final JdbcTemplate jdbc;

    public ProductoIngredienteRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<ProductoIngrediente> findByProductoIdProducto(Long idProducto) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_GET_INGREDIENTES_PRODUCTO(?, ?) }")) {
                cs.setLong(1, idProducto);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<ProductoIngrediente> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        ProductoIngrediente i = new ProductoIngrediente();
                        i.setIdIngrediente(rs.getLong("id_ingrediente"));
                        i.setNombre(rs.getString("nombre"));
                        lista.add(i);
                    }
                }
                return lista;
            }
        });
    }
}
