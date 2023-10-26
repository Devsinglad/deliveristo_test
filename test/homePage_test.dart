import 'package:deliveristo_test/components/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrapTestingWidget({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FetchDogData>(
          create: (_) => FetchDogData(),
        ),
        ChangeNotifierProvider<SearchingController>(create: (_) => SearchingController()),

      ],
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('Navigate to RandomBreedPage from MyHomePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapTestingWidget(child: const MyHomePage()));

    /// Verify that the initial page is MyHomePage
    expect(find.byType(MyHomePage), findsOneWidget);

    /// Tap on the "Random image by breed" item
    await tester.tap(find.text('Random image by breed'.toUpperCase()));
    await tester.pumpAndSettle();
    /// Verify that the new page is RandomBreedPage
    expect(find.byType(RandomBreedPage), findsOneWidget);



  });
  testWidgets('Navigate to BreedImagePage from MyHomePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      wrapTestingWidget(child: const MyHomePage()));

    /// Verify that the initial page is MyHomePage
    expect(find.byType(MyHomePage), findsOneWidget);

    /// Tap on the "Image list by breed" item
    await tester.tap(find.text('Images list by breed'.toUpperCase()));
    await tester.pumpAndSettle();
    /// Verify that the new page is RandomBreedPage
    expect(find.byType(BreedImagePage), findsOneWidget);



  });



}