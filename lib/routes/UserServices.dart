import 'package:combi_salvaje/routes/register.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {


  Future<bool> saveUser(String name, String email, String password) async{
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users')
          .push()
          .set({'name': name, 'email': email, 'password': password});
      return true;
    }catch (e){
      print(e);
      return false;
    }
  }

}