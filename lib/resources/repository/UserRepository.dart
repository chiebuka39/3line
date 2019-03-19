import 'dart:async';

import 'package:interview/models/users_model.dart';
import 'package:interview/resources/api/UserApi.dart';

class UserRepository {
  final moviesApiProvider = UserApi();

  Future<Users> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}