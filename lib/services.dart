import 'package:auto_/main.dart';
import 'package:auto_/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController startController = TextEditingController();
    TextEditingController maxController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    Future<List<Map<String, String>>> addservices() async {
      User? user = FirebaseAuth.instance.currentUser;
      DatabaseReference UserRef = FirebaseDatabase.instance
          .ref()
          .child('Mech, Auto and Tows')
          .child(user!.uid);
      final add = await UserRef.child('Services').push().set({
        'name': nameController.text.trim(),
        'start time': startController.text.trim(),
        'end time': maxController.text.trim(),
        'price': priceController.text.trim(),
      });
      print(add as List<Map<String, String>>);
      return add;
    }

    Future<Map> postservices() async {
      User? user = FirebaseAuth.instance.currentUser;
      DatabaseReference UserRef = FirebaseDatabase.instance
          .ref()
          .child('Mech, Auto and Tows')
          .child(user!.uid);
      final DataSnapshot idsnapshot = await UserRef.child('Services').get();
      print(idsnapshot.value);
      return idsnapshot.value as Map;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: (context),
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.grey,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextFormField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                          hintText: 'Name',
                                          border: InputBorder.none),
                                      validator: (nameController) {
                                        if (nameController!.isEmpty) {
                                          return "Name can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 60,
                                        width: 100,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: TextFormField(
                                            controller: startController,
                                            decoration: const InputDecoration(
                                                hintText: 'Start Time',
                                                border: InputBorder.none),
                                            validator: (startController) {
                                              if (startController!.isEmpty) {
                                                return "Start Time can't be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 60,
                                        width: 100,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: TextFormField(
                                            controller: maxController,
                                            decoration: const InputDecoration(
                                                hintText: 'Max Time',
                                                border: InputBorder.none),
                                            validator: (maxController) {
                                              if (maxController!.isEmpty) {
                                                return "Max Time can't be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Container(
                                  height: 60,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextFormField(
                                      controller: priceController,
                                      decoration: const InputDecoration(
                                          hintText: 'Price',
                                          border: InputBorder.none),
                                      validator: (priceController) {
                                        if (priceController!.isEmpty) {
                                          return "Price can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                              height: 60,
                              width: 240,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.amberAccent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    addservices();
                                    print('isadded');
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Agree to Terms and Conditions to  Continue'),
                                      ),
                                    );
                                  } else {
                                    print('error');
                                  }
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              });
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: ListView(children: [
          const Center(
            child: Text(
              'Our Services',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<Map>(
              future: postservices(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data!.entries.toList();

                      print(snapshot.data!.entries.toList()[index].value);
                      return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              snapshot.data!.remove(index);
                            });
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                      "Are you sure you wish to delete this item?"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("DELETE"),
                                    ),
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("CANCEL"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Text('Delete',
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                          child: Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Text(
                                data[index].value['name'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              subtitle: Text(
                                '${data[index].value['start time']} - ${data[index].value['end time']}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: Text(
                                data[index].value['price'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                }
                return const Center(
                  child: Text(
                    'No Service',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final Map serves;
  final int;
  const ServiceTile({Key? key, required this.serves, required this.int})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        title: Text(
          serves[2],
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        subtitle: Text(
          '${serves[4]} - ${serves[1]}',
          style: const TextStyle(color: Colors.white),
        ),
        trailing: Text(
          serves[3],
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ServicesLib {
  String name;
  String startTime;
  String endTime;
  String price;

  ServicesLib(
      {required this.name,
      required this.startTime,
      required this.endTime,
      required this.price});
}

// class ServeLib {
//   List<ServeLib> serveLib;

//   ServeLib({ required this.serveLib});
// }

// List<Map<String, String>> serve = [];
