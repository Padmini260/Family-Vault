import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Documents"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Upload a new document from the Home screen."),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search documents...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  documentCard(
                    context,
                    Icons.badge,
                    Colors.blue,
                    "Aadhaar Card",
                    "Identity Document",
                    "20 July 2026",
                  ),

                  const SizedBox(height: 12),

                  documentCard(
                    context,
                    Icons.picture_as_pdf,
                    Colors.red,
                    "PAN Card",
                    "Financial Document",
                    "18 July 2026",
                  ),

                  const SizedBox(height: 12),

                  documentCard(
                    context,
                    Icons.book,
                    Colors.orange,
                    "Passport",
                    "Travel Document",
                    "15 July 2026",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget documentCard(
    BuildContext context,
    IconData icon,
    Color color,
    String title,
    String category,
    String date,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(category),
                  Text(
                    "Uploaded: $date",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            PopupMenuButton<String>(
              onSelected: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$value selected for $title"),
                  ),
                );
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: "View",
                  child: Text("View"),
                ),
                PopupMenuItem(
                  value: "Download",
                  child: Text("Download"),
                ),
                PopupMenuItem(
                  value: "Delete",
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}