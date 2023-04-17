/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import java.util.List;
import javax.ejb.Local;
import modelo.Item;

/**
 *
 * @author Eduardo Trujillo
 */
@Local
public interface CarritoBeanLocal {
    String agregarItem(Item item);
    
    String eliminarItem(String nombre);
    
    String vaciar();
    
    float getTotalAPagar();
    
    int getCantidad();
    
    List<Item> itemList();

    public Item buscarItem(String nombre);
    
}
