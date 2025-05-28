package cardoso.carlos.keeper.persistence.user;

import cardoso.carlos.keeper.application.user.ManagerId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository extends JpaRepository<ManagerEntity, ManagerId> {
}
