import 'package:chat_app/constants.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/pages/widgets/outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User currentUser;

  ProfilePage({this.currentUser});

  @override
  State<StatefulWidget> createState() => _ProfilePage(this.currentUser);
}

class _ProfilePage extends State<ProfilePage> {
  final userProfile;

  _ProfilePage(this.userProfile);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              appDefaultPadding, 0, appDefaultPadding, appDefaultPadding),
          color: appPrimaryColor,
          child: Row(
            children: [
              MyOutlineButton(
                press: () {},
                text: "Atualizar Perfil",
              ),
              SizedBox(width: appDefaultPadding),
              MyOutlineButton(
                press: () {},
                text: "Sair",
                isFilled: false,
              ),
            ],
          ),
        ),
        Spacer(),
        CircleAvatar(
          radius: 120,
          backgroundImage: NetworkImage(this.userProfile.avatarUrl),
        ),
        // NetworkImage(
        //   this.userProfile.avatarUrl
        //   // width: 240,
        // ),
        Spacer(flex: 1),
        Text(this.userProfile.firstName + " " + this.userProfile.lastName),
        Text("Email: " + this.userProfile.email),
        Text("Fone: " + this.userProfile.phoneNumber),
        Text("Sobre: " + this.userProfile.aboutDesc),
        Spacer(flex: 2),
      ],
    );
  }
}
