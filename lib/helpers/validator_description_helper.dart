class ValidatorDescription {
  static String isNotEmptyValue(String text) {
    if (text.length == 0) return 'Campo obrigatório';
    return null;
  }
}