package cardoso.carlos.keeper.application.item;

import cardoso.carlos.keeper.application.brand.Brand;
import cardoso.carlos.keeper.application.allocation.AllocationId;
import jakarta.annotation.Nullable;
import org.springframework.util.Assert;

public record Item(
        ItemId id,
        String assetCode,
        String name,
        String description,
        Brand brand,
        @Nullable
        AllocationId allocationId
) {
    public Item {
        Assert.notNull(id, "Id must not be null");
        Assert.hasText(assetCode, "Asset code must not be empty or null");
        Assert.hasText(name, "Name must not be empty or null");
        Assert.notNull(brand, "Brand must not be null");
        Assert.notNull(description, "Description must not be null");
    }
}
