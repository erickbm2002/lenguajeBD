/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package com.pasteleria.repository;

import com.pasteleria.domain.ProductoTamano;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductoTamanoRepository {

    private final JdbcTemplate jdbc;

    public ProductoTamanoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<ProductoTamano> findByProductoIdProducto(Long idProducto) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_GET_TAMANOS_PRODUCTO(?, ?) }")) {
                cs.setLong(1, idProducto);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<ProductoTamano> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        ProductoTamano t = new ProductoTamano();
                        t.setIdTamano(rs.getLong("id_tamano"));
                        t.setEtiqueta(rs.getString("etiqueta"));
                        lista.add(t);
                    }
                }
                return lista;
            }
        });
    }
}
