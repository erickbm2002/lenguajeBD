package com.pasteleria.repository;

import com.pasteleria.domain.Producto;
import com.pasteleria.domain.Resena;
import com.pasteleria.domain.Usuario;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class ResenaRepository {

    private final JdbcTemplate jdbc;
    private final ProductoRepository productoRepository;
    private final UsuarioRepository usuarioRepository;

    public ResenaRepository(JdbcTemplate jdbc,
            ProductoRepository productoRepository,
            UsuarioRepository usuarioRepository) {
        this.jdbc = jdbc;
        this.productoRepository = productoRepository;
        this.usuarioRepository = usuarioRepository;
    }

    public Optional<Resena> findById(Long idResena) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_OBTENER_RESENA_POR_ID(?, ?) }")) {
                cs.setLong(1, idResena);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    if (rs != null && rs.next()) {
                        return Optional.of(mapResena(rs));
                    }
                }
                return Optional.<Resena>empty();
            }
        });
    }

    public void delete(Resena resena) {
        jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_DESAPROBAR_RESENA(?) }")) {
                cs.setLong(1, resena.getIdResena());
                cs.execute();
                return null;
            }
        });
    }

    public Resena save(Resena resena) {
        jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_INSERTAR_RESENA(?, ?, ?, ?, ?) }")) {
                cs.setLong(1, resena.getProducto().getIdProducto());
                cs.setLong(2, resena.getUsuario().getIdUsuario());
                if (resena.getPedido() != null) {
                    cs.setLong(3, resena.getPedido().getIdPedido());
                } else {
                    cs.setNull(3, Types.NUMERIC);
                }
                cs.setInt(4, resena.getCalificacion());
                cs.setString(5, resena.getComentario());
                cs.execute();
                return null;
            }
        });
        return resena;
    }

    public List<Resena> findByProductoIdProductoAndAprobadaTrue(Long idProducto) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENA_APROBADA_PRODUCTO(?, ?) }")) {
                cs.setLong(1, idProducto);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<Resena> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        lista.add(mapResena(rs));
                    }
                }
                return lista;
            }
        });
    }

    public List<Resena> findByUsuarioIdUsuario(Long idUsuario) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENA_USUARIO(?, ?) }")) {
                cs.setLong(1, idUsuario);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<Resena> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        lista.add(mapResena(rs));
                    }
                }
                return lista;
            }
        });
    }

    public List<Resena> findTop10ByUsuarioIdUsuarioNotAndAprobadaTrueOrderByFechaCreacionDesc(Long idUsuarioExcluir) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENAS_COMUNIDAD(?, ?) }")) {
                cs.setLong(1, idUsuarioExcluir);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<Resena> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        lista.add(mapResena(rs));
                    }
                }
                return lista;
            }
        });
    }

    public List<Resena> findTop10ByAprobadaTrueOrderByFechaCreacionDesc() {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENAS_COMUNIDAD(?, ?) }")) {
                cs.setLong(1, 0L);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                List<Resena> lista = new ArrayList<>();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    while (rs != null && rs.next()) {
                        lista.add(mapResena(rs));
                    }
                }
                return lista;
            }
        });
    }

    public Double findPromedioCalificacionByProducto(Long productoId) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENA_CALIFICACION(?, ?) }")) {
                cs.setLong(1, productoId);
                cs.registerOutParameter(2, Types.NUMERIC);
                cs.execute();
                double val = cs.getDouble(2);
                return cs.wasNull() ? null : val;
            }
        });
    }

    public Integer countResenasAprobadasByProducto(Long productoId) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENA_COUNT_PRODUCTO(?, ?) }")) {
                cs.setLong(1, productoId);
                cs.registerOutParameter(2, Types.NUMERIC);
                cs.execute();
                return cs.getInt(2);
            }
        });
    }

    public boolean existsByUsuarioIdUsuarioAndProductoIdProducto(Long idUsuario, Long idProducto) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_RESENA_BY_USUARIO(?, ?, ?) }")) {
                cs.setLong(1, idUsuario);
                cs.setLong(2, idProducto);
                cs.registerOutParameter(3, Types.NUMERIC);
                cs.execute();
                return cs.getInt(3) > 0;
            }
        });
    }

    private Resena mapResena(ResultSet rs) throws java.sql.SQLException {
        Resena r = new Resena();
        r.setIdResena(rs.getLong("id_resena"));

        Producto producto = new Producto();
        producto.setIdProducto(rs.getLong("id_producto"));
        productoRepository.findById(rs.getLong("id_producto"))
                .ifPresent(p -> {
                    producto.setNombre(p.getNombre());
                    producto.setDescripcion(p.getDescripcion());
                    producto.setPrecio(p.getPrecio());
                    producto.setStock(p.getStock());
                    producto.setActivo(p.getActivo());
                });
        r.setProducto(producto);

        Usuario usuario = new Usuario();
        usuario.setIdUsuario(rs.getLong("id_usuario"));
        usuarioRepository.findById(rs.getLong("id_usuario"))
                .ifPresent(u -> {
                    usuario.setNombre(u.getNombre());
                    usuario.setCorreo(u.getCorreo());
                    usuario.setActivo(u.getActivo());
                });
        r.setUsuario(usuario);

        long idPedido = rs.getLong("id_pedido");
        if (!rs.wasNull() && idPedido > 0) {
            com.pasteleria.domain.Pedido pedido = new com.pasteleria.domain.Pedido();
            pedido.setIdPedido(idPedido);
            r.setPedido(pedido);
        }

        r.setCalificacion(rs.getInt("calificacion"));
        r.setComentario(rs.getString("comentario"));
        int aprobada = rs.getInt("aprobada");
        r.setAprobada(aprobada == 1);

        Timestamp fc = rs.getTimestamp("fecha_creacion");
        if (fc != null)
            r.setFechaCreacion(fc.toLocalDateTime());
        Timestamp fm = rs.getTimestamp("fecha_modificacion");
        if (fm != null)
            r.setFechaModificacion(fm.toLocalDateTime());

        return r;
    }
}