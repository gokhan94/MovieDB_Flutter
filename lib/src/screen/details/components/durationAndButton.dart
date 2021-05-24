import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_detail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../const.dart';

class DurationAndButton extends StatelessWidget {
  final MovieDetail movie;

  const DurationAndButton({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      '${movie.runtime}',
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "PG-13",
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      "${movie.releaseDate}",
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () async {


              final youtubeUrl =
                  'https://www.youtube.com/watch?v=${movie.youtubeTrailerId}';

              //await launch(youtubeUrl);

              if(await canLaunch(youtubeUrl)){
                await launch(youtubeUrl);
              }

              /*if (await canLaunch(youtubeUrl)) {
                //print(youtubeUrl);
                await launch(youtubeUrl);
              }*/



            },
            child: SizedBox(
              height: 50,
              width: 50,
              child:Container(
                color: Colors.red,
                child: Icon(
                  Icons.video_collection_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),



             /* TextButton(
                //onPressed: (){},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                child: Icon(
                  Icons.video_collection_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),

              */

            ),
          )
        ],
      ),
    );
  }
}
