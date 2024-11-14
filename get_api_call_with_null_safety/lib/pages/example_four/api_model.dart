class networkApi {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  networkApi({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory networkApi.fromJson(Map<String, dynamic> json) {
    return networkApi(
      id: json['_id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
