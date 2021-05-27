import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/model/credits.dart';
import 'package:movie_app/model/person.dart';
import 'package:movie_app/src/screen/details/cast_details.dart';
import 'package:movie_app/src/screen/details/person_details.dart';
import '../../../../const.dart';

class CastList extends StatelessWidget {
  final List<Cast> casts;

  const CastList({Key key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) {
                return CastCard(
                  casts: casts[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final Cast casts;

  const CastCard({Key key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File file = new File("assets/images/actor_1.png");
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CastDetails(castId: casts.id)));
      },
      child: Container(
          margin: EdgeInsets.only(right: kDefaultPadding),
          width: 50,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: casts.profilePath != null
                          ? NetworkImage(
                              "http://image.tmdb.org/t/p/w500/${casts.profilePath}")
                          : AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover),
                ),
              ),

              // SizedBox(height: kDefaultPadding / 2),
              Text(
                casts.originalName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 2,
              ),
              SizedBox(height: 2),
              Text(
                casts.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: kTextLightColor),
              ),
            ],
          )),
    );
  }
}
