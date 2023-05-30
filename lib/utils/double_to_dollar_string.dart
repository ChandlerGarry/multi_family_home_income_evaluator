import 'package:intl/intl.dart';

String doubleToDollar(double num) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );
  return currencyFormat.format(num);
}
