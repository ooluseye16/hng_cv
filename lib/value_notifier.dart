import 'package:flutter/foundation.dart';

class CVNotifier {
  final ValueNotifier<String> fullNameNotifier =
      ValueNotifier<String>("Oluseye Obisesan");

  final ValueNotifier<String> slackIDNotifier = ValueNotifier<String>("Tirioh");

  final ValueNotifier<String> githubHandleNotifier =
      ValueNotifier<String>("ooluseye16");

  final ValueNotifier<String> bioNotifier = ValueNotifier<String>(
      "A mobile application developer who is curious and calm. Honest but hate being cheated. Love games and Anime.");
}
