import 'dart:convert';

import 'package:flutter_app_bcth/model/user.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<User>> getUsers() async {
    Response res = await get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> cases =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }

  // Future<User> getCaseById(String id) async {
  //   final response = await get(Uri.parse(
  //       'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));

  //   if (response.statusCode == 200) {
  //     return User.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load a case');
  //   }
  // }

  Future<User> createUser(User users) async { 
    Map data = {
      'Id': users.id,
      'p0': users.p0,
      'p1': users.p1,
      'p2': users.p2,
      'p3': users.p3,
      'p4': users.p4,
      'p5': users.p5,
      'p6': users.p6
    };

    final Response response = await get(
      Uri.parse(
          'http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${users.p0}&id=1&p1=${users.p1}&p2=${users.p2}&p3=${users.p3}&p4=${users.p4}&p5=${users.p5}&p6=${users.p6}&tokenin=lethibaotran'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print('Add thành công ${users.p0}');
      return users;
      return User.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(users.id);
      throw Exception('Failed to post user');
    }
  }

  Future<User> updateCases(String _id, User users) async {
    Map data = {
      'Id': users.id,
      'p0': users.p0,
      'p1': users.p1,
      'p2': users.p2,
      'p3': users.p3,
      'p4': users.p4,
      'p5': users.p5,
      'p6': users.p6
    };

    final Response response = await get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${_id}&p0=${users.p0}&p1=${users.p1}&p2=${users.p2}&p3=${users.p3}&p4=${users.p4}&p5=${users.p5}&p6=${users.p6}&tokenup=lethibaotran'));
    if (response.statusCode == 200) {
      print('Update thành công ${users.p0} có id là ${_id}');
      return User.fromJson(json.decode(response.body));
    } else {
      print('không update được ${users.id}');
      throw Exception('Failed to update a user');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${id}&token=lethibaotran'));

    if (res.statusCode == 200) {
      print("User deleted");
    } else {
      print(id);
      throw "Failed to delete a user.";
    }
  }
}
