import 'package:flutter/material.dart';
import 'package:movie_app/src/components/body.dart';
import 'package:movie_app/src/components/top_rated.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
       appBar: _buildAppBar(),
      body: Body(),
    );
  }

  _buildAppBar() {
    return  AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TopRatedMovieSlider()));
            },
            icon: Icon(
              Icons.trending_up_rounded,
              color: Colors.black,
            ))
      ],
    );
  }

}
