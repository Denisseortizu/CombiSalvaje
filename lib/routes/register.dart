import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'UserServices.dart';
class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  static const String _titulo = 'Registro';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_titulo),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController RnameController = TextEditingController();
  TextEditingController RemailController = TextEditingController();
  TextEditingController RpasswordController = TextEditingController();
  TextEditingController RSecPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //return Stack(
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(

          children: <Widget>[
            Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("images/fondo1.jpg"), fit: BoxFit.cover,),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 150.0),
                child: const Text(
                  'Regístrate',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: RnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: RemailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: RpasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: RSecPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar Contraseña',
                ),
              ),
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  child: const Text('Registrarme',),
                  onPressed: () async {

                    if(RpasswordController.text==RSecPasswordController.text){
                      bool respuesta = await  UserServices().saveUser(
                        RnameController.text,
                        RemailController.text,
                        RpasswordController.text

                      );

                      if(respuesta){
                        Fluttertoast.showToast(
                            msg: "Usuario agregado correctamente",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 30.0
                        );

                      }

                      else{
                        Fluttertoast.showToast(
                            msg: "Algo salio mal :c",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 30.0
                        );

                      }

                    }else{
                      Fluttertoast.showToast(
                          msg: "La contraseña no coincide",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 30.0
                      );

                    };

                  },
                )
            ),
          ],

        ));
    // )
  }
}