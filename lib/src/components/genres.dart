import 'package:flutter/material.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/service/api_services.dart';
import 'package:movie_app/src/components/genre_card.dart';
import '../../const.dart';

class Genres extends StatefulWidget {
  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();

    return Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        height: 36,
        child: FutureBuilder(
          future: _apiService.getGenres(),
          builder: (BuildContext context, AsyncSnapshot<List<Genre>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GenreCard(
                      genre: snapshot.data[index].name,
                      genreId: snapshot.data[index].id,
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
