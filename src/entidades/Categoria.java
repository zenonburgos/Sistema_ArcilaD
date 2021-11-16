/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 *
 * @author USER
 */
public class Categoria {
    private int id;
    private String nombre;
    private String Descripcion;
    private boolean activo;
    
    //Constructores

    public Categoria() {
    
    }

    public Categoria(int id, String nombre, String Descripcion, boolean activo) {
        this.id = id;
        this.nombre = nombre;
        this.Descripcion = Descripcion;
        this.activo = activo;
    }
    
    //Setter y getter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    //Método toString

    @Override
    public String toString() {
        return "Categoria{" + "id=" + id + ", nombre=" + nombre + ", Descripcion=" + Descripcion + ", activo=" + activo + '}';
    }
    
    
}
