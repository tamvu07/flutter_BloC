

import 'package:flutter/cupertino.dart';

import '../models/post_data_ui_model.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class StartGetDataState extends PostsState {}

class LoadingGetDataState extends PostsState {}

class ErrorGetDataState extends PostsState {}

class SuccessGetDataState extends PostsState {
  final List<PostDataUiModel> posts;
  SuccessGetDataState({
    required this.posts,
  });
}

class SuccessAddDataState extends PostsActionState{}


class ErrorAddDataState extends PostsActionState{}