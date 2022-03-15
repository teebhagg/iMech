import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class SirPrince {
  Future<String> username();
  Future<Map> addservices();
}

class Getid implements SirPrince {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Future<String> username() async {
    DatabaseReference UserRef = FirebaseDatabase.instance
        .ref()
        .child('Mech, Auto and Tows')
        .child(user!.uid);
    final idsnapshot = await UserRef.child('company').get();
    print(idsnapshot.value);
    return idsnapshot.value as String;
  }

  @override
  Future<Map> addservices() async {
    User? user = FirebaseAuth.instance.currentUser;
    DatabaseReference UserRef = FirebaseDatabase.instance
        .ref()
        .child('Mech, Auto and Tows')
        .child(user!.uid);
    final add = await UserRef.child('Servies').push().set({});
    return add as Map;
  }
}
