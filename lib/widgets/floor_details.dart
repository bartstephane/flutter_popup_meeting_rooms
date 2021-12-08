import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/config/strings.dart';
import 'package:popup_meeting_rooms/widgets/about.dart';
import 'package:popup_meeting_rooms/widgets/settings.dart';

class FloorDetails extends StatefulWidget {
  FloorDetails({Key? key, required this.floor}) : super(key: key);

  final Floor floor;

  @override
  _FloorDetailsState createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 120.0,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.floor.id.toString() + Strings.floorName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                ),
              ),
              background: Image.asset(
                  Strings.appBanner,
                  fit: BoxFit.scaleDown, scale: 2
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildCard(widget.floor.rooms[index]);
                    },
              childCount: widget.floor.rooms.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellowAccent,
        child: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          );
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
    );
  }

  Widget _buildCard(Room room) {

    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                room.room_name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
              padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        Strings.temperature,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        Strings.co2level,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        Strings.temperatureSample,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        Strings.co2levelSample,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      elevation: 1.0,
      color: _changeRoomColor(room),
      );
  }

  Color _changeRoomColor(Room room) {
    if(room.detected == false) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

}
