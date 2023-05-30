import 'package:finance_helper/utils/double_to_dollar_string.dart';
import 'package:flutter/material.dart';

enum PropertyType { studioApt, singleApt, doubleApt, tripleApt, quadApt }

class Property {
  // HOUSE DETAILS
  String? propertyImageString;
  String? title;
  String address;
  double listingPrice;
  final int id;

  // INCOME
  // How many bedrooms per property.
  // i.e 'For this property, there is one studio and three triple apts'.
  int studioApt = 0;
  int singleApt = 0;
  int doubleApt = 0;
  int tripleApt = 0;
  int quadApt = 0;

  // What is the avg rent cost per apartment, in $.
  double rentPerStudio = 0;
  double rentPerSingle = 0;
  double rentPerDouble = 0;
  double rentPerTriple = 0;
  double rentPerQuad = 0;

  double laundryFee = 0;
  double petFee = 0;
  double incomeTotal = 0;

  // EXPENSES
  Map<String, double> expenses = {
    "Monthly Taxes": 0.0,
    "Insurance": 0.0,
    "Utilities": 0.0,
    "Electric": 0.0,
    "Water": 0.0,
    "Internet": 0.0,
    "Gas": 0.0,
    "Garbage": 0.0,
    "Sewer": 0.0,
    "Vacancy": 0.0,
    "CapEx": 0.0,
  };

  double mortgage = 0;

  double expensesTotal = 0;

  // CASH ON CASH FLOW
  // offer placed on property
  double offer = 0;
  // down payment on property
  double downPayment = 0;
  // earnest money involved in property
  double earnestMoney = 0;
  // estimated cost to furnish/remodel property
  double furnishingCost = 0;
  // any closing costs associated with the deal
  double closingCosts = 0;
  // any cash investments involced with the deal
  double cashInvestment = 0;

  // annual (income - exp) / cash investment
  double amountToClose = 0;

  Property({
    required this.address,
    required this.listingPrice,
    required this.id,
    this.title,
    this.propertyImageString,
  }) {
    title ??= address;
  }

  // GETTERS
  // Returns the property image, or a placeholder, as an image.
  Image get getPropertyImage {
    if (propertyImageString == null) {
      return Image.asset('assets/images/placeholder.png');
    } else {
      return Image.network(propertyImageString!);
    }
  }

  String get getTitle => title ?? address;
  int get getPropertyId => id;
  // Returns the total estimated cost of rent.
  double get getIncomeTotal =>
      rentPerStudio +
      rentPerSingle +
      rentPerDouble +
      rentPerTriple +
      rentPerQuad +
      laundryFee +
      petFee;

  double get getExpensesTotal => expensesTotal;

  Map<String, double> get getExpenses => expenses;

  double get getOffer => offer;
  String get getListingPrice => doubleToDollar(listingPrice);
  double get getDownPayment => downPayment;
  double get getEarnestMoney => earnestMoney;
  double get getFurnishingCost => furnishingCost;
  double get getClosingCost => closingCosts;
  double get getAmountToClose => amountToClose;
  String get getAddress => address;

  // SETTERS
  // Sets the laundry fee for the property.
  set setLaundryFee(double laundryFee) => this.laundryFee = laundryFee;
  // Sets the pet fee for the property.
  set setPetFee(double petFee) => this.petFee = petFee;

  // Sets the cost of a specific apartment type
  void setRentCost(PropertyType propertyType, double rent) =>
      switch (propertyType) {
        PropertyType.studioApt => rentPerStudio = rent,
        PropertyType.singleApt => rentPerSingle = rent,
        PropertyType.doubleApt => rentPerDouble = rent,
        PropertyType.tripleApt => rentPerTriple = rent,
        PropertyType.quadApt => rentPerQuad = rent,
      };

  void setExpense(String expense, double cost) {
    try {
      expenses[expense] != null ? expenses[expense] = cost : null;
    } catch (e) {
      debugPrint('Error setting expense: $e');
      return;
    }
  }

  void setExpenseTotal() {
    if (expenses.isNotEmpty) {
      for (var i = 0; i <= expenses.length - 1; i++) {
        expensesTotal += expenses[i]!;
      }
      expensesTotal += mortgage;
    } else {
      return;
    }
  }

  set setOffer(double offer) => this.offer = offer;
  set setDownPayment(double downPayment) => this.downPayment = downPayment;
  set setEarnestmoney(double earnestMoney) => this.earnestMoney = earnestMoney;
  set setfurnishingCost(double furnishingCost) =>
      this.furnishingCost = furnishingCost;
  set setClosingCost(double setClosingCost) =>
      this.setClosingCost = setClosingCost;

  // TODO
  set setAmountToClose(double setClosingCost) =>
      this.setClosingCost = setClosingCost;

  // CLASS METHODS
  void addExpense(String expense, double cost) {
    expenses[expense] = cost;
  }

  void removeExpense(String expense) {
    try {
      expenses.remove(expense);
    } catch (e) {
      debugPrint('Error removing expense from expenses: $e');
      return;
    }
  }

  void clearExpenses() => expenses.clear();
}
