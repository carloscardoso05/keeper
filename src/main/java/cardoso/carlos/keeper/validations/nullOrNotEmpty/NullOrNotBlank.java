package cardoso.carlos.keeper.validations.nullOrNotEmpty;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = NullOrNotBlankValidator.class)
public @interface NullOrNotBlank {
	String message() default "must not be null or blank";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}