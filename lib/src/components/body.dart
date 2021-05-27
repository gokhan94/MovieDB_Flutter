import 'package:flutter/material.dart';
import 'package:movie_app/src/components/persons.dart';
import 'package:movie_app/src/components/genres.dart';
import 'package:movie_app/src/components/movie_slider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Genres(),
          SizedBox(height: 5),
          _trendPersonWeekText(),
          SizedBox(height: 10),
          Persons(),
          SizedBox(height: 5),
          _nowPlayingText(),
          MovieSlider(),
        ],
      ),
    );
  }

  Widget _trendPersonWeekText() {
    return  Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            "Trending Person Week",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ));
  }

  Widget _nowPlayingText() {
    return Text(
      "Now Playing",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

}
