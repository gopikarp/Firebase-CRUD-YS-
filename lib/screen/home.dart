import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
void deleteuser(docid) {
  users.doc(docid).delete();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/adds');
        },
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (BuildContext, AsyncSnapshot<QuerySnapshot> shot) {
          return shot.hasData
              ? ListView.separated(
                  itemCount: shot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    final DocumentSnapshot usersnap = shot.data!.docs[Index];
                    return ListTile(
                      title: Text(
                        usersnap['name'],
                      ),
                      subtitle: Text(usersnap['age'].toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/update',
                                  arguments: {
                                    'name': usersnap['name'],
                                    'age': usersnap['age'].toString(),
                                    'id': usersnap.id,
                                  });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              deleteuser(usersnap.id);
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                )
              : Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    );
  }
}
