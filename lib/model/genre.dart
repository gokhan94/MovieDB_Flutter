import 'dart:convert';

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

// https://api.themoviedb.org/3/genre/movie/list?api_key=ede1a2f4a1664112304074565cfc151e&language=en-US