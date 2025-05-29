package cardoso.carlos.keeper.persistence.allocation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AllocationEntityRepository extends JpaRepository<AllocationEntity, AllocationId> {
}
