package cardoso.carlos.keeper.domain.user;

import cardoso.carlos.keeper.domain.valueObjects.CPF;
import cardoso.carlos.keeper.domain.valueObjects.Email;
import org.springframework.util.Assert;

public class Manager extends User {
    private final ManagerId id;

    public Manager(ManagerId id, String name, CPF cpf, Email email) {
        super(name, cpf, email);
        Assert.notNull(id, "Manager ID must not be null");
        this.id = id;
    }

    public ManagerId getId() {
        return id;
    }
}
