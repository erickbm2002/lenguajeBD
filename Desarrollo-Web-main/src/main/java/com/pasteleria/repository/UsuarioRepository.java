/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package com.pasteleria.repository;

import com.pasteleria.domain.Usuario;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.Optional;

@Repository
public class UsuarioRepository {

    private final JdbcTemplate jdbc;

    public UsuarioRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public boolean existsByCorreo(String correo) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_USUARIOS_EXISTE_CORREO(?, ?) }")) {
                cs.setString(1, correo);
                cs.registerOutParameter(2, Types.NUMERIC);
                cs.execute();
                return cs.getInt(2) > 0;
            }
        });
    }

    public boolean existsByCorreoAndIdUsuarioNot(String correo, Long idUsuario) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_EXISTS_USUARIO_BY_CORREO_NOT_ID(?, ?, ?) }")) {
                cs.setString(1, correo);
                cs.setLong(2, idUsuario);
                cs.registerOutParameter(3, Types.NUMERIC);
                cs.execute();
                return cs.getInt(3) > 0;
            }
        });
    }

    public Optional<Usuario> findByCorreo(String correo) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_FIND_BY_CORREO(?, ?) }")) {
                cs.setString(1, correo);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    if (rs != null && rs.next()) {
                        return Optional.of(mapUsuario(rs));
                    }
                }
                return Optional.<Usuario>empty();
            }
        });
    }

    public Optional<Usuario> findById(Long idUsuario) {
        return jdbc.execute((java.sql.Connection con) -> {
            try (CallableStatement cs = con.prepareCall("{ call SP_FIND_USUARIO_BY_ID(?, ?) }")) {
                cs.setLong(1, idUsuario);
                cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
                cs.execute();
                try (ResultSet rs = (ResultSet) cs.getObject(2)) {
                    if (rs != null && rs.next()) {
                        return Optional.of(mapUsuario(rs));
                    }
                }
                return Optional.<Usuario>empty();
            }
        });
    }

    public Usuario save(Usuario usuario) {
        if (usuario.getIdUsuario() == null) {
            jdbc.execute((java.sql.Connection con) -> {
                try (CallableStatement cs = con.prepareCall("{ call SP_INSERTAR_USUARIO(?, ?, ?) }")) {
                    cs.setString(1, usuario.getNombre());
                    cs.setString(2, usuario.getCorreo());
                    cs.setString(3, usuario.getPasswordHash());
                    cs.execute();
                    return null;
                }
            });
            return findByCorreo(usuario.getCorreo()).orElse(usuario);
        } else {
            jdbc.execute((java.sql.Connection con) -> {
                try (CallableStatement cs = con.prepareCall("{ call SP_ACTUALIZAR_USUARIO(?, ?, ?, ?) }")) {
                    cs.setLong(1, usuario.getIdUsuario());
                    cs.setString(2, usuario.getNombre());
                    cs.setString(3, usuario.getCorreo());
                    cs.setString(4, usuario.getPasswordHash());
                    cs.execute();
                    return null;
                }
            });
            return usuario;
        }
    }

    private Usuario mapUsuario(ResultSet rs) throws java.sql.SQLException {
        Usuario u = new Usuario();
        u.setIdUsuario(rs.getLong("id_usuario"));
        u.setNombre(rs.getString("nombre"));
        u.setCorreo(rs.getString("correo"));
        u.setPasswordHash(rs.getString("password_hash"));
        u.setActivo(rs.getInt("activo") == 1);
        return u;
    }
}