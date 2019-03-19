import 'dart:convert';

import 'package:interview/resources/api/UserApi.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:http/testing.dart';

main(){
  test('UsersApi getusers method', () async{
  

    final mapJson = [
      {
        "id": 1,
        "name": "Chiebuka Edwin",
        "username": "chiebuka39",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {
          "lat": "-38.2386",
          "lng": "57.2232",
          },
        },
        "phone": "024-648-3804",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models",
          },
      },
      {
        "id": 2,
        "name": "Clementina DuBuque",
        "username": "Moriah.Stanton",
        "email": "Rey.Padberg@karina.biz",
        "address": {
          "street": "Kattie Turnpike",
          "suite": "Suite 198",
          "city": "Lebsackbury",
          "zipcode": "31428-2261",
          "geo": {
          "lat": "-38.2386",
          "lng": "57.2232",
          },
        },
        "phone": "024-648-3804",
        "website": "ambrose.net",
        "company": {
          "name": "Hoeger LLC",
          "catchPhrase": "Centralized empowering task-force",
          "bs": "target end-to-end models",
          },
      }

    ];

  

    final userApi = UserApi();

    userApi.client = MockClient((request) async {
      return Response(json.encode(mapJson), 200);
    });

    final Users = await userApi.fetchMovieList();

    expect(Users.usersModel[0].name, 'Chiebuka Edwin');
    expect(Users.usersModel[0].userName, "chiebuka39");

  });

}