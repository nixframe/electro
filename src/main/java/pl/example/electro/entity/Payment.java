package pl.example.electro.entity;

public enum Payment {
    CASH_ON_DELIVERY("Cash on delivery"),
    WIRE_TRANSFER("Wire transfer");

    private String value;

    Payment(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
