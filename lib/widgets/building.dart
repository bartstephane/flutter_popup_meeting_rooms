import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';
import 'package:popup_meeting_rooms/widgets/floor_details.dart';

class Building extends StatelessWidget {
  const Building({required Key key, required this.floors}) : super(key: key);

  final List<Floor> floors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: floors.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FloorDetails(key: Key("1")),
                  )
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    floors[index].building_floor.toString() + '. floor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(height: 0),
                ListTile(
                  title: Text('Rooms:'),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 3, 3, 3),
                  child: Text('test'), //TagsOverview(tags: queryDocumentSnapshot.get(Strings.firebaseTags)))
                ),
              ],
            ),
          ),
          elevation: 1.0,
          color: Colors.red,
        );
      },
    );
  }
}