import 'package:api_provider/bloc_test/presentation/next_page.dart';
import 'package:api_provider/my_bloc/bloc/auth_bloc.dart';
import 'package:api_provider/my_bloc/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumber = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Handling"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            snackBar(context, isError: true, message: state.error);
          }
          if (state is OtpSendState) {
            push(context: context, screen: const NextPage());
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return Validation.phoneValidate(
                        value!,
                        "Enter Phone Number");
                  },
                  controller: phoneNumber,
                  decoration: const InputDecoration(
                    hintText: "Enter Phone Number"
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state){
                    if (state is LoginLoadingState) {
                      return loading(context);
                    }
                    return ElevatedButton(onPressed: (){
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(
                                username: "01 ${phoneNumber.text}"));
                      }
                    }, child: const Text("Enter"));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Center loading(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.orange,
    ),
  );
}


dynamic snackBar(BuildContext context, {bool isError = true, String? message}) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    content: Text(message ?? "Something went wrong :("),
    elevation: 1000,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}

Future<T?> push<T>({
  required BuildContext context,
  required Widget screen,
  bool pushUntil = false,
}) {
  if (pushUntil) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => screen),
            (Route<dynamic> route) => false);
  }
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (_) => screen));
}