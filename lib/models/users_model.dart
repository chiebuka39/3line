class Users {
  List<_UserModel> _usersmodel = [];

  Users.fromJson(List<dynamic> parsedJson) {
  

    _usersmodel = (parsedJson)
          .map((data) => new _UserModel.fromJson(data))
          .toList();
  }

  addUser(String _name,
            String _userName,
            int _id,
            String _address,
            String _phone,
            String _website){
          
  }

  List<_UserModel> get usersModel => _usersmodel;
}


class _UserModel {

  String _name;
  String _userName;
  String _email;
  int _id;
  String _address;
  String _phone;
  String _website;

  

  _UserModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['email']);
    
    _name =parsedJson['name'];
    _userName =parsedJson['username'];
    _email =parsedJson['email'];
    _id =parsedJson['id'];
    _address =parsedJson['address']['street'];
    _phone =parsedJson['phone'];
    _website =parsedJson['website'];
  }

   String get name => _name;
   String get userName => _userName;
   String get email => _email;
   int get id => _id;
   String get address => _address;
   String get phone => _phone;
   String get website => _website;
}