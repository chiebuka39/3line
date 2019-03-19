import 'package:flutter/material.dart';
import 'package:interview/bloc/users_bloc.dart';
import 'package:interview/models/users_model.dart';
import 'package:interview/ui/user_details.dart';
import 'package:interview/ui/user_form.dart';

class UsersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserlistState();
  }
}

class UserlistState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<Users> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFormPage(),
        tooltip: "Add a User",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Users> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.usersModel.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Column(
                children: <Widget>[
                  Image.asset("assets/img/user.png",
                  height: 40.0,),
                  Text(snapshot.data.usersModel[index].name),
                  Text(snapshot.data.usersModel[index].userName),
                  Text(snapshot.data.usersModel[index].email)
                    
                ],
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
        });
  }

  openDetailPage(Users data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return UserDetails(
          name: data.usersModel[index].name,
          userName: data.usersModel[index].userName,
          id: data.usersModel[index].id,
          address: data.usersModel[index].address,
          phone: data.usersModel[index].phone,
          website: data.usersModel[index].website,
          email: data.usersModel[index].email,
          
        );
      }),
    );
  }

  openFormPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return UserForm();
      }),
    );
  }

}