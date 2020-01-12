package pl.example.electro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.example.electro.entity.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
}
