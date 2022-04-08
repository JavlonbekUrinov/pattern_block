import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'item_of_post.dart';

Widget viewOfHome(List<Post> items, bool isLoading){
  return Stack(
    children: [
      ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx,items[index]);
        },
      ),
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox.shrink(),
    ],
  );
}