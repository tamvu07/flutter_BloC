
import 'package:bloc_art_ct_aris/common/error/app_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required AppError error}) = Failure<T>;


  // static Result<T> guard<T>(T Function() body) {
  //   try {
  //     return Result.success(data: body());
  //   } on Exception catch (e) {
  //     return Result.failure(error: AppError(e));
  //   }
  // }

  // static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
  //   try {
  //     return Result.success(data: await future());
  //   } on Exception catch (e) {
  //     return Result.failure(error: AppError(e));
  //   }
  // }

  // bool get isSuccess => when(success: (data) => true, failure: (e) => false);

  // bool get isFailure => !isSuccess;

}