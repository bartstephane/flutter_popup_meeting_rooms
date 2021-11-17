import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/config/strings.dart';

class FloorDetails extends StatefulWidget {
  FloorDetails({required Key key, required this.floor}) : super(key: key);

  final Floor floor;

  @override
  _FloorDetailsState createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 120.0,
              backgroundColor: Colors.blueAccent,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.floor.floor_name,
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
                      return _buildCard(widget.floor.floor_rooms[index]);
                      },
                childCount: widget.floor.floor_rooms.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Room room) {

    return Card(
      /*
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FloorDetails(
                key: Key(
                    floor.floor_id.toString()
                ),
                floor: floor,
              ),
            ),
          );
        },
       */
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
                        "Temperature: ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "CO2 level",
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
                        "20 °C",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "5%",
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
