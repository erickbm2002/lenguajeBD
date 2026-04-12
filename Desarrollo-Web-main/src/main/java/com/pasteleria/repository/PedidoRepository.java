package com.pasteleria.repository;

import com.pasteleria.domain.Pedido;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Optional;

@Repository
public class PedidoRepository {

    private final JdbcTemplate jdbc;

    public PedidoRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public Pedido save(Pedido pedido) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_INSERTAR_PEDIDO(?, ?, ?, ?, ?) }")) {
                cs.setString(1, pedido.getMetodoPago());
                cs.setDouble(2, pedido.getTotal() != null ? pedido.getTotal() : 0.0);
                cs.setString(3, pedido.getEstado());
                if (pedido.getIdUsuario() != null) {
                    cs.setLong(4, pedido.getIdUsuario());
                } else {
                    cs.setNull(4, Types.NUMERIC);
                }
                cs.registerOutParameter(5, Types.NUMERIC);
                cs.execute();
                long idGenerado = cs.getLong(5);
                pedido.setIdPedido(idGenerado);
                return pedido;
            }
        });
    }

    public Optional<Pedido> findById(Long id) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_OBTENER_PEDIDO(?, ?) }")) {
                cs.setLong(1, id);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    if (rs != null && rs.next()) {
                        Pedido p = new Pedido();
                        p.setIdPedido(rs.getLong("id_pedido"));
                        p.setIdUsuario(rs.getLong("id_usuario"));
                        p.setMetodoPago(rs.getString("metodo_pago"));
                        p.setEstado(rs.getString("estado"));
                        double total = rs.getDouble("total");
                        p.setTotal(total);
                        Timestamp fecha = rs.getTimestamp("fecha");
                        if (fecha != null)
                            p.setFecha(fecha.toLocalDateTime());
                        return Optional.of(p);
                    }
                }
                return Optional.<Pedido>empty();
            }
        });
    }
}