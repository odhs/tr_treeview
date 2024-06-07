import 'package:flutter/material.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';

class HomeMainButton extends StatelessWidget {
  final String title;
  final String id;
  final void Function()? onPressed;
  const HomeMainButton({
    super.key,
    required this.title,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverElevation: 0.0,
      hoverColor: Colors.black12,
      elevation: 0.0,
      onPressed: onPressed,
      color: TractianColors.primaryPrimary2,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/company.png',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 12.0),
            Text(
              title,
              style: TextStyle(
                color: TractianColors.neutralColorsWhite,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
