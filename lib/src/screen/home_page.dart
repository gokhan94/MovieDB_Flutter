import 'package:flutter/material.dart';
import 'package:movie_app/src/components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: _buildAppBar(),
      body: Body(),
    );
  }

  _buildAppBar() {
    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black45,
            ))
      ],
    );
  }
}
