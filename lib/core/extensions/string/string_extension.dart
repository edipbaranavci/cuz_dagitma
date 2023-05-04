import 'package:kartal/kartal.dart';

extension FormStringExtension on String? {
  String? get defaultEmailValidator {
    if (!isValidEmail) {
      return 'Lütfen geçerli bir e-posta adresi giriniz.';
    }
    return null;
  }

  String? get defaultPassValidator {
    final value = this ?? '';
    if (this == null || value.isEmpty || value.length < 6) {
      return 'Şifreniz 6 karakterden büyük olmalıdır.';
    }
    return null;
  }

  String? get defaultEmptyValidator {
    final value = this ?? '';
    if (this == null || value.isEmpty) {
      return 'Lütfen boş alan bırakmayın.';
    }
    return null;
  }

  String? get defaultPhoneValidator {
    final value = this ?? '';
    if (this == null || value.isEmpty && value.length < 10) {
      return 'Lütfen uygun bir telefon numarısı giriniz.';
    }
    return null;
  }

  String? get defaultNameValidator {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Lütfen bir isim girin.';
    }
    return null;
  }
}
