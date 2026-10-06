import 'package:flutter/material.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Members"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.person_add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Member feature coming soon."),
            ),
          );
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          memberCard(
            context,
            "John Smith",
            "Father",
            "Owner",
            "9876543210",
            "john@familyvault.com",
            Colors.blue,
          ),

          const SizedBox(height: 15),

          memberCard(
            context,
            "Mary Smith",
            "Mother",
            "Editor",
            "9876543211",
            "mary@familyvault.com",
            Colors.green,
          ),

          const SizedBox(height: 15),

          memberCard(
            context,
            "Sarah Smith",
            "Daughter",
            "Viewer",
            "9876543212",
            "emma@familyvault.com",
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget memberCard(
    BuildContext context,
    String name,
    String relation,
    String role,
    String phone,
    String email,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: color.withOpacity(0.2),
                  child: Icon(
                    Icons.person,
                    color: color,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(relation),
                    ],
                  ),
                ),

                Chip(
                  label: Text(role),
                  backgroundColor: color.withOpacity(0.2),
                ),
              ],
            ),

            const Divider(height: 25),

            Row(
              children: [
                const Icon(Icons.phone, color: Colors.blue),
                const SizedBox(width: 10),
                Text(phone),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.email, color: Colors.red),
                const SizedBox(width: 10),
                Expanded(child: Text(email)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}