import 'package:drage_demo/controller/json_decode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(
         create: (context) => puzz_provider(),
       ),
     ],
      builder: (context, child){
       return MaterialApp(
        showSemanticsDebugger: false,
        initialRoute: "/",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => Home_Screen(),

        },
        debugShowCheckedModeBanner: false,
        // home: HomeScreen(),
      );
      }
    );
  }
}

