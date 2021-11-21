import '../../strings/abstracts/validator.dart';
import '../../strings/strings_provider.dart';
import 'email_string_extension.dart';

typedef TextValidator = String? Function(String?);

class Validators {
  static ValidatorStringsMixin get _s =>
      StringsProvider.i.strings.validatorStrings;

  static TextValidator get empty => (value) {
        if (value == null || value.trim().isEmpty) {
          return _s.empty;
        }
        return null;
      };

  static TextValidator get email => (value) {
        value = value?.trim();
        if (value == null || value.isEmpty) {
          return _s.empty;
        }
        if (!value.isValidEmail()) {
          return _s.emailInvalid;
        }
        return null;
      };

  static TextValidator get strongPassword => (value) {
        value = value?.trim();
        if (value == null || value.isEmpty) {
          return _s.empty;
        }
        if (!value.isStrongPassword()) {
          return _s.passwordNotStrongEnough;
        }
        return null;
      };
}
