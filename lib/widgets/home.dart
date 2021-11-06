import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/config/strings.dart';
import 'package:popup_meeting_rooms/widgets/building.dart';
import 'package:popup_meeting_rooms/widgets/floor_details.dart';
import 'package:popup_meeting_rooms/widgets/rooms_by_floor.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              return CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 120.0,
                    backgroundColor: Color.fromARGB(1, 0, 127, 163),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        Strings.appTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                          ),
                        ),
                      background: Image.asset(Strings.appBanner, fit: BoxFit.scaleDown, scale: 2),
                      centerTitle: true,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return _buildCard(snapshot.data![index]);
                          },
                      childCount: snapshot.data!.length,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(Floor floor) {

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FloorDetails(
                    key: Key(floor.building_floor.toString()),)),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                floor.building_floor.toString() + '. floor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(height: 0),
            Container(
                margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: RoomsByFloor(
                  key: Key(
                      floor.building_floor.toString()
                  ),
                  floor: floor,
                ),
            ),
          ],
        ),
      ),
      elevation: 1.0,
      color: _changeColor(floor),
    );
  }
  
  Color _changeColor(Floor floor) {
    int availableRooms = 0;
    for(Room room in floor.rooms) {
      if(room.detected == false) {
        availableRooms++;
      }
      print('Floor ' + floor.building_floor.toString() + ' : ' + availableRooms.toString() + ' available rooms');
      if(availableRooms > 0) {
        return Colors.greenAccent;
      } else {
        return Colors.redAccent;
      }
    }
    return Colors.white;
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

  List<Floor> floors = List.empty(growable: true);

  for(int i = 1; i <= rooms[rooms.length - 1].building_floor; i++) {
    List<Room> floorRooms = List.from(rooms);
    Floor floor = Floor(building_floor: i, rooms: floorRooms);
    floor.rooms.removeWhere((element) => element.building_floor != i);
    floors.add(floor);
  }

  return floors;

}

Future<List<Floor>> fetchJson() async {
  final String data = await rootBundle.loadString('assets/data.json');
  return parseFloors(data);
}
