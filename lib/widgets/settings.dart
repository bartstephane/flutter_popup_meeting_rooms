import 'package:flutter/material.dart';
import 'package:popup_meeting_rooms/config/strings.dart';

class Settings extends StatelessWidget {
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
                Strings.settings,
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
                  MaterialPageRoute(builder: (context) => Settings()),
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
          height: 80,
          child: Card(
            color: Colors.black12,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    Strings.favoriteBuilding,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  subtitle: Text(
                    Strings.mainBuilding,
                    style: TextStyle(
                      color: Colors.yellowAccent,
                    ),
                  ),
                  leading: Icon(
                    Icons.house,
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
