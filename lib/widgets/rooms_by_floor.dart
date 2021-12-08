import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';

class RoomsByFloor extends StatefulWidget {

  const RoomsByFloor({Key? key, required this.floor}) : super(key: key);

  final Floor floor;

  _RoomsByFloorState createState() => _RoomsByFloorState();

}

class _RoomsByFloorState extends State<RoomsByFloor> {

  @override
  Widget build(BuildContext context) {
    return Row(
        children: _listRooms(widget.floor, widget.floor.rooms.length)
    );
  }

  List<Container> _listRooms(Floor floor, int length) => List.generate(
    length,
        (index) => Container(
          child: Text(
            floor.rooms[index].room_name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
          padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: _changeRoomColor(floor.rooms[index]),
            ),
            borderRadius: BorderRadius.circular(20),
            color: _changeRoomColor(floor.rooms[index]),
          ),
        ),
  );

  Color _changeRoomColor(Room room) {
    if(room.detected == false) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

}