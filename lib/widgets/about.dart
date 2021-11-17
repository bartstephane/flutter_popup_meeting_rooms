import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
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
                      title: Text("developedBy",
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
                      title: Text("Haaga-Helia",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text("Frontend team"),
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.blue[500],
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    ListTile(
                      title: Text("000 00 00 00",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[500],
                      ),
                    ),
                    ListTile(
                      title: Text("frontend@myy.haaga-helia.fi"),
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
