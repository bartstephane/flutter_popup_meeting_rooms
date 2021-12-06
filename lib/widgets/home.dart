import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/building.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/config/strings.dart';
import 'package:popup_meeting_rooms/widgets/floor_details.dart';
import 'package:popup_meeting_rooms/widgets/rooms_by_floor.dart';
import 'about.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;


  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String buildingValue = Strings.mainBuilding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<List<Building>>(
          stream: updateData(Duration(seconds: 5), http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot);
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                    Strings.error + '${snapshot.error}'
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              return CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 120.0,
                    backgroundColor: Colors.black,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        Strings.appTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                          ),
                        ),
                      background: Image.asset(
                          Strings.appBanner,
                          fit: BoxFit.scaleDown,
                          scale: 2
                      ),
                      centerTitle: true,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                      child: Container(
                        color: Colors.black,
                        child: Center(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            value: buildingValue,
                            icon: const Icon(
                                Icons.arrow_downward,
                            ),
                            iconEnabledColor: Colors.yellowAccent,
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                              color: Colors.yellowAccent,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.yellowAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                buildingValue = newValue!;
                              });
                            },
                            items: _getBuildingNames(snapshot.data)
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return _buildCard(snapshot.data!.where((element) => element.name == buildingValue).first.floors[index]);
                          },
                      childCount: snapshot.data!.where((element) => element.name == buildingValue).first.floors.length,
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellowAccent,
          child: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {

          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.yellowAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
            ],
          ),
          elevation: 5.0,
          color: Colors.black,
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
                floor: floor,
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                floor.id.toString() + Strings.floorName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  //color: Colors.white,
                ),
              ),
              minVerticalPadding: 2,
              subtitle: Text(
                _countAvailableRooms(floor).toString() + Strings.availableRooms,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  //color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
              padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                child: RoomsByFloor(
                  floor: floor,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 1.0,
      color: _changeFloorColor(floor),
    );

  }

  int _countAvailableRooms(Floor floor) {
    int availableRooms = 0;
    for(Room room in floor.rooms) {
      if (room.detected == false) {
        availableRooms++;
      }
    }
    return availableRooms;
  }

  Color _changeFloorColor(Floor floor) {
    if(_countAvailableRooms(floor) > 0) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  List<String> _getBuildingNames(List<Building>? data) {
    List<String> buildingNames = List.empty(growable: true);
    for (Building building in data!) {
      buildingNames.add(building.name);
    }
    return buildingNames;
  }

}

Future<List<Building>> getData(http.Client client) async {
  final response = await client
      .get(Uri.parse(Strings.apiUrl));

  return parseData(response.body);
}

List<Building> parseData(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Building>((json) => Building.fromJson(json)).toList();
}

Stream<List<Building>> updateData(Duration refreshTime, http.Client client) async* {
  while (true) {
    await Future.delayed(refreshTime);
    yield await getData(client);
  }
}
