/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import datos.CategoriaDAO;
import entidades.Categoria;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USER
 */
public class CategoriaControl {
    private final CategoriaDAO DATOS;
    private Categoria obj;
    private DefaultTableModel modeloTabla;
    
    public CategoriaControl(){
        this.DATOS= new CategoriaDAO();
        this.obj= new Categoria();
    }
    
    public DefaultTableModel listar(String texto){
        
    }
    
    public String insertar(String nombre, String descripcion){
        
    }
    
    public String actualizar(int id, String nombre, String nombreAnt, String descripcion){
        
    }
    
    public String desactivar(int id){
        
    }
    
    public String activar(int id){
        
    }
    
    public int total(){
        
    }
}
