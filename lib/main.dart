import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/pages/home_page.dart';

import 'blocs/list_post_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern - BloC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider(
      //   create: (BuildContext context) => ListPostCubit(),
      //   child: HomePage(),
      // ),

      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ListPostCubit()),
      ], child: HomePage()),
    );
  }
}
