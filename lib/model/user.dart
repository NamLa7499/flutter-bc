// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.p0,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
    required this.p5,
    required this.p6,
  });

  final int id;
  final String p0;
  final String p1;
  final String p2;
  final String p3;
  final String p4;
  final String p5;
  final String p6;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"],
        p0: json["p0"],
        p1: json["p1"],
        p2: json["p2"],
        p3: json["p3"],
        p4: json["p4"],
        p5: json["p5"],
        p6: json["p6"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "p0": p0,
        "p1": p1,
        "p2": p2,
        "p3": p3,
        "p4": p4,
        "p5": p5,
        "p6": p6,
      };
}
