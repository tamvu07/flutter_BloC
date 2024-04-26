

import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc_call_api/features/post/posts/posts_event.dart';
import 'package:demo_bloc_call_api/features/post/posts/posts_state.dart';

import '../models/post_data_ui_model.dart';
import '../repos/posts_repo.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(StartGetDataState()) {
    on<FetchDataEvent>(startGetData);
    on<AddDataEvent>(addData);
  }

  FutureOr<void> startGetData(
      FetchDataEvent event, Emitter<PostsState> emit) async {
    emit(LoadingGetDataState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();
    for (int i = 0; i < posts.length; i++) {
      PostDataUiModel post = posts[i];
      String id = post.id.toString();
      String title = post.title.toString();
      print('a123......Post: $id --------- $title');
    }
    emit(SuccessGetDataState(posts: posts));
  }

  FutureOr<void> addData(
      AddDataEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();

    if (success) {
      emit(SuccessAddDataState());
    } else {
      emit(ErrorAddDataState());
    }
  }
}
