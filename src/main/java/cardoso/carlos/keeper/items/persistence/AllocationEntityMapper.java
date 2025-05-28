package cardoso.carlos.keeper.items.persistence;

import cardoso.carlos.keeper.items.Allocation;
import cardoso.carlos.keeper.items.AllocationId;
import cardoso.carlos.keeper.items.ItemId;
import cardoso.carlos.keeper.projects.persistence.ProjectEntity;
import cardoso.carlos.keeper.users.persistence.WorkerEntity;
import org.springframework.stereotype.Component;

@Component
public class AllocationEntityMapper {
    public AllocationEntity toEntity(Allocation allocation, ItemEntity itemEntity, WorkerEntity workerEntity, ProjectEntity projectEntity) {
        return new AllocationEntity(
                allocation.id().value(),
                itemEntity,
                workerEntity,
                projectEntity,
                allocation.allocatedAt()
        );
    }

    public Allocation toModel(AllocationEntity allocationEntity) {
        return new Allocation(
                new AllocationId(allocationEntity.getId()),
                new ItemId(allocationEntity.getItem().getId()),
                allocationEntity.getAllocatedAt(),
                null,
                null
        );
    }
}
