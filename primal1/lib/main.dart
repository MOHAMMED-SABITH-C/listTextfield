import 'package:flutter/material.dart';
import 'package:primal1/home.dart';
import 'package:primal1/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Change())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSwatch(primarySwatch:  Colors.grey)

            // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 254, 254, 255)),
            // useMaterial3: true,
            ),
        home: const MyHomePage(),
      ),
    );
    //   }
    // );
  }
}
