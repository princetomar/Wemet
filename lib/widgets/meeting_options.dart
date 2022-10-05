import 'package:flutter/material.dart';
import 'package:wemet2/utils/colors.dart';

class MeetingsOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingsOption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}
