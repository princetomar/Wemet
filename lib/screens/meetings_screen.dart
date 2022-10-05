import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wemet2/resources/jitsi_meet_methods.dart';
import 'package:wemet2/widgets/home_meeting_button.dart';

class MeetingsScreen extends StatefulWidget {
  const MeetingsScreen({super.key});

  @override
  State<MeetingsScreen> createState() => _MeetingsScreenState();
}

class _MeetingsScreenState extends State<MeetingsScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onPressed: createMeeting,
            icon: Icons.videocam,
            data: "New Meeting",
          ),
          HomeMeetingButton(
            onPressed: () => joinMeeting(context),
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
