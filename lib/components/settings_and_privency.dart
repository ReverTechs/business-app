import 'package:business_app/components/theme_selection_dialog.dart';
import 'package:business_app/settings/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

// Import your components and dialogs
import 'package:business_app/components/settings_card.dart';
//import 'package:business_app/widgets/theme_selection_dialog.dart';
// You can create these pages later as needed
// import 'package:business_app/screens/language_settings_page.dart';
// import 'package:business_app/screens/privacy_checkup_page.dart';
// import 'package:business_app/screens/about_trademate_page.dart';
// etc.

class SettingsAndPrivency extends StatefulWidget {
  const SettingsAndPrivency({Key? key}) : super(key: key);

  @override
  _SettingsAndPrivencyState createState() => _SettingsAndPrivencyState();
}

class _SettingsAndPrivencyState extends State<SettingsAndPrivency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF18191A),
      appBar: AppBar(
        //backgroundColor: const Color(0xFF242526),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Settings & Privacy",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
              ),
            ),
            RiveAnimatedIcon(
              riveIcon: RiveIcon.search,
              width: 35,
              height: 35,
              strokeWidth: 2,
              color: Color(0xFF1DA1F2),
              //color: Colors.white,
              loopAnimation: false,
              onTap: () {
                // Handle search action
              },
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SettingsCard(), // Custom card widget for profile or info
          const SizedBox(height: 10),

          const Divider(
            // color: Colors.white54,
            thickness: 0.3,
            indent: 20.0,
            endIndent: 20.0,
          ),

          _buildSectionHeader('ACCOUNT'),

          _buildSettingItem(
            icon: Icons.key,
            title: 'Password and security',
            subtitle: 'Change password, 2FA, and alerts',
            onTap: () {
              // Navigate to password and security page
            },
          ),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Checkup',
            subtitle: 'Review key privacy settings',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyCheckupPage()));
            },
          ),
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: 'Privacy Shortcuts',
            subtitle: 'Manage your privacy',
            onTap: () {
              // Navigate to privacy shortcuts page
            },
          ),

          const Divider(
            //color: Colors.white54,
            thickness: 0.3,
            indent: 20.0,
            endIndent: 20.0,
          ),

          _buildSectionHeader('PREFERENCES'),

          _buildSettingItem(
            icon: Icons.color_lens,
            title: 'Appearance',
            subtitle: 'Manage App theme',
            onTap: () {
              // Show theme selection dialog
              // showDialog(
              //   context: context,
              //   builder: (_) => const ThemeSelectionDialog(),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ThemeSettings()),
              );
            },
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Language and Region',
            subtitle: 'Change language preferences',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => LanguageSettingsPage()));
            },
          ),

          _buildSettingItem(
            icon: Icons.notifications,
            title: 'Notification Settings',
            subtitle: 'Manage push notifications',
            onTap: () {
              // Navigate to notification settings
            },
          ),

          const Divider(
            // color: Colors.white54,
            thickness: 0.3,
            indent: 20.0,
            endIndent: 20.0,
          ),

          _buildSectionHeader('YOUR INFORMATION'),

          _buildSettingItem(
            icon: Icons.download,
            title: 'Download Your Information',
            subtitle: 'Get a copy of your Trademate data',
            onTap: () {
              // Navigate to download information page
            },
          ),
          _buildSettingItem(
            icon: Icons.delete_outline,
            title: 'Account Ownership and Control',
            subtitle: 'Memorialization settings, account deletion',
            onTap: () {
              // Navigate to account control page
            },
          ),

          const Divider(
            //color: Colors.white54,
            thickness: 0.3,
            indent: 20.0,
            endIndent: 20.0,
          ),

          _buildSectionHeader('ABOUT'),

          _buildSettingItem(
            icon: Icons.info_outline,
            title: 'About Trademate',
            subtitle: "Version",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => AboutTradematePage()));
            },
          ),

          _buildSectionHeader('LEGAL'),

          _buildSettingItem(
            icon: Icons.gavel_outlined,
            title: 'Terms & Policies',
            subtitle: 'Review legal info and terms',
            onTap: () {
              // Navigate to terms and policies
            },
          ),

          const SizedBox(height: 30),

          const Center(
            child: Text(
              'Trademate © 2025',
              style: TextStyle(/*color: Colors.white54,*/ fontSize: 12),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Section headers (like "ACCOUNT", "PREFERENCES")
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          //color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  /// A single setting item with icon, title, subtitle, and navigation support
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon /*color: Colors.white70*/),
      title: Text(
        title,
        style: const TextStyle(
          /*  color: Colors.white*/
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle,
                style: const TextStyle(/*color: Colors.white60*/ fontSize: 12),
              )
              : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        //color: Colors.white38,
        size: 16,
      ),
      onTap: onTap, // This makes the item navigable
    );
  }
}

//this file contains non navigation settings and privacy page
// import 'package:business_app/components/settings_card.dart';
// import 'package:flutter/material.dart';
// import 'package:rive_animated_icon/rive_animated_icon.dart';

// class SettingsAndPrivency extends StatefulWidget {
//   const SettingsAndPrivency({Key? key}) : super(key: key);

//   @override
//   _SettingsAndPrivencyState createState() => _SettingsAndPrivencyState();
// }

// class _SettingsAndPrivencyState extends State<SettingsAndPrivency> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF18191A),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF242526),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   "Settings & Privacy",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             RiveAnimatedIcon(
//               riveIcon: RiveIcon.search,
//               width: 35,
//               height: 35,
//               strokeWidth: 2,
//               color: Colors.white,
//               loopAnimation: false,
//               onTap: () {},
//             ),
//           ],
//         ),
//         // title: const Text(
//         //   'Settings & Privacy',
//         //   style: TextStyle(color: Colors.white),
//         // ),
//         // centerTitle: true,
//         // elevation: 0,
//       ),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           const SettingsCard(), // <-- Your Card at the top
//           const SizedBox(height: 10),
//           const Divider(
//             color: Colors.white54,
//             thickness: 0.3, //2.0,
//             indent: 20.0,
//             endIndent: 20.0,
//             //height: 30.0, // Includes the thickness and any extra padding
//           ),
//           _buildSectionHeader('ACCOUNT'),
//           _buildSettingItem(
//             icon: Icons.key,
//             title: 'Password and security',
//             subtitle: 'Change password, 2FA, and alerts',
//           ),
//           _buildSettingItem(
//             icon: Icons.privacy_tip_outlined,
//             title: 'Privacy Checkup',
//             subtitle: 'Review key privacy settings',
//           ),
//           _buildSettingItem(
//             icon: Icons.lock_outline,
//             title: 'Privacy Shortcuts',
//             subtitle: 'Manage your privacy',
//           ),
//           const Divider(
//             color: Colors.white54,
//             thickness: 0.3, //2.0,
//             indent: 20.0,
//             endIndent: 20.0,
//             //height: 30.0, // Includes the thickness and any extra padding
//           ),
//           _buildSectionHeader('PREFERENCES'),
//           _buildSettingItem(
//             icon: Icons.color_lens,
//             title: 'Appearance',
//             subtitle: 'Manage App themes',
//           ),
//           _buildSettingItem(
//             icon: Icons.language,
//             title: 'Language and Region',
//             subtitle: 'Change language preferences',
//           ),
//           _buildSettingItem(
//             icon: Icons.notifications,
//             title: 'Notification Settings',
//             subtitle: 'Manage push notifications',
//           ),
//           const Divider(
//             color: Colors.white54,
//             thickness: 0.3, //2.0,
//             indent: 20.0,
//             endIndent: 20.0,
//             //height: 30.0, // Includes the thickness and any extra padding
//           ),
//           _buildSectionHeader('YOUR INFORMATION'),
//           _buildSettingItem(
//             icon: Icons.download,
//             title: 'Download Your Information',
//             subtitle: 'Get a copy of your Trademate data',
//           ),
//           _buildSettingItem(
//             icon: Icons.delete_outline,
//             title: 'Account Ownership and Control',
//             subtitle: 'Memorialization settings, account deletion',
//           ),
//           const Divider(
//             color: Colors.white54,
//             thickness: 0.3, //2.0,
//             indent: 20.0,
//             endIndent: 20.0,
//             //height: 30.0, // Includes the thickness and any extra padding
//           ),
//           _buildSectionHeader('ABOUT'),
//           _buildSettingItem(
//             icon: Icons.info_outline,
//             title: 'About Trademate',
//             subtitle: "Learn about Trademate's mission and policies",
//           ),

//           _buildSectionHeader('LEGAL'),
//           _buildSettingItem(
//             icon: Icons.gavel_outlined,
//             title: 'Terms & Policies',
//             subtitle: 'Review legal info and terms',
//           ),
//           const SizedBox(height: 30),
//           const Center(
//             child: Text(
//               'Trademate © 2025',
//               style: TextStyle(color: Colors.white54, fontSize: 12),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
//       child: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white70,
//           fontWeight: FontWeight.bold,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingItem({
//     required IconData icon,
//     required String title,
//     String? subtitle,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white70),
//       title: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle:
//           subtitle != null
//               ? Text(
//                 subtitle,
//                 style: const TextStyle(color: Colors.white60, fontSize: 12),
//               )
//               : null,
//       trailing: const Icon(
//         Icons.arrow_forward_ios,
//         color: Colors.white38,
//         size: 16,
//       ),
//       onTap: () {
//         // Navigation or action can be implemented here
//       },
//     );
//   }
// }
