import 'package:flutter/material.dart';
import 'package:movie_app/src/components/personList.dart';
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
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Trending Person Week",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )),
          SizedBox(height: 10),
          Persons(),
          SizedBox(height: 5),
          Text(
            "Now Playing",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          MovieSlider(),

          /* Text(
            "Trending",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          TopRatedMovieSlider()
          */
        ],
      ),
    );
  }
}
