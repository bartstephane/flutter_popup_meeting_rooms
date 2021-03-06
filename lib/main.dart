import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/config/strings.dart';
import 'package:popup_meeting_rooms/widgets/home.dart';

void main() {
  runApp(const PopupMeetingRooms());
}

class PopupMeetingRooms extends StatelessWidget {
  const PopupMeetingRooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(
        title: Strings.appTitle,
      ),
    );
  }
}