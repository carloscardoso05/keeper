package cardoso.carlos.keeper.application.brand;

import org.springframework.util.Assert;

import java.util.UUID;

public record BrandId(UUID value) {
    public BrandId() {
        this(UUID.randomUUID());
    }

    public BrandId {
        Assert.notNull(value, "Id must not be null");
    }
}