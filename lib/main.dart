

import 'package:deliveristo_test/components/imports/imports.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dashboard',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

// Future<void> getImageListByBreed(String breed, context) async {
//   try {
//     final response = await http.get(
//       Uri.parse('${AppConfig.baseUrl}/breed/$breed/images'),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       showAllImages = true;
//       final responseData = json.decode(response.body);
//       var data = GetBreedImages.fromJson(responseData);
//
//       // Filter out images with a 404 status code
//       List<String> validImages = [];
//
//       for (String imageUrl in data.message) {
//         final imageResponse = await http.get(Uri.parse(imageUrl));
//         if (imageResponse.statusCode != 404) {
//           validImages.add(imageUrl);
//         }
//       }
//
//       getAllBreedImages = validImages;
//       print(getAllBreedImages);
//       notifyListeners();
//     } else {
//       ToastService.showToast(context, 'Error Occurred....Try again');
//       notifyListeners();
//     }
//   } catch (e) {
//     showAllImages = false;
//     print('Exception during fetching data: $e');
//   }
// }