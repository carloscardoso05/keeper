package cardoso.carlos.keeper.users.persistence;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "users_data")
@Inheritance(strategy = InheritanceType.JOINED)
@Getter
@Setter
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @NotNull
    @Column(nullable = false)
    private String name;

    public UserEntity() {
    }

    public UserEntity(UUID id, String name) {
        this.id = id;
        this.name = name;
    }
}
