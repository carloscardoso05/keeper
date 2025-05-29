package cardoso.carlos.keeper.domain;

import org.springframework.util.Assert;

import java.util.UUID;

public record ProjectId(UUID value) {
    public ProjectId() {
        this(UUID.randomUUID());
    }

    public ProjectId {
        Assert.notNull(value, "Id must not be null");
    }
}
