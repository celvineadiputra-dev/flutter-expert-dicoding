import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets("Contain image", (WidgetTester test) async {
    final image = find.byType(Image);

    await test.pumpWidget(_makeTestableWidget(const AboutPage()));

    expect(image, findsOneWidget);
  });
}
