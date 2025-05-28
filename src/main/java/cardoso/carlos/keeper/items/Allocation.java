package cardoso.carlos.keeper.items;

import cardoso.carlos.keeper.projects.ProjectId;
import cardoso.carlos.keeper.users.WorkerId;
import jakarta.annotation.Nullable;
import org.springframework.util.Assert;

import java.time.Instant;

public record Allocation(
        AllocationId id,
        ItemId itemId,
        Instant allocatedAt,
        @Nullable
        WorkerId bearerId,
        ProjectId projectId
) {
    public Allocation {
        Assert.notNull(id, "Id cannot be null");
        Assert.notNull(itemId, "Item ID cannot be null");
        Assert.notNull(allocatedAt, "Allocated at timestamp cannot be null");
        Assert.notNull(projectId, "Project ID cannot be null");
    }
}
