import 'package:api_provider/my_bloc/bloc/auth_bloc.dart';
import 'package:api_provider/my_bloc/cubit/global_cubit.dart';
import 'package:api_provider/my_bloc/cubit/locale_cubit.dart';
import 'package:api_provider/my_bloc/dio/dio_client.dart';
import 'package:api_provider/my_bloc/repos/data/auth_repo.dart';
import 'package:api_provider/my_bloc/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //repository

  sl.registerLazySingleton(() => AuthRepository(dioClient: sl()));
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(),
      loggingInterceptor: sl()));
  //provider

  sl.registerFactory(() => GlobalCubit());
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}
