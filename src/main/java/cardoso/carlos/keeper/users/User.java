package cardoso.carlos.keeper.users;

import lombok.Getter;
import org.springframework.util.Assert;

@Getter
abstract public class User {
    private final String name;
    private final CPF cpf;
    private final Email email;

    public User(String name, CPF cpf, Email email) {
        Assert.hasText(name, "Name can't be empty or null");
        Assert.notNull(cpf, "CPF can't be null");
        Assert.notNull(email, "Email can't be null");

        this.name = name;
        this.cpf = cpf;
        this.email = email;
    }
}
