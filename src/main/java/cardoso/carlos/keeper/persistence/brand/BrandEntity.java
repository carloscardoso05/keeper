package cardoso.carlos.keeper.persistence.brand;

import cardoso.carlos.keeper.domain.brand.BrandId;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "brands")
public class BrandEntity {
    @EmbeddedId
    private BrandId id;

    @Column(nullable = false, unique = true)
    private String name;

    public BrandId getId() {
        return id;
    }

    public void setId(BrandId id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
