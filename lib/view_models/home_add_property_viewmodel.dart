import 'package:flutter/material.dart';
import 'dart:math';

class HomeAddPropertyViewModel extends ChangeNotifier {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // What the house was listed at
  final TextEditingController _listingPriceController = TextEditingController();
  // The annual interest rate, in a percent (probably some sort of double)
  final TextEditingController _interestRateController = TextEditingController();

  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _numOfTotalPayments = TextEditingController();
  final FocusNode addPropertyFocusNode = FocusNode();

  final GlobalKey _newPropertyFormKey = GlobalKey<FormState>();

  GlobalKey get newPropertyFormKey => _newPropertyFormKey;
  String get titleText {
    if (_titleController.text != '') {
      return _titleController.text;
    } else {
      return 'New Property';
    }
  }

  double? get numOfTotalPayments => double.tryParse(_numOfTotalPayments.text);
  TextEditingController get titleController => _titleController;
  TextEditingController get addressController => _addressController;
  TextEditingController get listingPriceController => _listingPriceController;
  TextEditingController get interestController => _interestRateController;
  TextEditingController get principalController => _principalController;
  bool get formInProgress {
    if (titleController.text != '' ||
        addressController.text != '' ||
        listingPriceController.text != '' ||
        interestController.text != '' ||
        principalController.text != '') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _addressController.dispose();
    _listingPriceController.dispose();
    _interestRateController.dispose();
    _principalController.dispose();
    _numOfTotalPayments.dispose();
  }

  void clearControllers() {
    _titleController.clear();
    _addressController.clear();
    _listingPriceController.clear();
    _interestRateController.clear();
    _principalController.clear();
    _numOfTotalPayments.clear();
  }

  double calculateMortage(
      double principal, double interestRate, int totalYearsOfPayments) {
    // APRC /per 12 months
    double rate = interestRate / 100 / 12;
    //
    double totalNumberOfPayments = totalYearsOfPayments * 12;
    return (principal *
            (rate * pow((1 + rate), totalNumberOfPayments)) /
            pow((1 + rate), totalNumberOfPayments) -
        1);
  }
}
