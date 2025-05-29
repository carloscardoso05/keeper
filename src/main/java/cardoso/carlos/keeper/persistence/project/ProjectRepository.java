package cardoso.carlos.keeper.persistence.project;

import cardoso.carlos.keeper.domain.ProjectId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectRepository extends JpaRepository<ProjectEntity, ProjectId> {
}
