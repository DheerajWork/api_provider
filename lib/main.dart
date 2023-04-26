import 'package:api_provider/bloc_test/data/repo/post_repo.dart';
import 'package:api_provider/bloc_test/presentation/home_screen.dart';
import 'package:api_provider/my_bloc/cubit/locale_cubit.dart';
import 'package:api_provider/my_bloc/cubit/locale_state.dart';
import 'package:api_provider/my_bloc/provider.dart';
import 'package:api_provider/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // PostRepo postRepo = PostRepo();
  // postRepo.fetchPosts();
  Bloc.observer = MainBlocObserver();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providers,
        child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
    previousState != currentState,
    builder: (context, localeState) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
          );
    }
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context,listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<TodoProvider>(
          builder: (context, value, child){
            final todos = value.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (c,i){
                final todo = todos[i];
                return Column(
                  children: [
                    Text(todo.addressId as String),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MainBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}

