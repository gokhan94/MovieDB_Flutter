import 'package:flutter/material.dart';
import 'package:movie_app/model/now_playing.dart';
import 'package:movie_app/service/api_services.dart';
import '../../const.dart';

class TopRatedMovieSlider extends StatefulWidget {
  @override
  _TopRatedMovieSliderState createState() => _TopRatedMovieSliderState();
}

class _TopRatedMovieSliderState extends State<TopRatedMovieSlider> {
  ApiServices _apiService = ApiServices();
  final TextEditingController _textEditingController = TextEditingController();

  List<NowPlaying> trendMovieList = [];
  List<NowPlaying> trendFilterMovie = [];
  Future _future;

  Future<List<NowPlaying>> fetchData() async {
    List<NowPlaying> topRatedList = await _apiService.topRated();
    setState(() {
      trendMovieList = topRatedList;
      trendFilterMovie = trendMovieList;
    });
    return topRatedList;
  }

  @override
  void initState() {
    super.initState();
    _future = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: TextField(
            onChanged: (text) {
              text.toLowerCase();
              setState(() {
                trendFilterMovie = trendMovieList.where((movie) {
                  var movieTitle = movie.title.toLowerCase();
                  return movieTitle.contains(text);
                }).toList();
              });
            },
            controller: _textEditingController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search Movie",
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            margin: EdgeInsets.all(4),
            child: FutureBuilder(
                future: _future,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: screenSize.width / 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 185.0 / 278.0,
                      ),
                      itemCount: trendFilterMovie.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "http://image.tmdb.org/t/p/w500/${trendFilterMovie[index].posterPath}",
                                  ),
                                  fit: BoxFit.fill)),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
