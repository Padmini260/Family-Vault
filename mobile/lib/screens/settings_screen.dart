import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Account"),
            subtitle: const Text("Manage your account"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            subtitle: const Text("Manage notifications"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Privacy & Security"),
            subtitle: const Text("Manage security settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About FamilyVault"),
            subtitle: const Text("Version 1.0.0"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "FamilyVault",
                applicationVersion: "1.0.0",
                applicationLegalese:
                    "Secure Family Document Vault",
              );
            },
          ),

          const Divider(),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}