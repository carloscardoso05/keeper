package cardoso.carlos.keeper.items;

import org.springframework.util.Assert;

import java.util.UUID;

public record AllocationId(UUID value) {
    public AllocationId() {
        this(UUID.randomUUID());
    }

    public AllocationId {
        Assert.notNull(value, "Id must not be null");
    }
}