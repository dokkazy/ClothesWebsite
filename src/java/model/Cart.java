/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<CartItems> items;
    private float totalPrice;

    public Cart(List<CartItems> items, float totalPrice) {
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public Cart() {
    }

    public List<CartItems> getItems() {
        return items;
    }

    public void setItems(List<CartItems> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    private boolean checkExist(String id) {
        for (CartItems item : items) {
            if (item.getProduct().getId().equals(id)) {
                return true;
            }
        }
        return false;
    }

    private CartItems getItemByPid(String id) {
        for (CartItems item : items) {
            if (item.getProduct().getId().equals(id)) {
                return item;
            }
        }
        return null;
    }

    public void addItem(CartItems newItem) {
        if (checkExist(newItem.getProduct().getId())) {
            CartItems oldItem = getItemByPid(newItem.getProduct().getId());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }

    public void changeQuantity(String pid, int quantity) {
        CartItems item = getItemByPid(pid);
        item.setQuantity(quantity);
        if (quantity==0) {
            removeItems(pid);
        }
    }
    public void removeItems(String pid){
        if (getItemByPid(pid)!=null) {
            items.remove(getItemByPid(pid));
        }
    }
    public float getTotalMoney(){
        float total = 0;
        for (CartItems item : items) {
             total += (float)(item.getQuantity() * item.getProduct().getPrice());
        }
        return total;
    }
    
    
}
