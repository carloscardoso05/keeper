import 'package:keeper/domain/dtos/credentials.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((credential) => credential.password, key: 'password')
        .notEmpty()
        .minLength(8);

    ruleFor((crendential) => crendential.email, key: 'email').validEmail();
  }
}
