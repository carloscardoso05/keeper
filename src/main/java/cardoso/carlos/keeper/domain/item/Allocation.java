package cardoso.carlos.keeper.domain.item;

import cardoso.carlos.keeper.domain.ProjectId;
import cardoso.carlos.keeper.domain.WorkerId;
import jakarta.annotation.Nullable;
import org.springframework.util.Assert;

import java.time.Instant;

public class Allocation {
    private Instant allocatedAt;
    @Nullable
    private WorkerId bearerId;
    private ProjectId projectId;

    public Allocation(
            Instant allocatedAt,
            @Nullable WorkerId bearerId,
            ProjectId projectId
    ) {
        Assert.notNull(allocatedAt, "Allocated at timestamp cannot be null");
        Assert.notNull(projectId, "Project ID cannot be null");
        this.allocatedAt = allocatedAt;
        this.bearerId = bearerId;
        this.projectId = projectId;
    }

    public Instant getAllocatedAt() {
        return allocatedAt;
    }

    public void setAllocatedAt(Instant allocatedAt) {
        this.allocatedAt = allocatedAt;
    }

    public WorkerId getBearerId() {
        return bearerId;
    }

    public void setBearerId(WorkerId bearerId) {
        this.bearerId = bearerId;
    }

    public ProjectId getProjectId() {
        return projectId;
    }

    public void setProjectId(ProjectId projectId) {
        this.projectId = projectId;
    }
}
