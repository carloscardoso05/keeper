package cardoso.carlos.keeper.application.valueObjects;

import org.hibernate.validator.internal.constraintvalidators.hv.br.CPFValidator;
import org.springframework.util.Assert;

public record CPF(String value) {
    public CPF {
        var cpfValidator = new CPFValidator();
        Assert.hasText(value, "CPF must not be empty");
        Assert.isTrue(value.length() == 11, "CPF must be 11 digits long");
        Assert.isTrue(cpfValidator.isValid(value, null), "Invalid CPF format");
    }
}
