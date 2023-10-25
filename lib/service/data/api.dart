import 'dart:convert';
import 'package:deliveristo_test/components/imports/imports.dart';
import 'package:http/http.dart'as http;

class FetchDogData extends ChangeNotifier{
  List<String> breedsList=[];
  List<String> subBreedsList=[];
  List<String> subBreedRandomImages=[];
  List<String> subBreedAllImages=[];
  List<String> randomImages=[];
  List<String> getAllBreedImages=[];
  bool showImages=false;
  bool showAllImages=false;
  bool showRandomSubImages=false;
  bool showAllSubImages=false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  Future<void> getDogList() async {
    try {
      var client = http.Client();

      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breeds/list/all'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        final responseData = json.decode(response.body);
        var data =DogBreeds.fromJson(responseData);
        breedsList=data.message.keys.toList() ;
        print(breedsList);
        notifyListeners();
      }


    } catch (e) {
      print('Exception during fetching user profile: $e');
    }
  }
  Future<void> getRandomImageByBreeds(String breed) async {
    try {
      var client = http.Client();

      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breed/$breed/images/random/3'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        showImages=true;
        final responseData = json.decode(response.body);
        var data =RandomImageByBreed.fromJson(responseData);
        randomImages=data.message.toList();
        print(randomImages);
        notifyListeners();
      }


    } catch (e) {
      showImages=false;
      print('Exception during fetching data: $e');
    }
  }
  Future<void> getAllImageListByBreed(String breed,context) async {
    try {
      var client = http.Client();

      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breed/$breed/images'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        showAllImages=true;
        final responseData = json.decode(response.body);
        var data =GetBreedImages.fromJson(responseData);
        getAllBreedImages=data.message!.toList();
        print(getAllBreedImages);
        notifyListeners();
      }else{
        ToastService.showToast(context, 'Error Occurred....Try again');
        notifyListeners();
      }


    } catch (e) {
      showAllImages=false;
      print('Exception during fetching data: $e');
    }
  }

  // Future<void> getAllImageListByBreed(String breed,context) async {
  //   try {
  //     var client = http.Client();
  //
  //     final http.Response response = await client.get(
  //       Uri.parse('${AppConfig.baseUrl}/breed/$breed/images'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     if (response.statusCode==200){
  //       final responseData = json.decode(response.body);
  //       var data =GetBreedImages.fromJson(responseData);
  //       getAllBreedImages=data.message!.toList();
  //       print(getAllBreedImages);
  //       /// Filter out images with a 404 status code
  //       // List<String> validImages = [];
  //       // for (String? imageUrl in data.message!.toList()) {
  //       //   if (imageUrl != null) {
  //       //     final imageResponse = await http.get(Uri.parse(imageUrl));
  //       //     if (imageResponse.statusCode != 404) {
  //       //       showAllImages=true;
  //       //       getAllBreedImages.add(imageUrl);
  //       //     }
  //       //
  //       //   }
  //       //
  //       // }
  //
  //       notifyListeners();
  //     }else{
  //       ToastService.showToast(context, 'Error Occurred....Try again');
  //       notifyListeners();
  //     }
  //
  //
  //   } catch (e) {
  //     showAllImages=false;
  //     print('Exception during fetching data: $e');
  //   }
  // }
  Future<void> getSubBreedList(String breed,context) async {
    try {
      var client = http.Client();

      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breed/$breed/list'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        final responseData = json.decode(response.body);
        var data =SubBreed.fromJson(responseData);
        subBreedsList=data.message.toList();
        print(subBreedsList);
        notifyListeners();
      }else{
        ToastService.showToast(context, 'Error Occurred....Try again');
        notifyListeners();
      }


    } catch (e) {
      print('Exception during fetching data: $e');
    }
  }
  Future<void> getSubBreedRandomImages(String breed,String subBreed,context) async {
    try {
      var client = http.Client();

      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breed/$breed/$subBreed/images/random/3'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        showRandomSubImages=true;
        final responseData = json.decode(response.body);
        var data =SubBreedImages.fromJson(responseData);
        subBreedRandomImages=data.message.toList();
        print(subBreedRandomImages);
        notifyListeners();
      }else{
        showRandomSubImages=false;
        ToastService.showToast(context, 'Error Occurred....Try again');
        notifyListeners();
      }
    } catch (e) {
      showRandomSubImages=false;
      print('Exception during fetching data: $e');
    }
  }
  Future<void> getSubBreedAllImages(String breed,String subBreed,context) async {
    try {
      var client = http.Client();
      final http.Response response = await client.get(
        Uri.parse('${AppConfig.baseUrl}/breed/$breed/$subBreed/images'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode==200){
        showAllSubImages=true;
        final responseData = json.decode(response.body);
        var data =SubBreedImages.fromJson(responseData);
        subBreedAllImages=data.message.toList();
        print(subBreedAllImages);
        notifyListeners();
      }else{
        showAllSubImages=false;
        ToastService.showToast(context, 'Error Occurred....Try again');
        notifyListeners();
      }
    } catch (e) {
      showAllSubImages=false;
      print('Exception during fetching data: $e');
    }
  }

}


// Future<void> fetchImages() async {
//   // Replace this URL with your API endpoint.
//   final apiUrl = 'https://example.com/api/images';
//
//   final response = await http.get(Uri.parse(apiUrl);
//
//       if (response.statusCode == 200) {
//     final List<String> imageUrls = List<String>.from(json.decode(response.body));
//
//     // Filter out images with a 404 status code.
//     List<String> validImageUrls = [];
//
//     for (String imageUrl in imageUrls) {
//       final imageResponse = await http.get(Uri.parse(imageUrl));
//       if (imageResponse.statusCode != 404) {
//         validImageUrls.add(imageUrl);
//       }
//     }