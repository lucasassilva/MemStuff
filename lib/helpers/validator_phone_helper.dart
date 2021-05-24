class ValidatorPhone {
  static String isNotEmptyValue(String text)
  {
    String pattern = r'((\(?\d{2}\)?\s)?(\d{4,5}\-\d{4}))';
    RegExp regExp = new RegExp(pattern);

    if (text.length == 0) return 'Campo obrigatório';

    else if (!regExp.hasMatch(text) && text.length != 14 ) return 'Telefone inválido';

    return null;
  }
}