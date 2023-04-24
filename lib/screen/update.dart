import 'package:firebasepro/screen/home.dart';
import 'package:flutter/material.dart';

class update extends StatefulWidget {
  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  void cleartxt() {
    namecontroller.clear();
    agecontroller.clear();
  }

  void updateuser(docid) {
    final data = {
      'name': namecontroller.text,
      'age': agecontroller.text,
    };
    users.doc(docid).update(data).then(
          (value) => Navigator.pop(context),
        );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    namecontroller.text = args["name"];
    agecontroller.text = args['age'];
    final docid = args['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('update'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: namecontroller,
            decoration: InputDecoration(
              label: Text('update name'),
            ),
          ),
          TextFormField(
            controller: agecontroller,
            decoration: InputDecoration(
              label: Text('name'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              updateuser(docid);
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
