package cardoso.carlos.keeper.items.persistence;

import cardoso.carlos.keeper.projects.persistence.ProjectEntity;
import cardoso.carlos.keeper.users.persistence.WorkerEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "allocations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AllocationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @OneToOne
    private ItemEntity item;

    @ManyToOne
    @JoinColumn(name = "bearer_id")
    private WorkerEntity bearer;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private ProjectEntity project;

    private Instant allocatedAt;
}
