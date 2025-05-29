package cardoso.carlos.keeper.domain.user;

import org.springframework.util.Assert;

import java.util.UUID;

public record WorkerId(UUID value) {
    public WorkerId() {
        this(UUID.randomUUID());
    }

    public WorkerId {
        Assert.notNull(value, "Id must not be null");
    }
}
