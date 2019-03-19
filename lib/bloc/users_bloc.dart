import 'package:interview/models/users_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:interview/resources/repository/UserRepository.dart';

class MoviesBloc {
  final _repository = UserRepository();
  final _usersFetcher = PublishSubject<Users>();
  

  Observable<Users> get allMovies => _usersFetcher.stream;

  fetchAllMovies() async {
    Users itemModel = await _repository.fetchAllMovies();
    _usersFetcher.sink.add(itemModel);
  }

  addUser(String _name,
            String _userName,
            int _id,
            String _address,
            String _phone,
            String _website){
              

  }

  dispose() {
    _usersFetcher.close();
  }
}

final bloc = MoviesBloc();