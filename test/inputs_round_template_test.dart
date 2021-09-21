import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thongs_ui_kit/inputs/inputs.dart';

void main() {
  setUpAll(() {
    // This is called once before ALL tests
  });

  setUp(() {
    // This is called once before EVERY test
  });

  tearDownAll(() {
    // This is called once after ALL tests
  });

  tearDown(() {
    // This is called once after EVERY test
  });
  testWidgets('Testing Inputs Round Template Is Rendering Properly',
      (WidgetTester tester) async {
    var controller = TextEditingController.fromValue(
        const TextEditingValue(text: 'Crístofer Domingues'));

    bool _hasError = false;
    String _errorMessage = "What a heck!!";

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: InputRoundTemplate(
              label: 'FullName:',
              icon: Icons.person,
              hasError: _hasError,
              errorMessage: _errorMessage,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'It is a test situation dude',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorStyle: TextStyle(fontSize: 0.0, height: 0.0)),
              )),
        ),
      ),
    ));

    var textFieldWidget = find.text('Crístofer Domingues');
    var iconWidget = find.byIcon(Icons.person);
    var errorMessageWidget = find.text(_errorMessage);
    var borderColoredWidget = find.byKey(const Key('border-color-container'));

    expect(errorMessageWidget, findsNothing);
    expect(textFieldWidget, findsOneWidget);
    expect(iconWidget, findsOneWidget);

    // Tests if the border radius is according to the rounded one and if it's styled as a valid field
    expect(
        tester.widget(borderColoredWidget),
        isA<Container>().having(
            (container) => container.decoration,
            'decoration',
            BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            )));
  });

  testWidgets('Testing Inputs Round Template Is Rendering With Error',
      (WidgetTester tester) async {
    var controller = TextEditingController.fromValue(
        const TextEditingValue(text: 'Crístofer Domingues'));

    bool _hasError = true;
    String _errorMessage = "What a heck!!";

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: InputRoundTemplate(
              label: 'FullName:',
              icon: Icons.person,
              hasError: _hasError,
              errorMessage: _errorMessage,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'It is a test situation dude',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorStyle: TextStyle(fontSize: 0.0, height: 0.0)),
              )),
        ),
      ),
    ));

    var textFieldWidget = find.text('Crístofer Domingues');
    var iconWidget = find.byIcon(Icons.person);
    var errorMessageWidget = find.text(_errorMessage);
    var borderColoredWidget = find.byKey(const Key('border-color-container'));

    expect(errorMessageWidget, findsOneWidget);
    expect(textFieldWidget, findsOneWidget);
    expect(iconWidget, findsOneWidget);

    // Tests if the border radius is according to the rounded one and if it's styled as a invalid field
    expect(
        tester.widget(borderColoredWidget),
        isA<Container>().having(
            (container) => container.decoration,
            'decoration',
            BoxDecoration(
              border: Border.all(
                color: Colors.red.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            )));
  });
}
