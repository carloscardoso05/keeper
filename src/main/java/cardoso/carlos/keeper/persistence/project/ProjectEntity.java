package cardoso.carlos.keeper.persistence.project;

import cardoso.carlos.keeper.domain.ProjectId;
import jakarta.persistence.*;

@Entity
@Table(name = "projects")
public class ProjectEntity {
    @EmbeddedId
    private ProjectId id;

    @Column(nullable = false, unique = true)
    private String name;

    public ProjectId getId() {
        return id;
    }

    public void setId(ProjectId id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
