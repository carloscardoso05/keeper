package cardoso.carlos.keeper.users;

import lombok.Getter;
import org.springframework.util.Assert;

@Getter
public class Worker extends User {
    private final WorkerId id;

    public Worker(WorkerId id, String name, CPF cpf, Email email) {
        super(name, cpf, email);
        Assert.notNull(id, "Id must not be null");
        this.id = id;
    }
}
