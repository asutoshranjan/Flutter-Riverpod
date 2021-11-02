// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//here we are wrapping the whole my app in a ProviderScope widget so that we can use the provider down the line in our widget tree
void main() {
  runApp(
    ProviderScope(
      child: MyApp()
    ),
  );
}

//Providers in riverpod are managed and we can absolutely add them to any file we want (looks like global)
//its globally defined but locally can be used and manuplated (much like a global function)

final greetingProvider = Provider((ref) => 'Hello Riverpod!');

// have to change from state less widget to consumer widget (extra scoped reader parameter)

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final greeting = watch(greetingProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod'),
          centerTitle: true,
        ),

        body: Center(
          child: Text('$greeting how are you?'),
        ),

      ),

    );
  }
}


