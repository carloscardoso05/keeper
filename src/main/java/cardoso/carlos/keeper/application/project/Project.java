package cardoso.carlos.keeper.application.project;

import cardoso.carlos.keeper.application.user.ManagerId;
import org.springframework.util.Assert;

public record Project(
        ProjectId id,
        String name,
        String description,
        ManagerId managerId
) {
    public Project {
        Assert.notNull(id, "Id can't be null");
        Assert.hasText(name, "Name must not be empty or null");
        Assert.notNull(description, "Description must not be null");
        Assert.notNull(managerId, "Manager ID must not be null");
    }
}
