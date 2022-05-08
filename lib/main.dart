import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_practice/provider_counter.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (_)=> Counter() ),
      ],
      child: MyApp(),
    ),


  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double fontSize = context.watch<Counter>().size;
    Color color= context.watch<Counter>().choseColor;
    int count_value= context.watch<Counter>().count;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
        ),
          body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You have pressed button this many time: ${count_value}", style: TextStyle(fontSize: fontSize )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color)
                ),
                child: Text("Counter", style: TextStyle(fontSize: 18 )),
                onPressed: (){
                  context.read<Counter>().incrementCounter();
                },
              ),
                SizedBox(width: 20,),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(color)
                  ),
                  child: Text("Color", style: TextStyle(fontSize: 18 ),),
                  onPressed: (){
                    context.read<Counter>().changeColor();
                  },
                ),
  ]),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color)
                ),
                child: Text("Font Size", style: TextStyle(fontSize: 18 ),),
                onPressed: (){
                  context.read<Counter>().chnageSizeOfText();
                },
              ),
          ]),
        ),
      ),
    );
  }
}

