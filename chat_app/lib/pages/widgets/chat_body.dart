import 'package:chat_app/constants.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/pages/widgets/chat_card.dart';
import 'package:chat_app/pages/widgets/outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
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
                text: "Menssagens Recentes",
              ),
              SizedBox(width: appDefaultPadding),
              MyOutlineButton(
                press: () {},
                text: "Online",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Text("MessagesPage()"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
