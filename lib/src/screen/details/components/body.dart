import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_detail.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/service/api_services.dart';
import 'package:movie_app/src/screen/details/components/backRating.dart';
import 'package:movie_app/src/screen/details/components/castAndCrew.dart';
import 'package:movie_app/src/screen/details/components/durationAndButton.dart';
import 'package:movie_app/src/screen/details/components/genres.dart';
import '../../../../const.dart';

class Body extends StatefulWidget {
  final NowPlaying movie;

  const Body({Key key, this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovie(widget.movie.id);
  }

  void getMovie(movie) async {
    return await _apiService.movieDetail(movie).then((value) => print(value.genres));
  }*/

  @override
  Widget build(BuildContext context) {
    // total widht and height
    Size size = MediaQuery.of(context).size;
    ApiServices _apiService = ApiServices();

    return SingleChildScrollView(
      child: FutureBuilder(
          future: _apiService.movieDetail(widget.movie.id),
          builder: (BuildContext context, AsyncSnapshot<MovieDetail> snapshot) {
            if (snapshot.hasData) {

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackRating(size: size, movie: snapshot.data),
                  DurationAndButton(movie: snapshot.data),
                  //  Genres(movie: movie),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Text(
                      "Overview",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      snapshot.data.overview,
                      style: TextStyle(
                        color: Color(0xFF737599),
                      ),
                    ),
                  ),

                  //CastAndCrew(casts: movie.cast)
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
