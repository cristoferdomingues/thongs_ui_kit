import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thongs_ui_kit/inputs/inputs.dart';

void main() {
  testWidgets("If Round Input is behaving as expected",
      (WidgetTester tester) async {
    var controller =
        TextEditingController.fromValue(const TextEditingValue(text: ''));
    String inputText = "Crístofer Domingues";
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                      child: RoundInput(
                          key: const Key("test-key"),
                          label: "Full Name",
                          controller: controller,
                          validator: (String value) =>
                              value.isEmpty ? 'Full Name is Required' : null)),
                  Expanded(
                      child: TextButton(
                          onPressed: () => {_formKey.currentState?.validate()},
                          child: const Text('Validate')))
                ],
              )),
        ),
      ),
    ));

    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, inputText);

    expect(
        tester.widget(textField),
        isA<TextFormField>()
            .having((input) => input.controller?.text, 'text', inputText));

    await tester.enterText(textField, '');

    var validatorButton = find.text('Validate');
    await tester.tap(validatorButton);
    await tester.pump(const Duration(seconds: 2));
    var validatorMessage = find.text('Full Name is Required');
    expect(validatorMessage, findsWidgets);
  });
}
