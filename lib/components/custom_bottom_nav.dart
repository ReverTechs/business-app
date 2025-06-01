import 'package:business_app/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool hasNewAlerts;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.hasNewAlerts = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black.withOpacity(0.88)
                  : Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5),
        ),
        child: GNav(
          iconSize: 32,
          //color: Colors.white70,
          color: Colors.grey,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          activeColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: 14,
          ),
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 300),
          tabBackgroundColor: Colors.transparent,
          selectedIndex: currentIndex,
          onTabChange: onTap,
          tabs: [
            const GButton(icon: Icons.home_filled, text: ''),
            const GButton(icon: Icons.search, text: ''),
            const GButton(icon: Icons.add, text: ''),
            // const GButton(icon: Icons.message_outlined, text: ''),
            GButton(
              icon: Icons.message_outlined,
              text: '',
              leading: Builder(
                builder: (context) {
                  final isSelected =
                      currentIndex == 3; // 3 is the index of this tab
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.message_outlined,
                        size: 32,
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                      Positioned(
                        right: -8,
                        top: -10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '99+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            GButton(
              icon: Icons.star,
              text: '',
              gap: 4,
              leading: ClipOval(
                child: Image.asset(
                  Assets.trademateLogo,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//not accepting parameters, so no need to bottom nav
// import 'package:business_app/const/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({Key? key}) : super(key: key);

//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }

// class _CustomBottomBarState extends State<CustomBottomBar> {
//   int _selectedIndex = 0;
//   bool hasNewAlerts = true;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         width: double.infinity,
//         //height: 0.07 * MediaQuery.of(context).size.height,
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           //color: Colors.transparent,
//           color:
//               Theme.of(context).brightness == Brightness.dark
//                   ? Colors.black.withOpacity(0.88)
//                   : Colors.black.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: GNav(
//           iconSize: 32,
//           color: Colors.white70,
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             overflow: TextOverflow.ellipsis,
//           ),
//           activeColor: Colors.white,
//           padding: EdgeInsets.symmetric(
//             horizontal:
//                 MediaQuery.of(context).size.width * 0.02, // 2% of screen width
//             vertical: 14, // reduced vertical padding
//           ),
//           //padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
//           curve: Curves.easeOutExpo,
//           duration: const Duration(milliseconds: 300),
//           tabBackgroundColor: Colors.transparent,
//           // tabBorder: Border.all(color: Colors.white, width: 2), // White border
//           // tabActiveBorder: Border.all( color: Colors.white70,  width: 1.5, ), // Only active tab gets border
//           /*
//           working code
//           tabActiveBorder: Border.all(
//             color:
//                 Theme.of(context).brightness == Brightness.dark
//                     ? Colors.transparent
//                     : Colors.transparent,
//             width: 1.5,
//           ),
//           tabMargin: const EdgeInsets.symmetric(
//             vertical: 3,
//             horizontal: 2,
//           ), */
//           // Add space above and below
//           // tabBorderRadius: 30, // Optional: round the background
//           //tabMargin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4, ), // Add vertical padding
//           selectedIndex: _selectedIndex,
//           onTabChange: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           tabs: [
//             const GButton(icon: Icons.home_filled, text: ''),
//             const GButton(icon: Icons.search, text: ''),
//             const GButton(icon: Icons.add, text: ''),
//             const GButton(icon: Icons.person, text: ''),
//             /*   GButton(
//               icon: Icons.person,
//               text: 'New!',
//               leading: Stack(
//                 children: [
//                   const Icon(Icons.person, color: Colors.white70, size: 32),
//                   if (hasNewAlerts)
//                     Positioned(
//                       right: 0,
//                       top: 0,
//                       child: Container(
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white, width: 1.5),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),*/
//             GButton(
//               icon: Icons.star,
//               text: '',
//               gap: 4,
//               leading: ClipOval(
//                 child: Image.asset(
//                   Assets.trademateLogo,
//                   height: 28,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
