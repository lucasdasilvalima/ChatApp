import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:chat_app/models/contact.dart';
import 'package:chat_app/pages/widgets/contact_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class ContactsBody extends StatefulWidget {
  GoogleSignInAccount account;

  ContactsBody(this.account);

  @override
  _ContactsBodyState createState() => _ContactsBodyState(this.account);
}

class _ContactsBodyState extends State<ContactsBody> {
  GoogleSignInAccount account;
  List<Contact> contacts = <Contact>[];

  _ContactsBodyState(this.account);

  @override
  void initState() {
    if (this.account != null) loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: contacts.isEmpty
              ? Text("data")
              : ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => ContactCard(
                    contact: contacts[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Text("ToDo"),
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }

  void pickContact(dynamic contact) {
    final List<dynamic> names = contact['names'];
    final List<dynamic> phoneNumbers = contact['phoneNumbers'];
    final List<dynamic> photos = contact['photos'];

    final Map<String, dynamic> name =
        names.firstWhere((element) => element['displayName'] != null);

    final Map<String, dynamic> photoUrl =
        photos.firstWhere((element) => element['url'] != null);

    final Map<String, dynamic> phoneNumber =
        phoneNumbers.firstWhere((element) => element['value'] != null);

    if (name['displayName'] != null &&
        photoUrl['url'] != null &&
        phoneNumber['value'] != null) {
      setState(() {
        contacts.add(new Contact(
            name: name['displayName'],
            avatarUrl: photoUrl['url'],
            phoneNumber: phoneNumber['url']));
      });
    }
  }

  Future<void> loadContacts() async {
    var authHeaders = await this.account.authHeaders;
    // print(authHeaders);
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?personFields=names,phoneNumbers,photos,urls'),
      headers: authHeaders,
    );
    if (response.statusCode != 200) {
      print(response.body);
      return;
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> connections = data['connections'];
    connections.forEach((element) {
      pickContact(element);
    });
    this.contacts.sort();
  }
}
