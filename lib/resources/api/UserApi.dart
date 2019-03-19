import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:interview/models/users_model.dart';


class UserApi {
    static const endpoint = 'https://jsonplaceholder.typicode.com/users';

    Client client = Client();


  Future<Users> fetchMovieList() async {
    print("entered");
    final response = await client
        .get(endpoint);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Users.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}