import 'package:flutter/material.dart';

void main(){
 runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setThemeData(BuildContext context, Brightness brightness) {
    final ThemeData theme = ThemeData(
      primaryColor: const Color.fromARGB(255, 0, 0, 0),
      scaffoldBackgroundColor: Color.fromARGB(255, 122, 116, 116),
      brightness: brightness,
    );
    ThemeMode themeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    context.findAncestorStateOfType<_MyAppState>()?.setThemeData(theme, themeMode);
  }
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData.light();
  ThemeMode _themeMode = ThemeMode.light;

  void setThemeData(ThemeData themeData, ThemeMode themeMode) {
    setState(() {
      _themeData = themeData;
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Data Management App',
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      themeMode: _themeMode,
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/yash5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Teachers Data App'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 125, 94, 94)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/yash7.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      // Perform validation or authentication logic here
                      // For now, navigate to the details page without any validation
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                    },
                    child: Text('Login'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 101, 53, 53)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/yash7.jpg'), // Replace with your actual background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageWithDrawer()));
                },
                child: Text('Go to Home Page with Drawer'),
              ),
              SizedBox(height: 20),
              Text('Details Page Content'),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page with Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/')); // Navigate back to the first page (Home)
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/yash7.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // First Row of Widgets
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LargeWidgetItem('Attendance', 'assets/Images/attendance.jpg'),
                        LargeWidgetItem('Marks', 'assets/Images/marks.jpg'),
                        LargeWidgetItem('Time Table', 'assets/Images/timetable.jpg'),
                      ],
                    ),
                    SizedBox(height: 20), // Vertical spacing between rows
                    // Second Row of Widgets
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LargeWidgetItem('Student Details', 'assets/Images/studentdetails.jpg'),
                        LargeWidgetItem('Upcoming Events', 'assets/Images/events.jpg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => YourPage()));
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                      MyApp.setThemeData(context, value ? Brightness.dark : Brightness.light);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Image.asset(
          'assets/Images/aboutus.jpg', // Replace 'aboutus.jpg' with your actual image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Need assistance? Chat with us!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                },
                child: Text('Chat with Us'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add('User: $message');
      // Perform logic to receive and send messages to the support team
      // For example, you can add a response from the support team here.
      // _messages.add('Support Team: Response message');
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Us'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    String message = _messageController.text;
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LargeWidgetItem extends StatelessWidget {
  final String title;
  final String imagePath;

  LargeWidgetItem(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(75),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle Attendance button click
                 Navigator.push(context, MaterialPageRoute(builder: (context) => AttendancePage()));
              },
              child: Text('Attendance'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Marks button click
                Navigator.push(context, MaterialPageRoute(builder: (context) => MarksPage()));
              },
              child: Text('Marks'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Time Table button click
                Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTablePage()));
              },
              child: Text('Time Table'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Student Details button click
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailsPage()));
              },
              child: Text('Student Details'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Events button click
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage()));
              },
              child: Text('Up coming Events'),
            ),
          ],
        ),
      ),
    );
  }
}
class TimeTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/time.jpg', // Replace with the actual image path
          fit: BoxFit.cover,
          width: 1200,
          height: 1200,
        ),
      ),
    );
  }
}
class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/events1.jpg', 
          fit: BoxFit.cover,
          width: 500,
          height: 800,
        ),
      ),
    );
  }
}
class StudentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/stud.jpg', // Replace with the actual image path
          fit: BoxFit.cover,
          width: 500,
          height: 800,
        ),
      ),
    );
  }
}
class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _selectedDate = DateTime.now();
  List<Student> students = List.generate(60, (index) => Student(index + 1, 'CSE ${index + 1}'));
  List<bool> attendance = [];

  @override
  void initState() {
    super.initState();
    // Initialize attendance list with all students present
    attendance = List.generate(students.length, (index) => true);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance - ${_selectedDate.toLocal()}'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            trailing: Checkbox(
              value: attendance[index],
              onChanged: (value) {
                setState(() {
                  attendance[index] = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save attendance data here along with the selected date
          // For example, you can send the data to a server or save it in a local database
          // You can also display a confirmation message to the user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Attendance Saved'),
                content: Text('Attendance data for ${_selectedDate.toLocal()} has been saved.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class MarksPage extends StatefulWidget {
  @override
  _MarksPageState createState() => _MarksPageState();
}

class _MarksPageState extends State<MarksPage> {
  List<Student> students = List.generate(60, (index) => Student(index + 1, 'CSE ${index + 1}'));
  List<Map<String, int>> marksData = List.generate(60, (index) => {'test1': 0, 'test2': 0, 'test3': 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marks Page'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(students[index].name),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Test 1: ${marksData[index]['test1']}'),
                    Text('Test 2: ${marksData[index]['test2']}'),
                    Text('Test 3: ${marksData[index]['test3']}'),
                  ],
                ),
                onTap: () {
                  _showMarksDialog(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showMarksDialog(int studentIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController test1Controller = TextEditingController();
        TextEditingController test2Controller = TextEditingController();
        TextEditingController test3Controller = TextEditingController();

        return AlertDialog(
          title: Text('Enter Marks for ${students[studentIndex].name}'),
          content: Column(
            children: [
              TextField(
                controller: test1Controller,
                decoration: InputDecoration(labelText: 'CIE 1 Marks'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: test2Controller,
                decoration: InputDecoration(labelText: 'CIE 2 Marks'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: test3Controller,
                decoration: InputDecoration(labelText: 'SEM Marks'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  marksData[studentIndex]['CIE1'] = int.tryParse(test1Controller.text) ?? 0;
                  marksData[studentIndex]['CIE2'] = int.tryParse(test2Controller.text) ?? 0;
                  marksData[studentIndex]['SEM'] = int.tryParse(test3Controller.text) ?? 0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Student {
  final int id;
  final String name;

  Student(this.id, this.name);
}