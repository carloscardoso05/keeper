package cardoso.carlos.keeper.persistence.item;

import cardoso.carlos.keeper.application.item.ItemId;
import cardoso.carlos.keeper.persistence.allocation.AllocationEntity;
import cardoso.carlos.keeper.persistence.brand.BrandEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "items")
public class ItemEntity {
    @EmbeddedId
    private ItemId id;

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

    public ItemEntity(ItemId id, String name, String description, String assetCode, BrandEntity brand, AllocationEntity allocation) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.assetCode = assetCode;
        this.brand = brand;
        this.allocation = allocation;
    }

    public ItemEntity() {
    }

    public ItemId getId() {
        return id;
    }

    public void setId(ItemId id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    public BrandEntity getBrand() {
        return brand;
    }

    public void setBrand(BrandEntity brand) {
        this.brand = brand;
    }

    public AllocationEntity getAllocation() {
        return allocation;
    }

    public void setAllocation(AllocationEntity allocation) {
        this.allocation = allocation;
    }
}
