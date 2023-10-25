class DogBreeds {
  Map<String, List<String>> message;

  DogBreeds({
    required this.message,
  });

  factory DogBreeds.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> messageJson = json['message'];
    final Map<String, List<String>> message = {};

    messageJson.forEach((breed, subBreeds) {
      if (subBreeds is List) {
        message[breed] = subBreeds.cast<String>();
      }
    });

    return DogBreeds(message: message);
  }
}