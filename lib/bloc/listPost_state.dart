import 'package:equatable/equatable.dart';

import '../models/post_model.dart';


//////listlari dannelarini yuborib sorab oliw un

abstract class ListPostState extends Equatable{
  @override
  List<Object> get props => [];
}
class ListPostInit extends ListPostState{}

class ListPostLoading extends ListPostState{}

class ListPostLoaded extends ListPostState{
  final List<Post>? posts;
  final List<Post>? isDeleted;

  ListPostLoaded({this.posts,this.isDeleted});
}
class ListPostError extends ListPostState{
  final error;

  ListPostError({this.error});
}