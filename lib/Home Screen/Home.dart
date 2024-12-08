import 'package:flutter/material.dart';
import 'package:mindsphere/Home%20Screen/Ai%20Screen/AI.dart';
import 'package:mindsphere/Home%20Screen/Contact%20List/ContactList.dart';
import 'package:mindsphere/Home%20Screen/Healthcare%20Instruction%20Screen/Healthcare_Instruction.dart';
import 'package:mindsphere/Home%20Screen/Profile%20Screen/profile.dart';
import 'package:mindsphere/Sign%20in%20Screen/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> healthcareImages = [
    {"image": "assets/Onboarding.jpg", "title": "Mental Health Awareness"},
    {"image": "assets/Onboarding2.jpg", "title": "Nutrition Tips for a Healthy Life"},
    {"image": "assets/Onboarding3.jpg", "title": "Yoga and Meditation for Relaxation"},
    {"image": "assets/healthcare4.jpg", "title": "Importance of Regular Exercise"},
    // Add more healthcare inspiration images here
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 50,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Mind Sphere"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Header Section
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Find Your',
                        style: TextStyle(color: Colors.black87, fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Healthcare Inspiration',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Healthcare Inspiration Images Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Healthcare Inspiration',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ListView of Healthcare Inspiration Images
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: healthcareImages.length,
                          itemBuilder: (context, index) {
                            final item = healthcareImages[index];
                            return healthcareCard(item['image']!, item['title']!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                // Promo Today Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Promo Today',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            promoCard('assets/one.jpg'),
                            promoCard('assets/two.jpg'),
                            promoCard('assets/three.jpg'),
                            promoCard('assets/four.jpg'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/three.jpg')),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                stops: [
                                  0.3,
                                  0.9
                                ],
                                colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.2)
                                ]),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Best Design',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Mind Sphere",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Contact Nearby Doctros'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactList()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text('Healthcare Instruction'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Healthcare()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text('AI Chat'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const textOnly()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Promo Card Widget
  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1)
                  ])),
        ),
      ),
    );
  }

  // Healthcare Image Card Widget
  Widget healthcareCard(String image, String title) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1)
                  ])),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
