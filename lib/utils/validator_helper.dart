import 'package:form_builder_validators/form_builder_validators.dart';

class ValidatorHelper {
  static String? Function(T?) require<T>() {
    return FormBuilderValidators.required(errorText: "Data tidak boleh kosong");
  }

  static String? Function(String?) email() {
    return FormBuilderValidators.compose(
      [
        FormBuilderValidators.required(errorText: "Email tidak boleh kosong"),
        FormBuilderValidators.email(errorText: "Alamat email tidak valid"),
      ],
    );
  }

  static String? Function(String?) password() {
    return FormBuilderValidators.compose(
      [
        FormBuilderValidators.minLength(8,
            errorText: "Kata sandi minimal 8 karakter"),
        // FormBuilderValidators.match(r"^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]+$",
        //     errorText: "Mohon isi kata sandi sesuai ketentuan"),
      ],
    );
  }
}
