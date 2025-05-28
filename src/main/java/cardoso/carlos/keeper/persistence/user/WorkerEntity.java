package cardoso.carlos.keeper.persistence.user;

import cardoso.carlos.keeper.application.user.WorkerId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "workers")
public class WorkerEntity extends UserEntity {
    public WorkerEntity(WorkerId id, String name) {
        super(id.value(), name);
    }

    public WorkerEntity() {
    }
}
