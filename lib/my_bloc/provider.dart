import 'package:api_provider/my_bloc/bloc/auth_bloc.dart';
import 'package:api_provider/my_bloc/cubit/global_cubit.dart';
import 'package:api_provider/my_bloc/cubit/locale_cubit.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_provider/my_bloc/di_container.dart' as di;

List<SingleChildWidget> providers = [
  BlocProvider(create: (_) => di.sl<LocaleCubit>()),
  BlocProvider(create: (_) => di.sl<GlobalCubit>()),
  BlocProvider(create: (_) => di.sl<AuthBloc>()),
];
