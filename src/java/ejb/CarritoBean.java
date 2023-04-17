/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;
import modelo.Item;

/**
 *
 * @author Eduardo Trujillo
 */
@Stateful
public class CarritoBean implements CarritoBeanLocal {
    
    private List<Item> carrito;

    public CarritoBean(){
        carrito = new ArrayList<>();
    }
    
    @Override
    public Item buscarItem(String nombre){
        for(Item i : carrito){
            /*if(nombre == i.getNombre()){*/
            if(nombre.equals(i.getNombre())){
                return i;
            }
        }
        return null;
    }         
    
    @Override
    public String agregarItem(Item item) {
        int qty = carrito.size();
        Item xx = buscarItem(item.getNombre());
        if(xx != null){
            xx.setCantidad(xx.getCantidad() + 1);
        }else{
            carrito.add(item);
        }        
        return "Agregado!";
    }

    @Override
    public String eliminarItem(String nombre) {
        Item xx = buscarItem(nombre);
        if(xx != null){
            carrito.remove(xx);
        }   
        return "Eliminado!";
    }

    @Override
    public String vaciar() {
        carrito.clear();
        //carrito.removeAll(carrito);
        return "Carrito vacio";
    }

    @Override
    public float getTotalAPagar() {
        float suma = 0;
        for(Item i:carrito){
            suma = suma + i.getCantidad() * i.getPrecio();
        }            
        return suma;
    }

    @Override
    public int getCantidad() {
        int suma = 0;
        for(Item i:carrito){
            suma = suma + i.getCantidad();
        }            
        return suma;
    }

    @Override
    public List<Item> itemList() {
        return carrito;
    }
}