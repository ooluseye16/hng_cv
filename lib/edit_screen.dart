import 'package:flutter/material.dart';
import 'package:hng_cv/value_notifier.dart';

class EditCvScreen extends StatefulWidget {
  const EditCvScreen({super.key, required this.cvNotifier});
  final CVNotifier cvNotifier;
  @override
  State<EditCvScreen> createState() => _EditCvScreenState();
}

class _EditCvScreenState extends State<EditCvScreen> {
  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController slackIdController = TextEditingController();
  late TextEditingController githubUrlController = TextEditingController();
  late TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController.fromValue(
        TextEditingValue(text: widget.cvNotifier.fullNameNotifier.value));
    slackIdController = TextEditingController.fromValue(
        TextEditingValue(text: widget.cvNotifier.slackIDNotifier.value));
    githubUrlController = TextEditingController.fromValue(
        TextEditingValue(text: widget.cvNotifier.githubUrlNotifier.value));
    bioController = TextEditingController.fromValue(
        TextEditingValue(text: widget.cvNotifier.bioNotifier.value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "Edit CV",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Full name",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: fullNameController,
              decoration: inputDecoration,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Slack Id",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: slackIdController,
              decoration: inputDecoration,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Github Url",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: githubUrlController,
              decoration: inputDecoration,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Bio",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 150,
              child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  controller: bioController,
                  textAlignVertical: TextAlignVertical.top,
                  // maxLength: 255,
                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  onTapOutside: ((event) {
                    FocusScope.of(context).unfocus();
                  }),
                  decoration: inputDecoration),
            ),
            const SizedBox(
              height: 27,
            ),
            ElevatedButton(
                onPressed: () {
                  // Update the fullNameNotifier value
                  widget.cvNotifier.fullNameNotifier.value =
                      fullNameController.text;

                  // Update the slackIdNotifier value
                  widget.cvNotifier.slackIDNotifier.value =
                      slackIdController.text;

                  // Update the githubUrlNotifier value
                  widget.cvNotifier.githubUrlNotifier.value =
                      githubUrlController.text;

                  // Update the bioNotifier value
                  widget.cvNotifier.bioNotifier.value = bioController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Info updated successfully"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: Text("Update Information")),
                ))
          ],
        ),
      ),
    );
  }
}

var inputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey.shade200,
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  ),
);
