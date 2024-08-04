
import 'package:freezed_annotation/freezed_annotation.dart';


part 'blog_state.freezed.dart';

@freezed
class BlogState<T> with _$BlogState<T> {

  const factory BlogState.initial() = _Initial;
  const factory BlogState.success(T data) = Success<T>;
  const factory BlogState.loading() = Loading;
  const factory BlogState.error({required String error}) = Error ;
}