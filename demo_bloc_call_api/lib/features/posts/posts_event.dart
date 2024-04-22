

import 'package:flutter/cupertino.dart';

@immutable
abstract class PostsEvent {}


class FetchDataEvent extends PostsEvent{}


class AddDataEvent extends PostsEvent{}