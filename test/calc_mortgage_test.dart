import 'package:flutter_test/flutter_test.dart';
import 'package:finance_helper/utils/calculate_mortgage.dart';

void main() async {
  double principal = 350000;
  double interestRate = 3.3;
  int totalYearsOfPayments = 25;

  test('Calulating Mortage Test', () {
    expect(
      calculateMortage(principal, interestRate, totalYearsOfPayments),
      1715,
    );
  });
}
