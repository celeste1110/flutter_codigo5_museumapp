

class ArtistModel {
  ArtistModel({
    required this.id,
    required this.mame,
    required this.biography,
    required this.birthDate,
    required this.country,
    required this.image,
  });

  int id;
  String mame;
  String biography;
  DateTime birthDate;
  String country;
  String image;

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
    id: json["id"],
    mame: json["mame"],
    biography: json["biography"] ?? '',
    birthDate: DateTime.parse(json["birth_date"]),
    country: json["country"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mame": mame,
    "biography": biography,
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "country": country,
    "image": image,
  };
}
