import 'package:flutter/material.dart';
import 'package:wemet2/resources/firestore_methods.dart';
import 'package:intl/intl.dart';

class HistoryMeetingsScreen extends StatefulWidget {
  const HistoryMeetingsScreen({super.key});

  @override
  State<HistoryMeetingsScreen> createState() => _HistoryMeetingsScreenState();
}

class _HistoryMeetingsScreenState extends State<HistoryMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return (snapshot.data! as dynamic).docs.length == null
              ? ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Text(
                          "Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}"),
                      subtitle: Text(
                        'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                      )))
              : Center(
                  child: Text(
                    "You haven't joined or Created any Wemet yet !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
        }
      }),
    );
  }
}
