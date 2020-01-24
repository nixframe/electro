package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String mail);

    User findFirstByEmail(String mail);

    User findFirstById(Long id);
}
