import 'package:flutter/material.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/src/screen/details/details_screen.dart';
import '../../const.dart';

class MovieCard extends StatelessWidget {
  final NowPlaying movie;

  const MovieCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        movie: movie,
                      )));
        },
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                      fit: BoxFit.cover)),
            )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                movie.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: kDefaultPadding / 2),
                Text(
                  "${movie.popularity}",
                  style: TextStyle(
                      color: Colors.yellow.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
