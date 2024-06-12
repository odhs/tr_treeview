import 'package:flutter/material.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';

class TractianToggleButtons extends StatefulWidget {
  final List<Map<String, dynamic>> buttonData;

  const TractianToggleButtons({super.key, required this.buttonData});

  @override
  ToggleButtonsExampleState createState() => ToggleButtonsExampleState();
}

class ToggleButtonsExampleState extends State<TractianToggleButtons> {
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(widget.buttonData.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(widget.buttonData.length, (index) {
        return Padding(
          padding: EdgeInsets.only(
              right: index < widget.buttonData.length - 1 ? 8.0 : 0),
          child: ToggleButtons(
            isSelected: [isSelected[index]],
            constraints: const BoxConstraints.tightFor(height: 32),
            borderRadius: BorderRadius.circular(4),
            selectedBorderColor: TractianColors.primaryPrimary2,
            selectedColor: TractianColors.neutralColorsWhite,
            fillColor: TractianColors.primaryPrimary2,
            color: TractianColors.neutralColorsGray500,
            onPressed: (int i) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(
                      widget.buttonData[index]['icon'],
                      size: 16.0,
                    ),
                    const SizedBox(width: 4),
                    Text(widget.buttonData[index]['label']),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
