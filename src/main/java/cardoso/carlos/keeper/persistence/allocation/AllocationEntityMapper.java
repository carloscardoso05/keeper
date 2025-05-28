package cardoso.carlos.keeper.persistence.allocation;

import cardoso.carlos.keeper.application.allocation.Allocation;
import cardoso.carlos.keeper.persistence.item.ItemEntity;
import cardoso.carlos.keeper.persistence.project.ProjectEntity;
import cardoso.carlos.keeper.persistence.user.WorkerEntity;
import org.springframework.stereotype.Component;

@Component
public class AllocationEntityMapper {
    public AllocationEntity toEntity(Allocation allocation, ItemEntity itemEntity, WorkerEntity workerEntity, ProjectEntity projectEntity) {
        return new AllocationEntity(
                allocation.id(),
                itemEntity,
                workerEntity,
                projectEntity,
                allocation.allocatedAt()
        );
    }

    public Allocation toModel(AllocationEntity allocationEntity) {
        return new Allocation(
                allocationEntity.getId(),
                allocationEntity.getItem().getId(),
                allocationEntity.getAllocatedAt(),
                null,
                null
        );
    }
}
