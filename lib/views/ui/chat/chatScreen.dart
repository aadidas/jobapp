import 'package:flutter/material.dart';

import '../../commons/app_bar.dart';
import '../../commons/drawer/drawer_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            actions: [
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/random/300×300?man'),
                    radius: 15,
                  ),
                ),
              )
            ],
            title: 'Chat',
            child: const DrawerWidget(),
          )),
    );
  }
}
