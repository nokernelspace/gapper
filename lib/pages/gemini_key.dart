import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


class GeminiKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Gemini API Key...",
                border: OutlineInputBorder(),
              ),

            ),

            MaterialButton(
              onPressed: () async {
                final Uri url = Uri(scheme: "https", host: "aistudio.google.com", path: "/api-keys");
                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Text("Open Google AI Studio API Key Dashboard"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          tooltip: 'Check',
          label: const Text("Validate API Key"),
          icon: const Icon(Icons.check)
      ),
    );
  }
}