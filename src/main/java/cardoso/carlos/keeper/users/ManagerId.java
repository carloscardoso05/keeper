package cardoso.carlos.keeper.users;

import org.springframework.util.Assert;

import java.util.UUID;

public record ManagerId(UUID value) {
    public ManagerId() {
        this(UUID.randomUUID());
    }

    public ManagerId {
        Assert.notNull(value, "Id must not be null");
    }
}
