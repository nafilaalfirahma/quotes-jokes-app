class Joke {
  final String imageUrl;

  Joke({required this.imageUrl});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      imageUrl: json['image'] ?? '',
    );
  }
}
