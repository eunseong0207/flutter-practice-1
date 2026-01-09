void main() {
  //
  final fi = FirebaseFiresotre.instance();
  final f2 = FirebaseFiresotre.instance();
  final f3 = FirebaseFiresotre.instance();
}

class FirebaseFiresotre {
  static FirebaseFiresotre? _instance;

  FirebaseFiresotre._();

  factory FirebaseFiresotre.instance() {
    if (_instance == null) {
      _instance = FirebaseFiresotre._();
    }
    return _instance!;
  }
}
