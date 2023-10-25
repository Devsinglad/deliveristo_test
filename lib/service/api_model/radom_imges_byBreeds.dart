class RandomImageByBreed {
  List<String> message;
  String status;

  RandomImageByBreed({
    required this.message,
    required this.status,
  });

  factory RandomImageByBreed.fromJson(Map<String, dynamic> json) {
    return RandomImageByBreed(
      message: (json['message'] as List).cast<String>(),
      status: json['status'],
    );
  }
}