import 'package:flutter/material.dart';

import '../models/property.dart';

class PropertyCard extends StatefulWidget {
  final Property property;
  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late bool isHover = false;

  @override
  void initState() {
    super.initState();
    isHover = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        splashColor: Colors.transparent,
        mouseCursor: SystemMouseCursors.click,
        canRequestFocus: true,
        focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        onHover: (hovering) {
          setState(() {
            isHover = !isHover;
          });
        },
        onTap: () {
          debugPrint('yo!');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          child: Card(
            elevation: isHover ? 12 : 2.5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // TITLE ROW
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.property.getTitle.trim(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  // ADDRESS ROW
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Text(
                          widget.property.getAddress,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),

                  // IMAGE
                  Expanded(child: widget.property.getPropertyImage),

                  // LISTING PRICE

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          widget.property.getListingPrice,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
