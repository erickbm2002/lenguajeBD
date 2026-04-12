/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

package com.pasteleria.repository;

import com.pasteleria.domain.ExpiracionTokenContrasena;
import com.pasteleria.domain.Usuario;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.Types;
import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public class ExpiracionTokenContrasenaRepository {

        private final JdbcTemplate jdbc;

        public ExpiracionTokenContrasenaRepository(JdbcTemplate jdbc) {
                this.jdbc = jdbc;
        }

        public ExpiracionTokenContrasena save(ExpiracionTokenContrasena token) {
                if (token.getIdToken() == null) {
                        jdbc.execute((java.sql.Connection con) -> {
                                try (CallableStatement cs = con.prepareCall("{ call SP_INSERTAR_TOKEN(?, ?, ?) }")) {
                                        cs.setLong(1, token.getUsuario().getIdUsuario());
                                        cs.setString(2, token.getCodigo());
                                        cs.setTimestamp(3, Timestamp.valueOf(token.getExpiraEn()));
                                        cs.execute();
                                        return null;
                                }
                        });
                } else {
                        jdbc.execute((java.sql.Connection con) -> {
                                try (CallableStatement cs = con
                                                .prepareCall("{ call SP_ACTUALIZAR_TOKEN(?, ?, ?, ?) }")) {
                                        cs.setLong(1, token.getIdToken());
                                        cs.setString(2, token.getCodigo());
                                        cs.setTimestamp(3, Timestamp.valueOf(token.getExpiraEn()));
                                        cs.setInt(4, token.getUsado() != null ? token.getUsado() : 0);
                                        cs.execute();
                                        return null;
                                }
                        });
                }
                return token;
        }

        public Optional<ExpiracionTokenContrasena> findTopByUsuarioAndCodigoAndUsadoAndExpiraEnAfterOrderByExpiraEnDesc(
                        Usuario usuario, String codigo, Integer usado, LocalDateTime ahora) {

                return jdbc.execute((java.sql.Connection con) -> {
                        try (CallableStatement cs = con.prepareCall(
                                        "{ call SP_TOKEN_FIND_TOP_BY_USUARIO_CODIGO_USADO_EXPIRA(?, ?, ?, ?, ?) }")) {
                                cs.setLong(1, usuario.getIdUsuario());
                                cs.setString(2, codigo);
                                cs.setInt(3, usado);
                                cs.setTimestamp(4, Timestamp.valueOf(ahora));
                                cs.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
                                cs.execute();
                                try (ResultSet rs = (ResultSet) cs.getObject(5)) {
                                        if (rs != null && rs.next()) {
                                                ExpiracionTokenContrasena t = new ExpiracionTokenContrasena();
                                                t.setIdToken(rs.getLong("id_token"));
                                                t.setUsuario(usuario);
                                                t.setCodigo(rs.getString("codigo").trim());
                                                Timestamp exp = rs.getTimestamp("expira_en");
                                                if (exp != null)
                                                        t.setExpiraEn(exp.toLocalDateTime());
                                                t.setUsado(rs.getInt("usado"));
                                                Timestamp fc = rs.getTimestamp("fecha_creacion");
                                                if (fc != null)
                                                        t.setFechaCreacion(fc.toLocalDateTime());
                                                Timestamp fm = rs.getTimestamp("fecha_modificacion");
                                                if (fm != null)
                                                        t.setFechaModificacion(fm.toLocalDateTime());
                                                return Optional.of(t);
                                        }
                                }
                                return Optional.<ExpiracionTokenContrasena>empty();
                        }
                });
        }
}