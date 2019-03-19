import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  UserForm({Key key}) : super(key: key);

  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: "Enter Name",
                labelText: "Enter Name",
                icon: Icon(Icons.menu),
                fillColor: Colors.white),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: "Enter email",
                labelText: "Enter email",
                icon: Icon(Icons.menu),
                fillColor: Colors.white),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                hintText: "Enter Username",
                labelText: "Enter Username",
                icon: Icon(Icons.menu),
                fillColor: Colors.white),
          ),
          RaisedButton(
            onPressed: () => {},
            child: Text("Add User"),
          )
          
        ],
      ),
    );
  }
}
