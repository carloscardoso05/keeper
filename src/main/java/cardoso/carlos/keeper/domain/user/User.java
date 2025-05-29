package cardoso.carlos.keeper.domain.user;

import cardoso.carlos.keeper.domain.valueObjects.CPF;
import cardoso.carlos.keeper.domain.valueObjects.Email;
import org.springframework.util.Assert;

abstract public class User {
    private String name;
    private CPF cpf;
    private Email email;

    public User(String name, CPF cpf, Email email) {
        Assert.hasText(name, "Name can't be empty or null");
        Assert.notNull(cpf, "CPF can't be null");
        Assert.notNull(email, "Email can't be null");

        this.name = name;
        this.cpf = cpf;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public CPF getCpf() {
        return cpf;
    }

    public Email getEmail() {
        return email;
    }

    public void setEmail(Email email) {
        Assert.notNull(email, "Email can't be null");
        this.email = email;
    }
}
