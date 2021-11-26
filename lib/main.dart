import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popup_meeting_rooms/business/building.dart';
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
      home: Scaffold(
        body: FutureBuilder<List<Building>>(
        future: fetchJson(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot);
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                    'Error: ${snapshot.error}'
                ),
              );
            } else if (snapshot.hasData) {
              return Home(
                snapshot: snapshot,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ),
    );
  }
}

List<Building> parseData(String data) {

  final parsed = jsonDecode(data).cast<Map<String, dynamic>>();

  return parsed.map<Building>((json) => Building.fromJson(json)).toList();

}

Future<List<Building>> fetchJson() async {
  final String data = await rootBundle.loadString('assets/data_v3.json');
  return parseData(data);
}