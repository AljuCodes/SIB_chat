import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.redAccent,
        secondaryHeaderColor: Colors.redAccent
      ),
      home: const TabBarExample(

      ),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIB General', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/home1.svg',
                      semanticsLabel: 'Your SVG Image',
                      // color: Colors.red, // Change the color
                      // width: 240.0,      // Set the width
                      width:MediaQuery.of(context).size.width ,     // Set the height
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton(onPressed: (){
                          // function goes here
                        }, child: Text("Statement")),
                        Spacer(),
                        ElevatedButton(onPressed: (){
                          // function goes here
                        }, child: Text("Balance")),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/home2.svg',
                      semanticsLabel: 'Your SVG Image',
                      // color: Colors.red, // Change the color
                      // width: 240.0,      // Set the width
                        width: MediaQuery.of(context).size.width * 1.3,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/IFSC.svg',
              semanticsLabel: 'Your SVG Image',
              // color: Colors.red, // Change the color
              // width: 240.0,      // Set the width
              height: 250.0,     // Set the height
            ),
          ),
          Center(
            child: Icon(Icons.document_scanner, size: 140,),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.redAccent,
    foregroundColor: Colors.white,
    onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => ChattingScreen()),
    );
    },
    tooltip: 'Increment',
    child: const Icon(Icons.message),
    ),
    bottomNavigationBar: TabBar(
      labelColor: Colors.redAccent,
      indicatorColor: Colors.white,
      controller: _tabController,

        tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.list_alt),
            text: "View IFSC",
          ),
          Tab(
            icon: Icon(Icons.document_scanner),
            text: "Scan and Pay",
          ),

        ],
      ),
    );
  }
  
}


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
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        children: [
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