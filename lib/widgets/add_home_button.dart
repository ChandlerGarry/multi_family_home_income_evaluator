import 'package:flutter/material.dart';

class AddHomeButton extends StatefulWidget {
  final void Function()? onPressed;
  final String toolTip;
  final Icon icon;
  const AddHomeButton({
    super.key,
    required this.onPressed,
    required this.toolTip,
    required this.icon,
  });

  @override
  State<AddHomeButton> createState() => _AddHomeButtonState();
}

class _AddHomeButtonState extends State<AddHomeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Add New Property'),
      onPressed: widget.onPressed,
      tooltip: widget.toolTip,
      icon: widget.icon,
    );
  }
}
