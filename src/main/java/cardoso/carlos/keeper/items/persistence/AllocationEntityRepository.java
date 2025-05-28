package cardoso.carlos.keeper.items.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface AllocationEntityRepository extends JpaRepository<AllocationEntity, UUID> {
}
