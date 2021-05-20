import 'package:flutter/material.dart';
import 'package:movie_app/src/screen/details/movie_genres_details.dart';

import '../../const.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  final int genreId;
  const GenreCard({Key key, this.genre, this.genreId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieGenreDetails(genreId: genreId,)));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: kDefaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
        child: Text(
          genre,
          style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}