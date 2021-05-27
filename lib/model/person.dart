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
    this.knownForDepartment,
    this.profilePath,
  });

  String name;
  int id;

  String knownForDepartment;
  String profilePath;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "known_for_department": knownForDepartment,
        "profile_path": profilePath,
      };
}
