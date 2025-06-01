import 'package:business_app/components/user_profiles/profile_page.dart';
import 'package:business_app/components/experimental_ui/imessage_ui.dart';
import 'package:business_app/components/settings_and_privency.dart';
import 'package:business_app/components/customer_profiles/main_user_profile_page.dart';
import 'package:business_app/components/customer_profiles/user_main_profile_page.dart';
import 'package:business_app/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class CustomAdvancedDrawer extends StatelessWidget {
  final AdvancedDrawerController controller;
  final Widget child;

  const CustomAdvancedDrawer({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: controller,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      backdrop: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.black.withOpacity(0.8),
        //       Colors.black.withOpacity(0.6),
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
      ),
      childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: child,
      drawer: SafeArea(
        child: ListTileTheme(
          // textColor: Colors.white,
          // iconColor: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24.0),
                      // ...existing code...
                      InkWell(
                        onTap: () {
                          // Replace with your navigation logic
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserMainProfilePage(),
                              //MainUserProfilePage(),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(
                          30,
                        ), // Optional: for ripple effect
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(Assets.newProfile),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '꧁ŔEVER ⚘BC𓃵🛠️',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '@software_engineer',
                                    style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                            //Icon(Icons.more_vert_rounded),
                          ],
                        ),
                      ),
                      // ...existing code...
                      // Profile Image and Name not navigation
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       width: 60,
                      //       height: 60,
                      //       clipBehavior: Clip.antiAlias,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black26,
                      //         shape: BoxShape.circle,
                      //       ),
                      //       child: Image.asset(Assets.newProfile),
                      //     ),
                      //     const SizedBox(width: 16.0),
                      //     Expanded(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: const [
                      //           Text(
                      //             '꧁ŔEVER ⚘BC𓃵🛠️😊🛠️',
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //               overflow: TextOverflow.ellipsis,
                      //               //color: Colors.white,
                      //             ),
                      //           ),
                      //           Text(
                      //             '@software_engineer',
                      //             style: TextStyle(
                      //               fontSize: 14,
                      //               // color: Colors.white70,
                      //               overflow: TextOverflow.ellipsis,
                      //             ),
                      //           ),
                      //           SizedBox(height: 8.0),
                      //         ],
                      //       ),
                      //     ),
                      //     Icon(
                      //       Icons.more_vert_rounded,
                      //       // color: Colors.white70,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 16.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            Text(
                              '56,7M',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(' Customers'),
                            SizedBox(width: 16.0),
                            Text(
                              '100',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(' Following'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 60.0),
                      const Divider(
                        // color: Colors.white54,
                        thickness: 0.3,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),

                      //rive icon test
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ), // Replace with your target screen
                          );
                        },
                        leading: RiveAnimatedIcon(
                          riveIcon: RiveIcon.profile,
                          width: 40,
                          height: 40,
                          strokeWidth: 3,
                          color: Color(0xFF1DA1F2),
                          // color: Colors.white, // Adjust color as needed
                          loopAnimation: false,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ), // Replace with your target screen
                            );
                          }, // Optional: Keep this if you want additional behavior
                          onHover: (value) {},
                        ),
                        title: const Text(
                          'Profile', // Title for the icon
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1DA1F2),
                            //color: Colors.white, // Adjust color as needed
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(),
                            ), // Replace with your target screen
                          );
                        },
                        leading: RiveAnimatedIcon(
                          //riveIcon: RiveIcon.sliderHorizontal,
                          riveIcon: RiveIcon.message,
                          width: 40,
                          height: 40,
                          strokeWidth: 3,
                          // color: Colors.white70, // Adjust color as needed
                          color: Color(0xFF1DA1F2),
                          loopAnimation: false,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ), // Replace with your target screen
                            );
                          }, // Optional: Keep this if you want additional behavior
                          onHover: (value) {},
                        ),
                        title: const Text(
                          'Message', // Title for the icon
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //color: Colors.white, // Adjust color as needed
                            color: Color(0xFF1DA1F2),
                          ),
                        ),
                      ),
                      ListTile(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ProfilePage(),
                        //     ), // Replace with your target screen
                        //   );
                        // },
                        leading: RiveAnimatedIcon(
                          riveIcon: RiveIcon.diamond,
                          width: 40,
                          height: 40,
                          strokeWidth: 3,
                          //color: Colors.white, // Adjust color as needed
                          color: Color(0xFF1DA1F2),
                          loopAnimation: false,
                          onTap:
                              () {}, // Optional: Keep this if you want additional behavior
                          onHover: (value) {},
                        ),
                        title: const Text(
                          'Premium', // Title for the icon
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(
                              0xFF1DA1F2,
                            ), // color: Colors.white, // Adjust color as needed
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          // Navigate to the desired screen or perform an action
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
                          // );
                        },
                        leading: RiveAnimatedIcon(
                          riveIcon: RiveIcon.star,
                          width: 40,
                          height: 40,
                          strokeWidth: 3,
                          color: Color(0xFF1DA1F2),
                          //color: Colors.white, // Adjust color as needed
                          loopAnimation: false,
                          onTap:
                              () {}, // Optional: Keep this if you want additional behavior
                          onHover: (value) {},
                        ),
                        title: const Text(
                          "What's new", // Title for the icon
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1DA1F2),
                            //color: Colors.white, // Adjust color as needed
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsAndPrivency(),
                            ), // Replace with your target screen
                          );
                        },
                        leading: RiveAnimatedIcon(
                          riveIcon: RiveIcon.settings,
                          width: 40,
                          height: 40,
                          strokeWidth: 3,
                          //color: Colors.white,
                          color: Color(0xFF1DA1F2),
                          loopAnimation: false,
                          onTap:
                              () {}, // Optional: Keep this if you want additional behavior
                          onHover: (value) {},
                        ),
                        title: const Text(
                          'Settings', // Title for the icon
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //color: Colors.white, // Adjust color as needed
                            color: Color(0xFF1DA1F2),
                          ),
                        ),
                      ),
                      const Divider(
                        //color: Colors.white54,
                        thickness: 0.3,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      //rive icon test end
                      // const Divider(
                      //   color: Colors.white54,
                      //   thickness: 1.0,
                      //   indent: 4.0,
                      //   endIndent: 4.0,
                      //   height: 30.0,
                      // ),
                    ],
                  ),
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(fontSize: 12 /*color: Colors.white54*/),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerItem(String title, RiveIcon icon) {
    return ListTile(
      onTap: () {},
      leading: RiveAnimatedIcon(
        riveIcon: icon,
        width: 40,
        height: 40,
        strokeWidth: 3,
        color: Color(0xFF1DA1F2),
        //color: Colors.white70,
        loopAnimation: false,
        onTap: () {},
        onHover: (value) {},
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //  color: Colors.white,
          color: Color(0xFF1DA1F2),
        ),
      ),
    );
  }
}

//----no smooth scrolling
// import 'package:business_app/const/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:rive_animated_icon/rive_animated_icon.dart';

// class CustomAdvancedDrawer extends StatelessWidget {
//   final AdvancedDrawerController controller;
//   final Widget child;

//   const CustomAdvancedDrawer({
//     Key? key,
//     required this.controller,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AdvancedDrawer(
//       controller: controller,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       backdrop: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             //colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
//             colors: [
//               Colors.black.withOpacity(0.8),
//               Colors.black.withOpacity(0.6),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//       ),
//       childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
//       child: child,
//       drawer: SafeArea(
//         child: Container(
//           child: ListTileTheme(
//             textColor: Colors.white,
//             iconColor: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(
//                     top: 24.0,
//                     bottom: 16, //64.0,
//                     left: 16.0,
//                     right: 16.0,
//                   ), // Added left and right margins
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // Profile Image
//                       Container(
//                         width: 60,
//                         height: 60,
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           color: Colors.black26,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(Assets.newProfile),
//                       ),
//                       const SizedBox(
//                         width: 16.0,
//                       ), // Spacing between image and text
//                       // Texts in a Column
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               '꧁ŔEVER ⚘BC𓃵🛠️', // Replace with the desired name
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const Text(
//                               '@software_engineer', // Replace with the desired role
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white70,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 8.0,
//                             ), // Spacing between the role and the row
//                           ],
//                         ),
//                       ),
//                       // More Icon
//                       // Icon(Icons.more_horiz, color: Colors.white70),
//                       RiveAnimatedIcon(
//                         riveIcon:
//                             RiveIcon.globe, // Replace with a vertical dots icon
//                         width: 24, // Adjust the size as needed
//                         height: 24,
//                         strokeWidth: 2,
//                         color:
//                             Colors
//                                 .white70, // Match the color of the previous icon
//                         loopAnimation:
//                             false, // Set to true if you want continuous animation
//                         onTap: () {
//                           // Optional: Add functionality when the icon is tapped
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                     left: 16.0,
//                     right: 16.0,
//                   ), // Match alignment with other widgets
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Text(
//                         '635K', // Replace with desired text
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         ' Customers', // Replace with desired text
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),

//                       SizedBox(width: 16.0), // Spacing between the texts
//                       Text(
//                         '0', // Replace with desired text
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         ' Following', // Replace with desired text
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Uncomment this if you want to add a profile image and name at the top of the drawer
//                 // Container(
//                 //   margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
//                 //   child: Column(
//                 //     children: [
//                 //       Container(
//                 //         width: 70, //128.0,
//                 //         height: 70, //128.0,
//                 //         clipBehavior: Clip.antiAlias,
//                 //         decoration: BoxDecoration(
//                 //           color: Colors.black26,
//                 //           shape: BoxShape.circle,
//                 //         ),
//                 //         child: Image.asset(Assets.newProfile),
//                 //       ),
//                 //       const SizedBox(
//                 //         height: 8.0,
//                 //       ), // Spacing between the image and text
//                 //       const Text(
//                 //         'John Doe', // Replace with the desired name
//                 //         style: TextStyle(
//                 //           fontSize: 16,
//                 //           fontWeight: FontWeight.bold,
//                 //           color: Colors.white,
//                 //         ),
//                 //       ),
//                 //       const Text(
//                 //         'Software Engineer', // Replace with the desired role
//                 //         style: TextStyle(fontSize: 14, color: Colors.white70),
//                 //       ),
//                 //       const SizedBox(
//                 //         height: 16.0,
//                 //       ), // Spacing between the column and row
//                 //       Row(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         children: [
//                 //           const Text(
//                 //             'Followers: 1.2K', // Replace with desired text
//                 //             style: TextStyle(
//                 //               fontSize: 14,
//                 //               color: Colors.white70,
//                 //             ),
//                 //           ),
//                 //           const SizedBox(
//                 //             width: 16.0,
//                 //           ), // Spacing between the texts
//                 //           const Text(
//                 //             'Following: 500', // Replace with desired text
//                 //             style: TextStyle(
//                 //               fontSize: 14,
//                 //               color: Colors.white70,
//                 //             ),
//                 //           ),
//                 //           const SizedBox(
//                 //             width: 16.0,
//                 //           ), // Spacing before the icon
//                 //           Icon(Icons.more_horiz, color: Colors.white70),
//                 //         ],
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 const SizedBox(height: 60.0),
//                 //this is the initial profile image and name
//                 // Container(
//                 //   width: 70, //128.0,
//                 //   height: 70, //128.0,
//                 //   margin: const EdgeInsets.only(top: 24.0, bottom: 64.0),
//                 //   clipBehavior: Clip.antiAlias,
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.black26,
//                 //     shape: BoxShape.circle,
//                 //   ),
//                 //   child: Image.asset(Assets.newProfile),
//                 // ),
//                 const Divider(
//                   //color: Colors.white70,
//                   color: Colors.white54,
//                   thickness: 1.0,
//                   indent: 20.0,
//                   endIndent: 20.0,
//                   height: 30.0, // Includes the thickness and any extra padding
//                 ),
//                 //rive icon test
//                 ListTile(
//                   onTap: () {
//                     // Navigate to the desired screen or perform an action
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
//                     // );
//                   },
//                   leading: RiveAnimatedIcon(
//                     riveIcon: RiveIcon.home,
//                     width: 40,
//                     height: 40,
//                     strokeWidth: 3,
//                     color: Colors.white70, // Adjust color as needed
//                     loopAnimation: false,
//                     onTap:
//                         () {}, // Optional: Keep this if you want additional behavior
//                     onHover: (value) {},
//                   ),
//                   title: const Text(
//                     'Home', // Title for the icon
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Adjust color as needed
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     // Navigate to the desired screen or perform an action
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
//                     // );
//                   },
//                   leading: RiveAnimatedIcon(
//                     riveIcon: RiveIcon.profile,
//                     width: 40,
//                     height: 40,
//                     strokeWidth: 3,
//                     color: Colors.white, // Adjust color as needed
//                     loopAnimation: false,
//                     onTap:
//                         () {}, // Optional: Keep this if you want additional behavior
//                     onHover: (value) {},
//                   ),
//                   title: const Text(
//                     'Profile', // Title for the icon
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Adjust color as needed
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     // Navigate to the desired screen or perform an action
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
//                     // );
//                   },
//                   leading: RiveAnimatedIcon(
//                     riveIcon: RiveIcon.diamond,
//                     width: 40,
//                     height: 40,
//                     strokeWidth: 3,
//                     color: Colors.white, // Adjust color as needed
//                     loopAnimation: false,
//                     onTap:
//                         () {}, // Optional: Keep this if you want additional behavior
//                     onHover: (value) {},
//                   ),
//                   title: const Text(
//                     'Premium', // Title for the icon
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Adjust color as needed
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     // Navigate to the desired screen or perform an action
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
//                     // );
//                   },
//                   leading: RiveAnimatedIcon(
//                     riveIcon: RiveIcon.star,
//                     width: 40,
//                     height: 40,
//                     strokeWidth: 3,
//                     color: Colors.white, // Adjust color as needed
//                     loopAnimation: false,
//                     onTap:
//                         () {}, // Optional: Keep this if you want additional behavior
//                     onHover: (value) {},
//                   ),
//                   title: const Text(
//                     "What's new", // Title for the icon
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Adjust color as needed
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     // Navigate to the desired screen or perform an action
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => YourTargetScreen()), // Replace with your target screen
//                     // );
//                   },
//                   leading: RiveAnimatedIcon(
//                     riveIcon: RiveIcon.settings,
//                     width: 40,
//                     height: 40,
//                     strokeWidth: 3,
//                     color: Colors.white,
//                     loopAnimation: false,
//                     onTap:
//                         () {}, // Optional: Keep this if you want additional behavior
//                     onHover: (value) {},
//                   ),
//                   title: const Text(
//                     'Settings', // Title for the icon
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white, // Adjust color as needed
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.white54,
//                   thickness: 1.0, //2.0,
//                   indent: 20.0,
//                   endIndent: 20.0,
//                   height: 30.0, // Includes the thickness and any extra padding
//                 ),
//                 //rive icon test end
//                 // ListTile(
//                 //   onTap: () {},
//                 //   leading: Icon(Icons.home),
//                 //   title: Text('Home'),
//                 // ),
//                 // ListTile(
//                 //   onTap: () {},
//                 //   leading: Icon(Icons.account_circle_rounded),
//                 //   title: Text('Profile'),
//                 // ),
//                 // ListTile(
//                 //   onTap: () {},
//                 //   leading: Icon(Icons.favorite),
//                 //   title: Text('Favourites'),
//                 // ),
//                 // ListTile(
//                 //   onTap: () {},
//                 //   leading: Icon(Icons.settings),
//                 //   title: Text('Settings'),
//                 // ),
//                 Spacer(),
//                 DefaultTextStyle(
//                   style: TextStyle(fontSize: 12, color: Colors.white54),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: Text('Terms of Service | Privacy Policy'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
