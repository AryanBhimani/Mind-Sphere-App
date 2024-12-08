import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userID = FirebaseAuth.instance.currentUser?.uid ?? ''; // Get current user's ID
    if (userID.isEmpty) {
      return const Center(child: Text('User not logged in'));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(userID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No profile found.'));
          } else {
            var user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(user['profilePic'] ?? 'defaultImageUrl'),
                  ),
                  const SizedBox(height: 20),
                  itemProfile('Name', user['name'] ?? 'N/A', Icons.person),
                  const SizedBox(height: 10),
                  itemProfile('Phone', user['phone'] ?? 'N/A', Icons.phone),
                  const SizedBox(height: 10),
                  itemProfile('Address', user['address'] ?? 'No address provided', Icons.location_on),
                  const SizedBox(height: 10),
                  itemProfile('Email', user['email'] ?? 'No email provided', Icons.email),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement edit profile logic here
                      },
                      child: const Text('Edit Profile'),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
