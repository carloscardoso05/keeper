package cardoso.carlos.keeper.domain;

import cardoso.carlos.keeper.application.valueObjects.CPF;
import cardoso.carlos.keeper.application.valueObjects.Email;
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
