package com.pasteleria.repository;

import com.pasteleria.domain.DetallePedido;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;

@Repository
public class DetallePedidoRepository {

    private final JdbcTemplate jdbc;

    public DetallePedidoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public DetallePedido save(DetallePedido detalle) {
        jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_INSERTAR_DETALLE_PEDIDO(?, ?, ?, ?) }")) {
                cs.setInt(1, detalle.getCantidad());
                cs.setDouble(2, detalle.getPrecioUnitario() != null ? detalle.getPrecioUnitario() : 0.0);
                cs.setLong(3, detalle.getPedido().getIdPedido());
                cs.setLong(4, detalle.getProducto().getIdProducto());
                cs.execute();
                return null;
            }
        });
        return detalle;
    }
}
