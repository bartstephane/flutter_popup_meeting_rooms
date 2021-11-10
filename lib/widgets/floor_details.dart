import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';

class FloorDetails extends StatefulWidget {
  FloorDetails({required Key key, required Floor floor}) : super(key: key);

  @override
  _FloorDetailsState createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'OK'
      ),
    );
  }
}