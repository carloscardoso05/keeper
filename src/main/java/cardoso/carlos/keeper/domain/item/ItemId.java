package cardoso.carlos.keeper.domain.item;

import org.springframework.util.Assert;

import java.util.UUID;

public record ItemId(UUID value) {
    public ItemId() {
        this(UUID.randomUUID());
    }

    public ItemId {
        Assert.notNull(value, "Id must not be null");
    }
}