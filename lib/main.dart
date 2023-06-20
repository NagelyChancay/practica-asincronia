/*
Codigo realizado por: Nagely Yelena Chancay Montes
Materia: Aplicaciones Moviles
Curso: 7mo Nivel "A"
*/

import 'package:flutter/material.dart';
import 'package:practica_asincronia/services/mockapi.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimatedScreen(),
    );
  }
}

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  //Instancia de la clase MockApi
  final MockApi _mockApi = MockApi();
  //Creacion de string para cambiar el texto
  String textGreen = '';
  String textOrange = '';
  String textRed = '';
  //Creacion de variable para cambiar el tamaño del AnimatedContainer
  double widthGreen = 0.0;
  double widthOrange = 0.0;
  double widthRed = 0.0;
  //Creacion de variables de tipo Duration para la duracion de la animacion del AnimatedContainer
  Duration durationGreen = const Duration(seconds: 1);
  Duration durationOrange = const Duration(seconds: 3);
  Duration durationRed = const Duration(seconds: 10);

  void onPressedGreen() async {
    setState(() {
      widthGreen = 100.0;
    });
    final result = await _mockApi.getFerrariInteger();
    setState(() {
      widthGreen = 0.0;
      textGreen = '$result';
    });
  }
  void onPressedOrange() async{
    setState(() {
      widthOrange = 100.0;
    });
    final result = await _mockApi.getHyundaiInteger();
    setState(() {
      widthOrange = 0.0;
      textOrange = '$result';
    });
  }
  void onPressedRed() async{
    setState(() {
      widthRed = 100.0;
    });
    final result = await _mockApi.getHyundaiInteger();
    setState(() {
      widthRed = 0.0;
      textRed = '$result';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous call'),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedGreen, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                  child: const SizedBox(
                    width: 30.0,
                    height: 50.0,
                    child: Center(
                      child: Icon(
                        Icons.flash_on, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: widthGreen,
                  height: 10.0,
                  duration: durationGreen,
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                const SizedBox(height: 10,),
                Text(textGreen, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,), 
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedOrange, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)
                  ),
                  child: const SizedBox(
                    width: 30.0,
                    height: 50.0,
                    child: Center(
                      child: Icon(
                        Icons.directions_bus_outlined, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: widthOrange,
                  height: 10.0,
                  duration: durationOrange,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
                const SizedBox(height: 10,),
                Text(textOrange, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                ElevatedButton(
                  onPressed: onPressedRed, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: const SizedBox(
                    width: 30.0,
                    height: 50.0,
                    child: Center(
                      child: Icon(
                        Icons.directions_walk, 
                        color: Colors.black,
                        size: 30,
                      )
                    ),
                  )
                ),
                const SizedBox(height: 10,),
                AnimatedContainer(
                  width: widthRed,
                  height: 10.0,
                  duration: durationRed,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                const SizedBox(height: 10,),
                Text(textRed, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ]
        ),
      ),
    );
  }
}