package cardoso.carlos.keeper.application.valueObjects;

import org.hibernate.validator.internal.constraintvalidators.hv.EmailValidator;
import org.springframework.util.Assert;

public record Email(String value) {
    public Email {
        var validator = new EmailValidator();
        Assert.notNull(value, "Email cannot be null");
        Assert.isTrue(validator.isValid(value, null), "Email is not valid");
    }
}
