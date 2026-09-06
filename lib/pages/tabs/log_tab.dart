import 'package:flutter/material.dart';
import 'package:gapper/wrappers/gemini.dart';

class LogTab extends StatelessWidget {
  const LogTab({super.key});


  @override
  Widget build(BuildContext ctx) {
    return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            MaterialButton(
                onPressed: (){
                  signInWithGoogle();
                },
                child: const Text("Sign In")
            )
          ],
        ),
      );
  }

}
