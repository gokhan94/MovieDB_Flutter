import 'package:flutter/material.dart';
import 'package:movie_app/model/credits.dart';
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
                  name: casts[index].name,
                  image: casts[index].profilePath,
                  originalName: casts[index].originalName,
                );
                //Text(casts[index].name);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final name;
  final image;
  final originalName;

  const CastCard({Key key, this.name, this.image, this.originalName})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: kDefaultPadding),
        width: 50,
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image:
                        NetworkImage("http://image.tmdb.org/t/p/w500/${image}"),
                    fit: BoxFit.cover),
              ),
            ),

            // SizedBox(height: kDefaultPadding / 2),
            Text(
              originalName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
            ),
            SizedBox(height: 2),
            Text(
              name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextLightColor),
            ),
          ],
        ));
  }
}
