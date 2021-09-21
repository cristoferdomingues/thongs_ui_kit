import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputRoundTemplate extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Widget child;
  final bool hasError;
  final String? errorMessage;

  const InputRoundTemplate(
      {Key? key,
      required this.label,
      required this.child,
      this.icon,
      this.hasError = false,
      this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ],
          ),
        ),
        Container(
          key: const Key('border-color-container'),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor(),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: <Widget>[
              renderIconWidget(),
              Container(
                height: 30.0,
                width: 1.0,
                color: borderColor(),
                margin: const EdgeInsets.only(left: 00.0, right: 10.0),
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
        renderErrorMessage()
      ],
    );
  }

  Color borderColor() {
    return (hasError == false)
        ? Colors.grey.withOpacity(0.5)
        : Colors.red.withOpacity(0.5);
  }

  Widget renderErrorMessage() {
    if (hasError == true) {
      return Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 10.0),
        ),
      );
    } else {
      return const IgnorePointer();
    }
  }

  Widget renderIconWidget() {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Icon(
          icon,
          color: Colors.grey,
        ),
      );
    } else {
      return const IgnorePointer();
    }
  }
}
