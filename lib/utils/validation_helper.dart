String validationPhone(String value) {
  String pattern = r'^[Z0-9+]';
  String firstZeroPattern = r'^0+';
  RegExp regExp = new RegExp(pattern);
  RegExp regExpFirstZero = new RegExp(firstZeroPattern);
  if (value.length == 0) {
    return "Field is Required";
  } else if (value.length < 8) {
    return "Minimum 8 Character";
  } else if (!regExp.hasMatch(value)) {
    return "Must contain number only";
  }else if(regExpFirstZero.hasMatch(value)){
    return "Should not start from 0";
  }
  return null;
}