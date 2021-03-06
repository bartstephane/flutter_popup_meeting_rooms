import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/config/strings.dart';
import 'package:popup_meeting_rooms/widgets/settings.dart';

class About extends StatelessWidget {
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
                Strings.about,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                ),
              ),
              background: Image.asset(
                  Strings.appBanner,
                  fit: BoxFit.scaleDown,
                  scale: 2,
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildCard(index);
                },
              childCount: 1,
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

  Widget _buildCard(int index) {
    return Column(
        children: <Widget>[
          SizedBox(
            height: 70,
            child: Card(
              color: Colors.black12,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      Strings.developedBy,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.yellowAccent
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 210,
            child: Card(
              color: Colors.black12,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      Strings.developer,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.yellowAccent,
                      ),
                    ),
                    subtitle: Text(
                      Strings.school,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                      ),
                    ),
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Colors.yellowAccent,
                  ),
                  ListTile(
                    title: Text(
                      Strings.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.yellowAccent,
                      ),
                    ),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      Strings.mail,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                      ),
                    ),
                    leading: Icon(
                      Icons.mail_outline,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}
