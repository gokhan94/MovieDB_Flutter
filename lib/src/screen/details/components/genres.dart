import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/src/components/genre_card.dart';

import '../../../../const.dart';

class Genres extends StatelessWidget {
  final Movie movie;

  const Genres({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.genra.length,
            itemBuilder: (context, index) {
              return GenreCard(genre: movie.genra[index],);
            }),
      ),
    );
  }
}
