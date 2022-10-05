import 'package:flutter/material.dart';
import 'package:wemet2/resources/auth_methods.dart';
import 'package:wemet2/screens/history_meetings_screen.dart';
import 'package:wemet2/screens/meetings_screen.dart';
import 'package:wemet2/utils/colors.dart';
import 'package:wemet2/widgets/custom_button.dart';
import 'package:wemet2/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingsScreen(),
    HistoryMeetingsScreen(),
    Center(
        child: Text(
      "Contacts will be displayed here",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    )),
    CustomButton(
      color: cyanBodyDarkColor,
      text: "Log Out",
      onPressed: () => AuthMethods().signOut(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("WEMET"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChanged,
        currentIndex: _page,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: "Meet & Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: "Meeting"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.percent_outlined,
              ),
              label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: "Settings"),
        ],
      ),
      body: pages[_page],
    );
  }
}

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.videocam,
            data: "New Meeting",
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.add_box_rounded,
            data: "Join Meeting",
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.calendar_today,
            data: "Schedule",
          ),
          HomeMeetingButton(
            onPressed: () {},
            icon: Icons.arrow_upward_rounded,
            data: "Share Screen",
          ),
        ],
      ),
      Expanded(
        child: Center(
          child: Text(
            "Create or Join Meetings with just one Click!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ]);
  }
}
