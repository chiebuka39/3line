import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetails extends StatefulWidget {
  final String name;
  final String userName;
  final String email;
  final int id;
  final String address;
  final String phone;
  final String website;

  UserDetails({
    this.name,
    this.userName,
    this.email,
    this.id,
    this.address,
    this.phone,
    this.website,
  });

  _UserDetailsState createState() => _UserDetailsState(
      name: name,
      userName: userName,
      email: email,
      id: id,
      address: address,
      phone: phone,
      website: website);
}

class _UserDetailsState extends State<UserDetails> {
  final String name;
  final String userName;
  final String email;
  final int id;
  final String address;
  final String phone;
  final String website;

  File _image;

  _UserDetailsState({
    this.name,
    this.userName,
    this.email,
    this.id,
    this.address,
    this.phone,
    this.website,
  });

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Detail'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _image == null
                ? InkResponse(
                  enableFeedback: true,
                  onTap: () => getImage(),
                    child: Image.asset("assets/img/avatar.jpg",
                        width: double.infinity, fit: BoxFit.cover),
                  )
                : Image.file(_image, width: double.infinity, fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("Name"),
                ),
                Expanded(
                  child: Text(name),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("username"),
                ),
                Expanded(
                  child: Text(userName),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("Email"),
                ),
                Expanded(
                  child: Text(email),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
