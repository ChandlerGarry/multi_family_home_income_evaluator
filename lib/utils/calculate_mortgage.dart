import 'dart:math';

double calculateMortage(
    double principal, double interestRate, int totalYearsOfPayments) {
  // APRC /per 12 months
  double aprcPerMonth = interestRate / 100 / 12;
  int totalMonthlyPayments = totalYearsOfPayments * 12;

  double mortage = principal *
      (aprcPerMonth * pow(1 + aprcPerMonth, totalMonthlyPayments)) /
      (pow(1 + aprcPerMonth, totalMonthlyPayments) - 1);
  return mortage.roundToDouble();
  // return principal * (pow((1 + aprcPerMonth), totalMonthlyPayments) /  )
  // return (principal * (rate * (powFunction)) / powFunction - 1).roundToDouble();
}
