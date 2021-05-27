import 'package:flutter/material.dart';
import 'package:movie_app/model/person.dart';
import 'package:movie_app/service/api_services.dart';
import 'package:movie_app/src/screen/details/person_details.dart';

import '../../const.dart';

class Persons extends StatefulWidget {
  @override
  _PersonsState createState() => _PersonsState();
}

class _PersonsState extends State<Persons> {
  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();
    return Container(
      height: 50,
      child: FutureBuilder(
        future: _apiService.personPopular(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PersonList(person: snapshot.data[index]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


class PersonList extends StatelessWidget {
  final Person person;

  const PersonList({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonDetails(person: person)));
      },
      child: Container(
          margin: EdgeInsets.only(right: kDefaultPadding),
          width: 60,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: person.profilePath != null
                          ? NetworkImage(
                          "http://image.tmdb.org/t/p/w500/${person.profilePath}")
                          : AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover),
                ),
              ),

              // SizedBox(height: kDefaultPadding / 2),
            ],
          )),
    );
  }
}
