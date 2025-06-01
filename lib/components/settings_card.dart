import 'package:flutter/material.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key}) : super(key: key);

  @override
  _SettingsCardState createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // color: const Color(0xFF242526),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Manage your profile, security and preferences",
                style: TextStyle(fontSize: 14 /*color: Colors.grey*/),
              ),
              const SizedBox(height: 20),
              _buildCardRow("Personal Details", Icons.person),
              const SizedBox(height: 16),
              _buildCardRow("Password and Security", Icons.lock),
              const SizedBox(height: 16),
              _buildCardRow("Ad Preferences", Icons.ads_click),
              const SizedBox(height: 16),
              _buildCardRow("Verification", Icons.verified),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardRow(String title, IconData icon) {
    return InkWell(
      onTap: () {
        // TODO: Add navigation or action
        print('$title tapped');
      },
      child: Row(
        children: [
          Icon(
            icon, //color: Colors.white
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                //color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios, //color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
