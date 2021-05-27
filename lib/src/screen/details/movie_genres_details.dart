import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_genres.dart';
import 'package:movie_app/service/api_services.dart';

class MovieGenreDetails extends StatelessWidget {
  final int genreId;
  final String genreName;

  const MovieGenreDetails({Key key, this.genreId, this.genreName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color: Colors.indigoAccent,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          genreName + " genre movies",
          style: new TextStyle(
              color: Colors.indigo,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: _apiService.getGenreByMovie(genreId),
        builder: (BuildContext context, AsyncSnapshot<List<MovieGenres>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (context, index) {
                          return FlatButton(
                            child: MovieCell(snapshot.data, index),
                            padding:  EdgeInsets.all(0.0),
                            color: Colors.white, onPressed: () {
                              print(snapshot.data[index]);
                          },
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final List<MovieGenres> movies;
  final index;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[index].posterPath),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Column(
                children: [
                  Text(
                    movies[index].title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.w500,
                        color: mainColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        movies[index].voteAverage.toString(),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow.shade900),
                      ),
                      Text(
                        "/",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                      Text(
                        movies[index].voteCount.toString() + " votes",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.w500,
                            color: Colors.indigo),
                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Text(
                    movies[index].overview,
                    maxLines: 3,
                    style: TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
        Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
