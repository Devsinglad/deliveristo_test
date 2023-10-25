class SubBreed {
  List<String> message;
  String status;

  SubBreed({
    required this.message,
    required this.status,
  });

  factory SubBreed.fromJson(Map<String, dynamic> json) {
    return SubBreed(
      message: List<String>.from(json['message']),
      status: json['status'],
    );
  }
}



class SubBreedImages {
  List<String> message;
  String status;

  SubBreedImages({
    required this.message,
    required this.status,
  });

  factory SubBreedImages.fromJson(Map<String, dynamic> json) {
    return SubBreedImages(
      message: List<String>.from(json['message']),
      status: json['status'],
    );
  }
}