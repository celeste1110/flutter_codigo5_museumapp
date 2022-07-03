

class MuseumModel {
  MuseumModel({
    required this.id,
    required this.mame,
    required this.description,
    required this.city,
    required this.country,
    required this.address,
    required this.lat,
    required this.lon,
    required this.image,
  });

  int id;
  String mame;
  String description;
  String city;
  String country;
  String address;
  double lat;
  double lon;
  String image;

  factory MuseumModel.fromJson(Map<String, dynamic> json) => MuseumModel(
    id: json["id"],
    mame: json["mame"],
    description: json["description"]??'',
    city: json["city"],
    country: json["country"],
    address: json["address"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mame": mame,
    "description": description,
    "city": city,
    "country": country,
    "address": address,
    "lat": lat,
    "lon": lon,
    "image": image,
  };
}
