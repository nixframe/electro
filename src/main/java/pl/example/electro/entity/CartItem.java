package pl.example.electro.entity;

import org.springframework.stereotype.Component;

@Component
public class CartItem {

    private Product product;
    private Integer productQuantity;

    public CartItem() {
    }

    public CartItem(Product product, Integer productQuantity) {
        this.product = product;
        this.productQuantity = productQuantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }
}
