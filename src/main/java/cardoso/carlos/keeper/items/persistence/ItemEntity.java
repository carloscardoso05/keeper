package cardoso.carlos.keeper.items.persistence;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "items")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false)
    @NotBlank
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    @NotBlank
    private String assetCode;

    @ManyToOne
    @JoinColumn(nullable = false, name = "brand_id")
    private BrandEntity brand;

    @OneToOne(mappedBy = "item")
    private AllocationEntity allocation;
}
