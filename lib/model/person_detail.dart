// To parse this JSON data, do
//
//     final personDetail = personDetailFromJson(jsonString);

import 'dart:convert';

PersonDetail personDetailFromJson(String str) => PersonDetail.fromJson(json.decode(str));

String personDetailToJson(PersonDetail data) => json.encode(data.toJson());

class PersonDetail {
  PersonDetail({
    this.birthday,
    this.knownForDepartment,
    this.deathday,
    this.id,
    this.name,
    this.biography,
    this.popularity,
    this.placeOfBirth,
    this.profilePath,
  });

  DateTime birthday;
  String knownForDepartment;
  dynamic deathday;
  int id;
  String name;
  String biography;
  double popularity;
  String placeOfBirth;
  String profilePath;

  factory PersonDetail.fromJson(Map<String, dynamic> json) => PersonDetail(
    birthday: DateTime.parse(json["birthday"]),
    knownForDepartment: json["known_for_department"],
    deathday: json["deathday"],
    id: json["id"],
    name: json["name"],
    biography: json["biography"],
    popularity: json["popularity"].toDouble(),
    placeOfBirth: json["place_of_birth"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "known_for_department": knownForDepartment,
    "deathday": deathday,
    "id": id,
    "name": name,
    "biography": biography,
    "popularity": popularity,
    "place_of_birth": placeOfBirth,
    "profile_path": profilePath,
  };
}
