import 'package:dio/dio.dart';
import 'package:movie_app/model/credits.dart';
import 'package:movie_app/model/movie_detail.dart';
import 'package:movie_app/model/movie_genres.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/model/person.dart';
import 'package:movie_app/model/person_detail.dart';

class ApiServices {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'ede1a2f4a1664112304074565cfc151e';

  Future<List<Genre>> getGenres() async {
    try {
      final response = await _dio.get('$baseUrl/genre/movie/list?api_key=$apiKey');

      var genres = response.data['genres'] as List;
      List<Genre> genreList = genres.map((genre) => Genre.fromJson(genre)).toList();

      return genreList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<MovieGenres>> getGenreByMovie(int genreId) async {
    try {
      final response = await _dio.get('$baseUrl/discover/movie?with_genres=$genreId&api_key=$apiKey');
      var movies = response.data['results'] as List;

      List<MovieGenres> movieList = movies.map((m) => MovieGenres.fromJson(m)).toList();

      return movieList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<NowPlaying>> nowPlaying() async {
    try {
      final response = await _dio.get('$baseUrl/movie/now_playing?api_key=$apiKey');
      var nowPlaying = response.data['results'] as List;


      List<NowPlaying> nowPlayingList = nowPlaying.map((e) => NowPlaying.fromJson(e)).toList();

      return nowPlayingList;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Person>> personPopular() async {
    try {
      final response = await _dio.get('$baseUrl/trending/person/week?api_key=$apiKey');
      var personData = response.data['results'] as List;

      List<Person> popularPersonList = personData.map((e) => Person.fromJson(e)).toList();

      return popularPersonList;
    } catch (e) {
      print(e);
    }
  }

  Future<PersonDetail> personDetail(personId) async {
    try {
      //https://api.themoviedb.org/3/person/287?api_key=ede1a2f4a1664112304074565cfc151e&language=en-US
      final response = await _dio.get('$baseUrl/person/$personId?api_key=$apiKey');

      PersonDetail personDetail = PersonDetail.fromJson(response.data);

      return personDetail;
    } catch (e) {
      print(e);
    }
  }

  Future<MovieDetail> movieDetail(movieId) async {
    try {
      //https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US
      final response = await _dio.get('$baseUrl/movie/$movieId?api_key=$apiKey');

      MovieDetail movieDetail = MovieDetail.fromJson(response.data);

      movieDetail.castList = await getCastList(movieId);
      movieDetail.youtubeTrailerId = await getTrailerYoutubeId(movieId);

      return movieDetail;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Cast>> getCastList(movieId) async {
    try {
      // https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=<<api_key>>&language=en-US
      final response = await _dio.get('$baseUrl/movie/$movieId/credits?api_key=$apiKey');

      var castList = response.data['cast'] as List;


      List<Cast> castDetail = castList.map((list) => Cast.fromJson(list)).toList();

      return castDetail;
    } catch (e) {
      print(e);
    }
  }


  Future<List<NowPlaying>> topRated() async {
    try {
      final response = await _dio.get('$baseUrl/movie/top_rated?api_key=$apiKey');
      var trendList = response.data['results'] as List;

      List<NowPlaying> trendListDetail = trendList.map((e) => NowPlaying.fromJson(e)).toList();

      return trendListDetail;
    } catch (e) {
      print(e);
    }
  }

  Future<String> getTrailerYoutubeId(movieId) async {
    try {
      // https://api.themoviedb.org/3/movie/{movie_id}/videos?api_key=<<api_key>>&language=en-US
      final response = await _dio.get('$baseUrl/movie/$movieId/videos?api_key=$apiKey');
      var youtubeList = response.data['results'] as List;
      var youtubeKey = youtubeList[0]["key"];

      return youtubeKey;
    } catch (e) {
      print(e);
    }
  }
}
