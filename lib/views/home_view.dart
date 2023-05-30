import 'package:finance_helper/view_models/home_add_property_viewmodel.dart';
import 'package:finance_helper/widgets/add_home_button.dart';
import 'package:finance_helper/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../models/mock_property_data.dart';
import '../widgets/home_add_property_dialog.dart';
import '../widgets/property_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeAddPropertyViewModel addPropertyViewModel = HomeAddPropertyViewModel();
    double screenWidth = MediaQuery.of(context).size.width;

    // Returns the amount of Cards to display per row, depending on screenWidth
    int getCrossAxisCount(double screenWidth) {
      if (screenWidth > 1272) {
        return 3;
      } else if (screenWidth < 1272 && screenWidth >= 850) {
        return 2;
      } else {
        return 1;
      }
    }

    return Scaffold(
      floatingActionButton: AddHomeButton(
        onPressed: () {
          addPropertyViewModel.addPropertyFocusNode.requestFocus();
          showDialog(
            context: context,
            builder: (BuildContext context) => AddPropertyDialog(
              addPropertyViewModel: addPropertyViewModel,
            ),
          );
        },
        toolTip: 'Add New Property',
        icon: const Icon(Icons.add),
      ),
      appBar: CustomAppBar(
        title: 'Home ${screenWidth.roundToDouble()}',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                GridView.builder(
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(screenWidth),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: listOfProperties.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  itemBuilder: (context, index) {
                    return PropertyCard(
                      property: listOfProperties[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
