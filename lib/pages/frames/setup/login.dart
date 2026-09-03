import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gapper/utils.dart';

class LoginFrame extends StatelessWidget {
  /// here we are passing in a loading value
  ValueNotifier<bool> loading;
  LoginFrame(this.loading);


  @override
  Widget build(BuildContext ctx) {
    return PopScope(
        canPop: false,
        child: LoginPage(loading)
    );
  }

}


class LoginPage extends StatefulWidget {
  ValueNotifier<bool> loading;
  LoginPage(this.loading, {super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>
{

  //   with SingleTickerProviderStateMixin {
  // late Animation<double> animation;
  // late AnimationController controller;
  //
  // @override
  // void didUpdateWidget(LoginPage old) {
  //   super.didUpdateWidget(old);
  //   controller.duration = widget.duration;
  // }
  //
  // @override
  // void initState() {
  //   controller = AnimationController(
  //       duration: const Duration(seconds: 100),
  //       vsync: this
  //   );
  //
  //   animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)
  //     ..addStatusListener((status) {
  //       if (status == AnimationStatus.completed) {
  //         controller.reverse();
  //       }
  //     });
  // }

  final login_form = GlobalKey<FormState>();
  final create_form = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final RegExp email_regex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
  );

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(7, 17, 7, 1),
              child: Column(
                /// IMPORTANT
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Form(
                      key: login_form,
                      child :Column(children: [
                        const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        TextFormField(
                            controller: email_controller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                label: const Text("email")
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter an email address';
                              }
                              if (!email_regex.hasMatch(value.trim())) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            }
                        ),

                        TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: const Text("password")
                            )
                        ),
                      ])),

                  SizedBox(height: 150),


                  Form(
                      key: create_form,
                      child :Column(children: [
                        const Text("Create a New Account", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        TextFormField(
                            controller: email_controller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                label: const Text("email")
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter an email address';
                              }
                              if (!email_regex.hasMatch(value.trim())) {
                                return 'Please enter a valid email address';
                              }

                              return null;
                            }
                        ),

                        TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: const Text("password")
                            )
                        ),

                        TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: const Text("confirm password")
                            )
                        ),
                      ])),
                ],
              )
          )
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {

            bool trying_login = false;
            for (var field in login_form.currentState!.fields) {
              if (field.value != "") {
                trying_login = true;
                login_form.currentState!.validate();
                showSnackBar(ctx, "Logging in...");
                break;
              }
            }

            if (!trying_login) {
              showSnackBar(ctx, "Creating new account...");
            }

            //setState(() {
              widget.loading.value = !widget.loading.value;
            //});

          },
          tooltip: 'Login / Create New Account',
          label: const Text("Done"),
          icon: const Icon(Icons.check)
      ),
    );
  }


}