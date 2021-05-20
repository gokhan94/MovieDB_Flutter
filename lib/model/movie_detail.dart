// To parse this JSON data, do
//
//     final movieDetail = movieDetailFromJson(jsonString);

import 'dart:convert';
import 'package:movie_app/model/credits.dart';


MovieDetail movieDetailFromJson(String str) => MovieDetail.fromJson(json.decode(str));

String movieDetailToJson(MovieDetail data) => json.encode(data.toJson());

class MovieDetail {
  MovieDetail({
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  String backdropPath;
  int budget;
  List<GenreList> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  dynamic posterPath;
  DateTime releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  List<Cast> castList;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
    backdropPath: json["backdrop_path"],
    budget: json["budget"],
    genres: List<GenreList>.from(json["genres"].map((x) => GenreList.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    revenue: json["revenue"],
    runtime: json["runtime"],
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "revenue": revenue,
    "runtime": runtime,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

class GenreList {
  GenreList({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
