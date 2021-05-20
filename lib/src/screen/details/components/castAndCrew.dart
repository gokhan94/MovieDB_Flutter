import 'package:flutter/material.dart';
import '../../../../const.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;

  const CastAndCrew({Key key, this.casts}) : super(key: key);

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
                  cast: casts[index],
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
  final Map cast;

  const CastCard({Key key, this.cast}) : super(key: key);

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
                    image: AssetImage(
                      cast['image'],
                    ),
                  ),
                )),
            // SizedBox(height: kDefaultPadding / 2),
            Text(
              cast['orginalName'],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
            ),
            SizedBox(height: 2),
            Text(
              cast['movieName'],
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextLightColor),
            ),
          ],
        ));
  }
}
