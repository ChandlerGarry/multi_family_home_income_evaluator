import 'package:finance_helper/view_models/home_add_property_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPropertyDialog extends StatefulWidget {
  final HomeAddPropertyViewModel addPropertyViewModel;
  const AddPropertyDialog({super.key, required this.addPropertyViewModel});

  @override
  State<AddPropertyDialog> createState() => _AddPropertyDialogState();
}

class _AddPropertyDialogState extends State<AddPropertyDialog> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: screenHeight * 0.65,
          width: screenWidth * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.addPropertyViewModel.titleText,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.addPropertyViewModel.formInProgress) {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text(
                                'Close Without Adding New Property?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    widget.addPropertyViewModel
                                        .clearControllers();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Form(
                        key: HomeAddPropertyViewModel().newPropertyFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TITLE FIELD
                            SizedBox(
                              width: screenWidth * 0.15,
                              child: TextFormField(
                                onTapOutside: (value) {
                                  setState(() {});
                                },
                                onFieldSubmitted: (value) {
                                  setState(() {});
                                  widget
                                      .addPropertyViewModel.addPropertyFocusNode
                                      .nextFocus();
                                },
                                controller:
                                    widget.addPropertyViewModel.titleController,
                                maxLength: 40,
                                decoration: InputDecoration(
                                  counterText: '',
                                  labelText: 'Title',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),
                            // ADDRESS FIELD
                            SizedBox(
                              width: screenWidth * 0.25,
                              child: TextFormField(
                                maxLength: 60,
                                controller: widget
                                    .addPropertyViewModel.addressController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  labelText: 'Address',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),
                            // LISTING PRICE FIELD
                            SizedBox(
                              width: screenWidth * 0.1,
                              child: TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: true,
                                ),
                                maxLength: 60,
                                controller: widget.addPropertyViewModel
                                    .listingPriceController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  labelText: 'Listing Price',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),

                            // PRINCIPAL FIELD
                            SizedBox(
                              width: screenWidth * 0.1,
                              child: TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: true,
                                ),
                                maxLength: 60,
                                controller: widget
                                    .addPropertyViewModel.principalController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    focusNode: null,
                                    tooltip:
                                        'The amount of money to be borrowed, before interest begins to apply.',
                                    icon: const Icon(
                                      Icons.info,
                                      size: 16,
                                    ),
                                  ),
                                  counterText: '',
                                  labelText: 'Principal',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),
                            // INTEREST RATE FIELD
                            SizedBox(
                              width: screenWidth * 0.1,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: true,
                                ),
                                maxLength: 60,
                                controller: widget
                                    .addPropertyViewModel.interestController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  labelText: 'Interest Rate',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),

                            // MORTGAGE FIELD
                            SizedBox(
                              width: screenWidth * 0.15,
                              child: TextFormField(
                                enabled: false,
                                onTapOutside: (value) {
                                  setState(() {});
                                },
                                onFieldSubmitted: (value) {
                                  setState(() {});
                                  widget
                                      .addPropertyViewModel.addPropertyFocusNode
                                      .nextFocus();
                                },
                                maxLength: 40,
                                decoration: InputDecoration(
                                  counterText: '',
                                  labelText: 'widget.addPropertyViewModel',
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
