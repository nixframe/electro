package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findFirstByName(String name);
    Role findFirstById(Long id);
}
