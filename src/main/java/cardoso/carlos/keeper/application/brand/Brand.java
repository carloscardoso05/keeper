package cardoso.carlos.keeper.application.brand;

import org.springframework.util.Assert;

public record Brand(BrandId id, String name) {
    public Brand {
        Assert.notNull(id, "Id must not be null");
        Assert.hasText(name, "Name must not be empty or null");
    }
}
