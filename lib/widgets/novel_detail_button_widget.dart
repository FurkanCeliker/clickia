import 'package:flutter/material.dart';

class NovelPageElevatedButtonWidget extends StatelessWidget {
  NovelPageElevatedButtonWidget({
    required Widget buttonContent,
    required Color buttonColor,
    required VoidCallback onTapButton,
    Key? key,
  })  : _buttonContent = buttonContent,
        _buttonColor = buttonColor,
        _onTapButton = onTapButton,
        super(key: key);
  Widget _buttonContent;
  Color _buttonColor;
  VoidCallback _onTapButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            primary: _buttonColor),
        onPressed: _onTapButton,
        child: _buttonContent);
  }
}
