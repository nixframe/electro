package pl.example.electro.entity;

import pl.example.electro.validation.AdressValidationGroup;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "adres")
public class Adres {

    private static final String BLANK_MESSAGE = "Field cannot be empty";
    private static final String INVALID_PATTERN = "Invalid pattern";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(mappedBy = "adres")
    private User user;

    @NotBlank(message = BLANK_MESSAGE, groups = {AdressValidationGroup.class})
    private String street;

    @Column(name = "house_number")
    @NotBlank(message = BLANK_MESSAGE, groups = {AdressValidationGroup.class})
    @Pattern(regexp = "^\\d+[a-zA-Z]?$", message = INVALID_PATTERN, groups = {AdressValidationGroup.class})
    private String houseNumber;

    @Column(name = "apartment_number")
    @Pattern(regexp = "^\\d*$", message =INVALID_PATTERN, groups = {AdressValidationGroup.class})
    private String aptNumber;

    @NotBlank(message = BLANK_MESSAGE, groups = {AdressValidationGroup.class})
    private String city;

    @Column(name = "post_code")
    @NotBlank(message = BLANK_MESSAGE, groups = {AdressValidationGroup.class})
    @Pattern(regexp = "^\\d{2}-\\d{3}$", message = INVALID_PATTERN, groups = {AdressValidationGroup.class})
    private String postalCode;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getAptNumber() {
        return aptNumber;
    }

    public void setAptNumber(String aptNumber) {
        this.aptNumber = aptNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
}
