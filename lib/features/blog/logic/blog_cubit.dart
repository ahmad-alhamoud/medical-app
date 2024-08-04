import 'package:bloc/bloc.dart';
import 'package:medical_app/features/blog/data/repos/blog_repo.dart';
import 'package:medical_app/features/blog/logic/blog_state.dart';


class BlogCubit extends Cubit<BlogState> {
  final BlogRepo blogRepo;
  BlogCubit(this.blogRepo) : super(const BlogState.initial()) ;


  void emitBlogState() async {
    emit( const BlogState.loading());

    final  response = await blogRepo.getAllBlogs() ;
    response.when(
        success: (success){
          emit(BlogState.success(success));
        },
        failure: (error) {
          emit(BlogState.error(error: error.apiErrorModel.message ?? "يرجى المحاولة لاحقا"));
        }
    ) ;
  }
}