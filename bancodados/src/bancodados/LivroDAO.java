/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bancodados;

/**
 *
 * @author Tomás Abril
 */
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.imageio.ImageIO;

public class LivroDAO {
    
    private Connection con;
    private Statement stmt1;
    
    public LivroDAO() {
        try {
            con = ConexaoLivraria.getConnectionLivraria();

            this.stmt1 = this.con.createStatement();
            
        } catch (Exception e1) {
            System.out.println("Erro LivroDAO: " + e1);
        }
    }
    
    public List listByTitulo(String titulo) {
        return null;
    }
    
    public Image getCapaImage(int id) {
        try {
            Image img;
            ResultSet rs = this.stmt1.executeQuery("select capa from livros where livro_id = "+id);
            if (rs.next()) {
                img = ImageIO.read(rs.getBinaryStream(1));
                return img;
            } else {
                return null;
            }
        } catch (SQLException sql1) {
            System.out.println("Erro LivroDAO: "+sql1);
            return null;
        } catch (IOException io1) {
            System.out.println("Erro IO: "+io1);
            return null;
        }
    }
    
    public byte[] getCapaByte(int id) {
        try {
            ResultSet rs = this.stmt1.executeQuery("select capa from livros where livro_id = "+id);
            if (rs.next()) {
                byte img[] = rs.getBytes(1);
                return img;
            } else {
                return null;
            }
        } catch (SQLException sql1) {
            System.out.println("Erro LivroDAO: "+sql1);
            return null;
        }
    }
    
    public ArrayList<LivroTO> listAll() {
        try {
            ResultSet rs = this.stmt1.executeQuery("select * from livros order by livro_id");
            ArrayList<LivroTO> lista = new ArrayList<LivroTO>();
            LivroTO res = null;
            while (rs.next()) {
                res = new LivroTO();
                res.setLivro_id(rs.getInt("livro_id"));
                res.setTitulo(rs.getString("titulo"));
                res.setAutor(rs.getString("autor"));
                res.setPreco(rs.getDouble("preco"));
                res.setAno(rs.getInt("ano"));
                res.setDescricao(rs.getString("descricao"));
                res.setEditora(rs.getString("editora"));
                res.setEstoque(rs.getInt("estoque"));
                res.setReserva(rs.getInt("reserva"));
                res.setGenero_id(rs.getInt("genero_id"));
                lista.add(res);
            }
            return lista;
        } catch (Exception e) {
            System.out.println("Erro:"+e);
            return null;
        }
    }
    
    public boolean update(LivroTO livro) {
        String sql = "update livros set titulo = '"+livro.getTitulo()+"', "+
                     "autor = '"+livro.getAutor()+"', editora = '"+livro.getEditora()+"', "+
                     "genero_id = "+livro.getGenero_id()+", estoque = "+livro.getEstoque()+", "+
                     "reserva = "+livro.getReserva()+", preco = "+livro.getPreco()+", "+
                     "descricao = '"+livro.getDescricao()+"', ano = "+livro.getAno()+
                     " where livro_id = "+livro.getLivro_id();
        System.out.println("Comando: "+sql);
        try {
            int n = this.stmt1.executeUpdate(sql);
            if (n == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException sql3) {
            System.out.println("Erro: " + sql3);
            return false;
        }
    }
    
    public boolean insert(LivroTO livro) {
        return true;
    }
    
    public boolean delete(LivroTO livro) {
        String sql = "delete from livros where livro_id = "+livro.getLivro_id();
        System.out.println("Comando: "+sql);
        try {
            int n = this.stmt1.executeUpdate(sql);
            if (n == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException sql3) {
            System.out.println("Erro: " + sql3);
            return false;
        }
    }
    
    
    public LivroTO find(String titulo) {
        try {
            ResultSet rs = this.stmt1.executeQuery("select * from livros where titulo =" + "\"" + titulo + "\"");
            if (rs.next()) {
                LivroTO res = new LivroTO();
                res.setLivro_id(rs.getInt("livro_id"));
                res.setTitulo(rs.getString("titulo"));
                res.setAutor(rs.getString("autor"));
                res.setPreco(rs.getDouble("preco"));
                res.setAno(rs.getInt("ano"));
                res.setDescricao(rs.getString("descricao"));
                res.setEditora(rs.getString("editora"));
                res.setEstoque(rs.getInt("estoque"));
                res.setReserva(rs.getInt("reserva"));
                res.setGenero_id(rs.getInt("genero_id"));
                return res;
            } else {
                return null;
            }
        } catch (SQLException sql1) {
            System.out.println("Erro LivroDAO: "+sql1);
            return null;
        }
    }
    
    public void finalize() {
        try {
            this.con.close();
        } catch (Exception e2) {
            System.out.println("Erro LivroDAO: " + e2);
        }
    }

}
