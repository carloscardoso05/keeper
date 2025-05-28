package cardoso.carlos.keeper.users.persistence;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.util.UUID;

@Entity
@Table(name = "workers")
public class WorkerEntity extends UserEntity {
    public WorkerEntity(UUID id, String name) {
        super(id, name);
    }

    public WorkerEntity() {
    }
}
