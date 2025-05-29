package cardoso.carlos.keeper.domain;

import org.springframework.util.Assert;

public class Project {
    private ProjectId id;
    private String name;
    private String description;
    private ManagerId managerId;

    public Project(ProjectId id, String name, String description, ManagerId managerId) {
        Assert.notNull(id, "Id can't be null");
        Assert.hasText(name, "Name must not be empty or null");
        Assert.notNull(description, "Description must not be null");
        Assert.notNull(managerId, "Manager ID must not be null");
        this.id = id;
        this.name = name;
        this.description = description;
        this.managerId = managerId;
    }

    public ProjectId getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ManagerId getManagerId() {
        return managerId;
    }

    public void setManagerId(ManagerId managerId) {
        this.managerId = managerId;
    }
}
