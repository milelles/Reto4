import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reto4/controlador/controladorGeneral.dart';
import 'package:reto4/interfaz/listar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../procesos/peticiones.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geolocalizador',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'GeoLocalizador - Grupo 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  controladorGeneral Control = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: listar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Alert(
                  title: "ATENCIÓN!!",
                  desc: "Esta seguro que desea almacenar su ubicación?",
                  type: AlertType.info,
                  buttons: [
                    DialogButton(
                        color: Colors.green,
                        child: Text("SI"),
                        onPressed: () {
                          peticionesDB.GuardarPosicion(
                              "321564,6542586", DateTime.now().toString());
                          Control.CargarTodaBD();
                          Navigator.pop(context);
                        }),
                    DialogButton(
                        color: Colors.red,
                        child: Text("NO"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                  context: context)
              .show();
        },
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}
