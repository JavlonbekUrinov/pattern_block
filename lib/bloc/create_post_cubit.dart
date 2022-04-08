import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_block/bloc/create_post_state.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class CreatePostCubit extends Cubit<CreatePostState>{
  CreatePostCubit() : super(CreatePostInit());


  void apiCreatePost(Post post) async{
    print(post.toJson());
    emit(CreatePostLoading());

    final response = await Network.POST(Network.API_CREATE, Network.paramsEmpty());
    print(response);

    if(response != null){
      emit(CreatePostLoaded(isCreated: true));
    }else{
      emit(CreatePostError(error: "Could not create posts"));
    }
  }
}