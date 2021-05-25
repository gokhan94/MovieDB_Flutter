import 'package:flutter/material.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/src/screen/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final NowPlaying movie;

  const DetailsScreen({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      movie: movie,
    ));
  }
}
