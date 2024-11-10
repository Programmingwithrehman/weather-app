import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          // Top-right corner menu (gear icon)
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings or preferences screen
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Weather App Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Share Weather Info'),
              onTap: () {
                // Handle the share weather info option
              },
            ),
            ListTile(
              title: Text('Weather News & Tips'),
              onTap: () {
                // Handle weather news and tips option
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Weather information will appear here'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Current Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Hourly Forecast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Next Few Days',
          ),
        ],
      ),
    );
  }
}
