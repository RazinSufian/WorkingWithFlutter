class Entity {
  final int id;
  final String title;
  final double lat;
  final double lon;
  final String image;

  Entity({
    required this.id,
    required this.title,
    required this.lat,
    required this.lon,
    required this.image,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      title: json['title'] ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson({bool includeId = true, bool includeImage = true}) {
    final Map<String, dynamic> data = {
      'title': title,
      'lat': lat,
      'lon': lon,
    };
    if (includeId) data['id'] = id;
    if (includeImage) data['image'] = image;
    return data;
  }
}
