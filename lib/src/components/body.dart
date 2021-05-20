import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/components/categories.dart';
import 'package:movie_app/src/components/genres.dart';
import 'package:movie_app/src/components/movie_slider.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [CategoryList(), Genres(), MovieSlider()],
      ),
    );
  }
}



