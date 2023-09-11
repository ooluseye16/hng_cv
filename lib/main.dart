import 'package:flutter/material.dart';
import 'package:hng_cv/edit_screen.dart';
import 'package:hng_cv/value_notifier.dart';

void main() {
  runApp(const HngCVApp());
}

class HngCVApp extends StatelessWidget {
  const HngCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HNG CV',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CVNotifier cvNotifier = CVNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "MY CV",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
                child: ValueListenableBuilder<String>(
                    valueListenable: cvNotifier.fullNameNotifier,
                    builder: (context, value, child) {
                      return Text(
                        value.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      );
                    })),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Slack ID: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  ValueListenableBuilder<String>(
                      valueListenable: cvNotifier.slackIDNotifier,
                      builder: (context, value, child) {
                        return Text(
                          value,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        );
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Github Handle: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                ValueListenableBuilder<String>(
                    valueListenable: cvNotifier.githubHandleNotifier,
                    builder: (context, value, child) {
                      return Text(
                        value,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      );
                    })
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bio: ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                ValueListenableBuilder<String>(
                    valueListenable: cvNotifier.bioNotifier,
                    builder: (context, value, child) {
                      return Text(
                        value,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      );
                    })
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditCvScreen(
                                cvNotifier: cvNotifier,
                              )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text("Edit Information")),
                ))
          ],
        ),
      ),
    );
  }
}
