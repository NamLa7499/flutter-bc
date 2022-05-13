import 'package:flutter/material.dart';
import 'package:flutter_app_bcth/model/user.dart';
import 'package:flutter_app_bcth/screens/add_user.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_user.dart';
// import 'detailwidget.dart'

class UserList extends StatelessWidget {
  final List<User> users;
  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users == null ? 0 : users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // builder: (context) => DetailWidget(users[index])
                      // builder: (context) => AddDataWidget()),
                      builder: (context) => EditDataWidget(users[index])),
                );
              },
              child: ListTile(
                  leading: RaisedButton(
                    child: Text("Call"),
                                          color: Color.fromARGB(255, 255, 0, 0),
                    onPressed: () {
                      print("Call");
                     launch("tel:0969722350");
                    },
                    
                  ),
                  trailing:
                  RaisedButton(
                      child: Text('Email'),
                      
                      onPressed: () async {
launch('mailto:lanam.990704@gmail.com?subject=This is Subject Title&body=This is Body of Email');


                      }),
                  title: Text(users[index].p0),
                  subtitle: Text(users[index].p1)),
            ),
          );
        });
  }
  
}
