package pl.example.electro.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "orders_order_items", joinColumns = @JoinColumn(name = "order_id"), inverseJoinColumns = @JoinColumn(name = "order_item_id"))
    private List<OrderItem> orderItemList = new ArrayList<>();

    @ManyToOne
    private User user;

    @Column(name = "total_amount")
    private BigDecimal totalAmount;

    @Column(name = "order_creation")
    private LocalDateTime orderCreation;

    @Column(name = "order_completion")
    private LocalDateTime orderCompletion;

    @Column(name = "payment_received")
    private boolean paymentReceived;

    @Column(name = "payment_type")
    private Enum<Payment> paymentType;

    public Date getOrderCreationTimeFormatted() {
        if (this.orderCreation != null) {
            return Date.from(orderCreation.atZone(ZoneId.systemDefault()).toInstant());
        }
        return null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public LocalDateTime getOrderCreation() {
        return orderCreation;
    }

    public void setOrderCreation(LocalDateTime orderCreation) {
        this.orderCreation = orderCreation;
    }

    public LocalDateTime getOrderCompletion() {
        return orderCompletion;
    }

    public void setOrderCompletion(LocalDateTime orderCompletion) {
        this.orderCompletion = orderCompletion;
    }

    public boolean isPaymentReceived() {
        return paymentReceived;
    }

    public void setPaymentReceived(boolean paymentReceived) {
        this.paymentReceived = paymentReceived;
    }

    public Enum<Payment> getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Enum<Payment> paymentType) {
        this.paymentType = paymentType;
    }
}
