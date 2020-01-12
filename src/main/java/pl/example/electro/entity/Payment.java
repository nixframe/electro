package pl.example.electro.entity;

public enum Payment {
    CASH_ON_DELIVERY("Za pobraniem"),
    WIRE_TRANSFER("Przelew");

    private String value;

    Payment(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
