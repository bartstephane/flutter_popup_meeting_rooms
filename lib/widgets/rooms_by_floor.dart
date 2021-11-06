import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';

class RoomsByFloor extends StatefulWidget {
  final Floor floor;

  const RoomsByFloor({required Key key, required this.floor}) : super(key: key);

  _RoomsByFloorState createState() => _RoomsByFloorState();

}

class _RoomsByFloorState extends State<RoomsByFloor> {

  @override
  Widget build(BuildContext context) {
    return Row(
        children: _buildRooms(
            widget.floor.rooms,
            widget.floor.rooms.length
        ),
    );
  }

  List<Container> _buildRooms(List<Room> rooms, int length) => List.generate(
    length, (index) => Container(
      child: Text(
          widget.floor.rooms[index].room_name,
          textScaleFactor: 0.85
      ),
      margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
      padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: _changeColor(widget.floor.rooms[index]),
        ),
        borderRadius: BorderRadius.circular(20),
        color: _changeColor(widget.floor.rooms[index]),
      ),
    ),
  );

  Color _changeColor(Room room) {
    if(room.detected) {
      return Colors.redAccent;
    } else {
      return Colors.greenAccent;
    }
  }
}
