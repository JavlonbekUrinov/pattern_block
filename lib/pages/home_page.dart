import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_block/bloc/listPost_state.dart';
import 'package:pattern_block/bloc/list_post_cubit.dart';

import '../models/post_model.dart';
import '../view/view_of_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pattern - setState"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state) {
          if (state is ListPostError) {
            return viewOfHome(items, true);
          }
          if (state is ListPostLoaded) {
            items = state.posts!;
            return viewOfHome(items, false);
          }
          return viewOfHome(items, true);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/////////////////////////////////////////////////////////
