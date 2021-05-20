import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/service/api_services.dart';
import 'package:movie_app/src/components/movie_card.dart';

import '../../const.dart';

class MovieSlider extends StatefulWidget {
  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: initialPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
          aspectRatio: 1,
          child: FutureBuilder(
            future: _apiService.nowPlaying(),
            builder: (BuildContext context,
                AsyncSnapshot<List<NowPlaying>> snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        initialPage = value;
                      });
                    },
                    controller: _pageController,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movie: snapshot.data[index],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          )
          ),
    );
  }
}
