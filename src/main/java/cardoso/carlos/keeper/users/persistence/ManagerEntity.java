package cardoso.carlos.keeper.users.persistence;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.util.UUID;

@Entity
@Table(name = "managers")
public class ManagerEntity extends UserEntity {
    public ManagerEntity(UUID id, String name) {
        super(id, name);
    }

    public ManagerEntity() {
    }
}
