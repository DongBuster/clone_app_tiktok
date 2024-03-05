class DataVideo {
  late String id;
  late String username;
  late String description;
  late String linkvideo;
  DataVideo({
    required this.id,
    required this.username,
    required this.description,
    required this.linkvideo,
  });

  factory DataVideo.fromJson(Map<String, dynamic> json) {
    return DataVideo(
      id: json['id'],
      username: json['username'],
      description: json['description'],
      linkvideo: json['linkvideo'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'description': description,
      'linkvideo': linkvideo,
    };
  }
}
