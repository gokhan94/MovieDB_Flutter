import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_genres.dart';
import 'package:movie_app/service/api_services.dart';

class MovieGenreDetails extends StatelessWidget {
  final int genreId;

  const MovieGenreDetails({Key key, this.genreId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();

    return Scaffold(
      body: FutureBuilder(
        future: _apiService.getGenreByMovie(genreId),
        builder:
            (BuildContext context, AsyncSnapshot<List<MovieGenres>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://image.tmdb.org/t/p/w500/${snapshot.data[index].posterPath}"),
                                      fit: BoxFit.cover)),
                            ),
                            Expanded(
                              child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(snapshot.data[index].title),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(snapshot.data[index].voteAverage.toString()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(snapshot.data[index].overview),
                                    ),
                                  ],
                                ),

                            )
                          ],
                        ),
                      ],
                    ),
                  );

                  //return Text(snapshot.data[index].title);
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
