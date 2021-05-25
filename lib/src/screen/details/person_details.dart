import 'package:flutter/material.dart';
import 'package:movie_app/model/person.dart';
import 'package:movie_app/model/person_detail.dart';
import 'package:movie_app/service/api_services.dart';
import 'package:intl/intl.dart';

class PersonDetails extends StatefulWidget {
  final Person person;

  const PersonDetails({Key key, this.person}) : super(key: key);

  @override
  _PersonDetailsState createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  @override
  Widget build(BuildContext context) {
    ApiServices _apiService = ApiServices();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _apiService.personDetail(widget.person.id),
          builder:
              (BuildContext context, AsyncSnapshot<PersonDetail> snapshot) {
            if (snapshot.hasData) {
              var inputFormat = DateFormat('dd/MM/yyyy');
              var birthday = inputFormat.format(snapshot.data.birthday);

              return Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //boxShadow: [kDefaultShadow],
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://image.tmdb.org/t/p/w500/${snapshot.data.profilePath}"),
                                  fit: BoxFit.cover),
                              color: Colors.white70,
                            ),
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.name,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data.knownForDepartment,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600)),

                              //Text(snapshot.data.birthday.subtract(Duration(days: snapshot.data.birthday.day)).toString(), style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(snapshot.data.placeOfBirth,
                                  style: TextStyle(
                                      color: Colors.deepPurple.shade500,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10,
                              ),

                              Text(snapshot.data.popularity.toString(),
                                  style: TextStyle(
                                      color: Colors.deepPurple.shade400,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(birthday,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Biography",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                child: Text(snapshot.data.biography,
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
