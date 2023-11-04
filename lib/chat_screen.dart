import 'package:flutter/material.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatting Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              // Add chat messages here
              reverse: true, // To make the chat messages start from the bottom
            ),
          ),
          _buildChatInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatInputArea() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: 'Type a message',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
          // Add other input options like attaching images, emojis, etc.
        ],
      ),
    );
  }
}
