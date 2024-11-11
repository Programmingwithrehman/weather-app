import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Selected index for the bottom navigation bar
  int _selectedIndex = 1;

  // List of pages for Yesterday, Today, and Forecast
  final List<Widget> _pages = [
    YesterdayPage(),
    TodayPage(),
    ForecastPage(),
  ];

  // Function to handle BottomNavigationBar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Drawer navigation helper function
  void _navigateToPage(String page) {
    Navigator.pop(context); // Close the drawer
    switch (page) {
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case 'Help':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpPage()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      default:
        break;
    }
  }

  // Function for handling top-right corner menu
  void _handleTopRightMenu(String action) {
    switch (action) {
      case 'Profile':
        // Navigate to profile page or show profile details
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 'Notifications':
        // Navigate to notifications or show notification details
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationsPage()),
        );
        break;
      case 'Log Out':
        // Handle log out action (for now just show a dialog)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Log Out'),
              content: Text('Are you sure you want to log out?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text('Log Out'),
                  onPressed: () {
                    // Log out logic here (e.g., clearing user data, etc.)
                    Navigator.pop(context); // Close dialog
                  },
                ),
              ],
            );
          },
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: <Widget>[
          // Top-right corner menu
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => _handleTopRightMenu('Profile'),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => _handleTopRightMenu('Notifications'),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _handleTopRightMenu('Log Out'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('About'),
              onTap: () => _navigateToPage('About'),
            ),
            ListTile(
              title: Text('Help'),
              onTap: () => _navigateToPage('Help'),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () => _navigateToPage('Settings'),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Show the selected page content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight selected tab
        onTap: _onItemTapped, // Handle tab switch
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Yesterday',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Forecast',
          ),
        ],
      ),
    );
  }
}

class YesterdayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Yesterday\'s Weather',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Today\'s Weather',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Weather Forecast',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Placeholder About page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Text('About the Weather App')),
    );
  }
}

// Placeholder Help page
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(child: Text('Help Section')),
    );
  }
}

// Placeholder Settings page
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings')),
    );
  }
}

// Placeholder Profile page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
    );
  }
}

// Placeholder Notifications page
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(child: Text('Notifications Page')),
    );
  }
}
