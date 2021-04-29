import 'package:chat_app/constants.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/pages/widgets/contacts_body.dart';
import 'package:chat_app/pages/widgets/profile_body.dart';
import 'package:chat_app/pages/widgets/chat_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class AppMainPage extends StatefulWidget {
  GoogleSignInAccount user;

  AppMainPage(this.user);

  @override
  _AppMainPage createState() => _AppMainPage(this.user);
}

class _AppMainPage extends State<AppMainPage> {
  int _selectedIndex = 0;
  User userLogged;
  GoogleSignInAccount user;

  _AppMainPage(this.user);

  @override
  void initState() {
    if (this.user != null) loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SelectedWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      onDrawerChanged: (bool value) => {print(value)},
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("App Chat"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget SelectedWidget() {
    // Page View para scrol
    return IndexedStack(
      index: _selectedIndex,
      children: <Widget>[
        ChatBody(),
        ContactsBody(this.user),
        Text("Calls"),
        ProfilePage(currentUser: this.userLogged),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Contatos"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Chamadas"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(userLogged.avatarUrl),
          ),
          label: userLogged.firstName,
        ),
      ],
    );
  }

  void loadUser() {
    List<String> partsOfName = this.user.displayName.split(" ");

    userLogged = User(
      email: this.user.email,
      avatarUrl: this.user.photoUrl,
      firstName: partsOfName.first,
      lastName: partsOfName.last,
      phoneNumber: this.user.id,
    );
  }
}
