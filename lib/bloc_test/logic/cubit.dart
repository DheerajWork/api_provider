import 'package:api_provider/bloc_test/data/register_model.dart';
import 'package:api_provider/bloc_test/data/repo/post_repo.dart';
import 'package:api_provider/bloc_test/logic/state.dart';
import 'package:bloc/bloc.dart';

class MyCubit extends Cubit<MyState>{
  MyCubit(): super(LoadingState());

  PostRepo postRepo = PostRepo();

  void fetchPost()async{
    try{
     List<RegisterModel> posts = await postRepo.fetchPosts();
    }
    catch(e){
      e;
    }
  }
}