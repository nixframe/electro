package pl.example.electro.entity;

import pl.example.electro.validation.UserEditValidationGroup;
import pl.example.electro.validation.UserLoginValidationGroup;
import pl.example.electro.validation.UserRegisterValidationGroup;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email(groups = {UserEditValidationGroup.class,UserLoginValidationGroup.class,  UserRegisterValidationGroup.class})
    @NotBlank(groups = {UserEditValidationGroup.class,UserLoginValidationGroup.class,  UserRegisterValidationGroup.class})
    @Column(nullable = false, unique = true)
    private String email;

    @NotBlank(groups = {UserEditValidationGroup.class,UserLoginValidationGroup.class,  UserRegisterValidationGroup.class})
    @Size(min = 7, message = "Password must have at least 7 characters")
    private String password;

    @NotBlank(groups = {UserEditValidationGroup.class, UserRegisterValidationGroup.class}, message = "First name must not be empty")
    @Size(min = 1, max = 20, groups = {UserEditValidationGroup.class, UserRegisterValidationGroup.class}, message = "First name can have up to 20 characters")
    private String firstName;

    @NotBlank(groups = {UserEditValidationGroup.class, UserRegisterValidationGroup.class}, message = "Last name must not be empty")
    @Size(min = 1, max = 60, groups = {UserEditValidationGroup.class, UserRegisterValidationGroup.class}, message = "Last name can have up to 60 characters")
    private String lastName;

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private Adres adres;

    private boolean enabled;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Adres getAdres() {
        return adres;
    }

    public void setAdres(Adres adres) {
        this.adres = adres;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
