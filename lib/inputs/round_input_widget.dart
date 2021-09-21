import 'package:flutter/material.dart';
import 'package:thongs_ui_kit/inputs/templates/inputs_round_template.dart';

class RoundInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final String? hintText;
  final Function? validator;
  final bool? obscureText;
  final String? initialValue;
  final Function? onTap;
  final Function? onChanged;
  final TextInputType keyboardType;
  const RoundInput(
      {Key? key,
      required this.label,
      required this.controller,
      this.icon,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.initialValue,
      this.onTap,
      this.onChanged,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  @override
  _RoundInputState createState() => _RoundInputState();
}

class _RoundInputState extends State<RoundInput> {
  bool _hasError = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return InputRoundTemplate(
        key: widget.key,
        label: widget.label,
        icon: widget.icon,
        hasError: _hasError,
        errorMessage: _errorMessage,
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              errorStyle: const TextStyle(fontSize: 0.0, height: 0.0)),
          controller: widget.controller,
          validator: (value) {
            if (widget.validator == null) return null;

            dynamic validationResult = widget.validator!(value);
            if (validationResult != null && validationResult.isNotEmpty) {
              setState(() {
                _hasError = true;
                _errorMessage = validationResult;
              });
              return validationResult;
            } else {
              setState(() {
                _hasError = false;
                _errorMessage = '';
              });
              return null;
            }
          },
          obscureText: widget.obscureText!,
          initialValue: widget.initialValue,
          onTap: () => {
            if (widget.onTap != null) {widget.onTap!()}
          },
          onChanged: (String value) => {
            if (widget.onChanged != null) {widget.onChanged!(value)}
          },
          keyboardType: widget.keyboardType,
        ));
  }
}
