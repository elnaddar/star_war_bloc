class SwapiObject {
  final String name;
  final String url;

  SwapiObject({required this.name, required this.url});

  factory SwapiObject.fromJson(Map<String, dynamic> json) {
    return SwapiObject(
      name: json['name'] ?? json['title'],
      url: json['url'],
    );
  }

  Map<String, String> toJson() => {'name': name, 'url': url};
}
