String doubleDigit(int digit) {
  return digit > 9 ? digit.toString() : '0$digit';
}
