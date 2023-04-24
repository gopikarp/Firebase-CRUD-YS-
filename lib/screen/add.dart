import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  void cleartxt() {
    namecontroller.clear();
    agecontroller.clear();
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  void adduser() {
    final _data = {
      'name': namecontroller.text,
      'age': agecontroller.text,
    };
    users.add(_data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: namecontroller,
            decoration: InputDecoration(
              label: Text('name'),
            ),
          ),
          TextFormField(
            controller: agecontroller,
            decoration: InputDecoration(
              label: Text('age'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() {});
              if (namecontroller.text.isEmpty && agecontroller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fill in all fields')));
              } else {
                adduser();
                Navigator.pop(context);
              }
            },
            child: Text('save'),
          ),
          ElevatedButton(
            onPressed: () {
              cleartxt();
            },
            child: Text('clear'),
          ),
        ],
      ),
    );
  }
}
