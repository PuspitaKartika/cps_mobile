class FormValidator {
  static String? required(dynamic value) {
    if (value == null ||
        value == false ||
        ((value is Iterable || value is String || value is Map) &&
            value.length == 0)) {
      return "Tidak boleh kosong";
    }
    return null;
  }

  static String? email(dynamic value) {
    if (value == null ||
        value == false ||
        ((value is Iterable || value is String || value is Map) &&
            value.length == 0)) {
      return "Email tidak boleh kosong";
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return "Format email salah";
    }
    return null;
  }

  static String? phone(dynamic telepon) {
    if (telepon == null ||
        telepon == false ||
        ((telepon is Iterable || telepon is String || telepon is Map) &&
            telepon.length == 0)) {
      return "Tidak boleh kosong";
    } else if (!RegExp(r"^[0-9+#-]*$").hasMatch(telepon)) {
      return "Tidak Valid";
    } else if (telepon.toString().length <= 10) {
      return "Minimal 10 karakter";
    } else {
      return null;
    }
  }
}
