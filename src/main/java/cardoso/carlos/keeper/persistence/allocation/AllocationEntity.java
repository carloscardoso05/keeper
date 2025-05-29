package cardoso.carlos.keeper.persistence.allocation;

import cardoso.carlos.keeper.persistence.item.ItemEntity;
import cardoso.carlos.keeper.persistence.project.ProjectEntity;
import cardoso.carlos.keeper.persistence.user.WorkerEntity;
import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(name = "allocations")
public class AllocationEntity {
    @EmbeddedId
    private AllocationId id;

    @OneToOne
    private ItemEntity item;

    @ManyToOne
    @JoinColumn(name = "bearer_id")
    private WorkerEntity bearer;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private ProjectEntity project;

    private Instant allocatedAt;

    public AllocationEntity(AllocationId id, ItemEntity item, WorkerEntity bearer, ProjectEntity project, Instant allocatedAt) {
        this.id = id;
        this.item = item;
        this.bearer = bearer;
        this.project = project;
        this.allocatedAt = allocatedAt;
    }

    public AllocationEntity() {
    }

    public AllocationId getId() {
        return id;
    }

    public void setId(AllocationId id) {
        this.id = id;
    }

    public ItemEntity getItem() {
        return item;
    }

    public void setItem(ItemEntity item) {
        this.item = item;
    }

    public WorkerEntity getBearer() {
        return bearer;
    }

    public void setBearer(WorkerEntity bearer) {
        this.bearer = bearer;
    }

    public ProjectEntity getProject() {
        return project;
    }

    public void setProject(ProjectEntity project) {
        this.project = project;
    }

    public Instant getAllocatedAt() {
        return allocatedAt;
    }

    public void setAllocatedAt(Instant allocatedAt) {
        this.allocatedAt = allocatedAt;
    }
}
