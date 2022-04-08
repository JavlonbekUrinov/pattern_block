import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_block/bloc/list_post_cubit.dart';

import '../models/post_model.dart';


Widget itemOfPost(BuildContext context,Post post) {
  return Slidable(
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      ////////////updated
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(

            post.title!.toUpperCase(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(post.body!),
        ],
      ),
    ),
    startActionPane: ActionPane(
      extentRatio: 0.3,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          label: 'Update',
          backgroundColor: Colors.indigo,
          icon: Icons.edit,
          onPressed: (_) {
            BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, post);
          },
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      extentRatio: 0.3,
      children: [
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (_) {
          BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
          },
        ),
      ],
    ),
  );
}