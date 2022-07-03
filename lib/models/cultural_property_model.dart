
class CulturalPropertyModel {
  CulturalPropertyModel({
    required this.id,
    required this.artist,
    required this.medium,
    required this.museum,
    required this.mame,
    required this.description,
    required this.city,
    required this.image,
  });

  int id;
  String artist;
  String medium;
  String museum;
  String mame;
  String description;
  String city;
  String image;

  factory CulturalPropertyModel.fromJson(Map<String, dynamic> json) => CulturalPropertyModel(
    id: json["id"],
    artist: json["artist"],
    medium: json["medium"],
    museum: json["museum"],
    mame: json["mame"]??'',
    description: json["description"] ??'',
    city: json["city"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "artist": artist,
    "medium": medium,
    "museum": museum,
    "mame": mame,
    "description": description,
    "city": city,
    "image": image,
  };
}
