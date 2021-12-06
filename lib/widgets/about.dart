import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/config/strings.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.about),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 70,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(Strings.developedBy,
                          style: TextStyle(fontWeight: FontWeight.w500,
                              color: Colors.blueAccent)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 210,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(Strings.developer,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(Strings.school),
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.blue[500],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    ListTile(
                      title: Text(Strings.phone,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[500],
                      ),
                    ),
                    ListTile(
                      title: Text(Strings.mail),
                      leading: Icon(
                        Icons.mail_outline,
                        color: Colors.blue[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
