import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_block/pages/home_page.dart';

import 'bloc/list_post_cubit.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pattern bloc",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: BlocProvider(
      //   create: (BuildContext context) => ListPostCubit(),
      //   child: HomePage(),
      // ),


      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ListPostCubit()),
        BlocProvider(create: (context) => ListPostCubit()),
      ], child: HomePage()),
    );
  }
}
