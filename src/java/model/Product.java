/*
 * 
 */
package model;

/**
 *
 * @author HP
 */
public class Product {
    private int quantity;
    private Category cate;
    private String id, name, image, description;
    private double price;
    private boolean status;
    
    public Product() {
    }

    public Product(String id, int quantity, Category cate, String name, String image, String description, double price, boolean status) {
        this.quantity = quantity;
        this.cate = cate;
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.price = price;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", quantity=" + quantity + ", name=" + name + ", image=" + image + ", description=" + description + ", price=" + price + '}';
    }

    
    
}
