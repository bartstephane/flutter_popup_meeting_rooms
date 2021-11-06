import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/widgets/building.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Floor>>(
        future: fetchJson(), // fetchRooms(http.Client()),
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
            return Building(
              key: const Key("1"),
              floors: snapshot.data!,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

/*
Future<List<PopupMeetingRoom>> fetchPopupMeetingRooms(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://206.189.16.14/getAllRooms'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePopupMeetingRooms, response.body);
}

// A function that converts a response body into a List<Photo>.
List<PopupMeetingRoom> parsePopupMeetingRooms(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PopupMeetingRoom>((json) => PopupMeetingRoom.fromJson(json)).toList();
}
*/
/*
List<Room> parseRooms(String data) {
  final parsed = jsonDecode(data).cast<Map<String, dynamic>>();
  return parsed.map<Room>((json) => Room.fromJson(json)).toList();
}

Future<List<Room>> fetchRooms() async {
  final String data = await rootBundle.loadString('assets/data.json');
  return parseRooms(data);
}
*/
List<Floor> parseFloors(String data) {

  final parsed = jsonDecode(data).cast<Map<String, dynamic>>();

  List<Room> rooms = parsed.map<Room>((json) => Room.fromJson(json)).toList();

  List<Room> floorRooms = List.empty(growable: true);

  List<Floor> floors = List.empty(growable: true);

  for(int i = 1; i <= rooms[rooms.length - 1].building_floor; i++) {
    Floor floor = Floor(building_floor: i, rooms: floorRooms);
    for(Room room in rooms) {
      if(room.building_floor == i) {
        floor.rooms.add(room);
      }
    }
    floors.add(floor);
  }

  return floors;

}

Future<List<Floor>> fetchJson() async {
  final String data = await rootBundle.loadString('assets/data.json');
  return parseFloors(data);
}
