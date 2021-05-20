// To parse this JSON data, do
//
//     final movieGenres = movieGenresFromJson(jsonString);

import 'dart:convert';

MovieGenres movieGenresFromJson(String str) => MovieGenres.fromJson(json.decode(str));

String movieGenresToJson(MovieGenres data) => json.encode(data.toJson());

class MovieGenres {
  MovieGenres({
    this.backdropPath,
    this.budget,
    this.homepage,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });


  dynamic backdropPath;
  int budget;
  String homepage;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  int popularity;
  String posterPath;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  int voteAverage;
  int voteCount;

  factory MovieGenres.fromJson(Map<String, dynamic> json) => MovieGenres(
    backdropPath: json["backdrop_path"],
    budget: json["budget"],
    homepage: json["homepage"],
    id: json["id"].toInt(),
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toInt(),
    posterPath: json["poster_path"],
    revenue: json["revenue"],
    runtime: json["runtime"],
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toInt(),
    voteCount: json["vote_count"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "budget": budget,
    "homepage": homepage,
    "id": id.toInt(),
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity.toInt(),
    "poster_path": posterPath,
    "revenue": revenue,
    "runtime": runtime,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage.toInt(),
    "vote_count": voteCount.toInt(),
  };
}

