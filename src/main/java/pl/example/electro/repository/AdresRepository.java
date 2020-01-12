package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.Adres;

@Repository
public interface AdresRepository extends JpaRepository<Adres, Long> {
}
