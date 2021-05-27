import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_detail.dart';

import '../../../../const.dart';

class Rating extends StatelessWidget {
  final Size size;
  final MovieDetail movie;

  const Rating({Key key, this.size, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                    image: NetworkImage(
                        "http://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: size.width * 0.9,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 50,
                          color: Colors.white)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 28,
                        ),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black87),
                                children: [
                              TextSpan(
                                  text: "${movie.voteAverage} /",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: " 10 \n",
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ]))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Popularity",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        SizedBox(height: kDefaultPadding / 4),
                        Text("${movie.popularity}",
                            style: TextStyle(
                                color: Colors.yellow.shade700,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: kDefaultPadding / 2),
                        Text(
                          "Vote Count",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF51CF66),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "${movie.voteCount}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
