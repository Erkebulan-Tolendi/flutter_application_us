import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: CourseListPage()
  ),
    Padding(
        padding: EdgeInsets.only(right: 20, left: 20), child: VideoListPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Free Courses',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_sharp),
              label: 'Video Courses',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue, // Color of selected icon
          unselectedItemColor: Colors.grey, // Color of unselected icons
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5,
        ),
      ),
    );
  }
}



class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free Courses'),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.blue,),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: courseImages.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(courseImages[index]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseTitles[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
     
    );
  }
}


final courseImages = [
  'assets/free1.png',
  'assets/free2.png',
  'assets/free3.png',
  'assets/free4.png',
  'assets/free5.png',
  
];

final courseTitles = [
  'Introduction',
  'SMM - Marketing in Social Media',
  'Machine Learning Basics',
  'Python Basics',
  'Math Basics',
  
];


class VideoListPage extends StatelessWidget {
  const VideoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Courses'),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: courseVideoImages.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(courseVideoImages[index]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseVideoTitles[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final courseVideoImages = [
  'assets/video1.png',
  'assets/video2.png',
  'assets/video3.png',
  'assets/video4.png',
  'assets/video5.png',
  'assets/video6.png',
];


final courseVideoTitles = [
  'Introduction',
  'SMM - Marketing in Social Media',
  'Machine Learning Basics',
  'Python Basics',
  'Math Basics',
  'Math Basics',
];

