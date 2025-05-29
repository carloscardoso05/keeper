package cardoso.carlos.keeper.persistence.user;

import cardoso.carlos.keeper.domain.WorkerId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkerRepository extends JpaRepository<WorkerEntity, WorkerId> {
}
