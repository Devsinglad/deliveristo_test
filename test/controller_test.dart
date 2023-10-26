import 'package:deliveristo_test/components/imports/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deliveristo_test/pages/random_image_breeds.dart';
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

  testWidgets('Test Random Page Controller', (WidgetTester tester) async {
    await tester.pumpWidget(wrapTestingWidget(child: const RandomBreedPage()));
    /// Enter search text in the text field.
    await tester.enterText(find.byType(CustomTextFormField), 'bulldog');

    await tester.pumpAndSettle();
    /// verify that textfield is present
    expect(find.byType(CustomTextFormField), findsOneWidget);

    /// Verify that suggestions are displayed.
     expect(find.byType(ListView), findsOneWidget);
  });
}