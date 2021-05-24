// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.name,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.profilePath,
  });

  String name;
  int id;
  List<KnownFor> knownFor;
  String knownForDepartment;
  String profilePath;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    name: json["name"],
    id: json["id"],
    knownFor: List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    knownForDepartment: json["known_for_department"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
    "known_for_department": knownForDepartment,
    "profile_path": profilePath,
  };
}

class KnownFor {
  KnownFor({
    this.posterPath,
    this.voteAverage,
    this.backdropPath,
    this.title,
    this.originalTitle,
    this.popularity,
  });

  String posterPath;
  double voteAverage;
  String backdropPath;
  String title;
  String originalTitle;
  double popularity;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    posterPath: json["poster_path"],
    voteAverage: json["vote_average"].toDouble(),
    backdropPath: json["backdrop_path"],
    title: json["title"],
    originalTitle: json["original_title"],
    popularity: json["popularity"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "vote_average": voteAverage,
    "backdrop_path": backdropPath,
    "title": title,
    "original_title": originalTitle,
    "popularity": popularity,
  };
}
