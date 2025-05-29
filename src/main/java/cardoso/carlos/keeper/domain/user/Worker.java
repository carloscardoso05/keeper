package cardoso.carlos.keeper.domain.user;

import cardoso.carlos.keeper.domain.valueObjects.CPF;
import cardoso.carlos.keeper.domain.valueObjects.Email;
import org.springframework.util.Assert;

public class Worker extends User {
    private final WorkerId id;

    public Worker(WorkerId id, String name, CPF cpf, Email email) {
        super(name, cpf, email);
        Assert.notNull(id, "Id must not be null");
        this.id = id;
    }

    public WorkerId getId() {
        return id;
    }
}
