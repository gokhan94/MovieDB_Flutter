// To parse this JSON data, do
//
//     final castList = castListFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app/model/person.dart';


CastList castListFromJson(String str) => CastList.fromJson(json.decode(str));

String castListToJson(CastList data) => json.encode(data.toJson());

class CastList {
  CastList({
    this.id,
    this.cast,
  });

  int id;
  List<Cast> cast;

  factory CastList.fromJson(Map<String, dynamic> json) => CastList(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.gender,
    this.id,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.job,
  });

  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String job;


  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        job: json["job"] == null ? null : json["job"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "id": id,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId == null ? null : castId,
        "character": character == null ? null : character,
        "job": job == null ? null : job,
      };
}
