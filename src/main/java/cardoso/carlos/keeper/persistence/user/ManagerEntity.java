package cardoso.carlos.keeper.persistence.user;

import cardoso.carlos.keeper.application.user.ManagerId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "managers")
public class ManagerEntity extends UserEntity {
    public ManagerEntity(ManagerId id, String name) {
        super(id.value(), name);
    }

    public ManagerEntity() {
    }
}
