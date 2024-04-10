class PostData {
  final String name;

  PostData({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}