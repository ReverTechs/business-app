import 'package:business_app/components/custom_advanced_drawer.dart';
import 'package:business_app/components/custom_bottom_nav.dart';
import 'package:business_app/components/user_profiles/components/bottom_bar_pages/craete_post.dart';
import 'package:business_app/components/user_profiles/components/bottom_bar_pages/messages_ui.dart';
import 'package:business_app/components/user_profiles/components/bottom_bar_pages/search_ui.dart';
import 'package:business_app/components/user_profiles/components/bottom_bar_pages/subscribe_ui.dart';
import 'package:business_app/components/user_profiles/customer_dashboard.dart';
import 'package:business_app/components/user_profiles/profile_page.dart';
import 'package:business_app/const/assets.dart';
import 'package:business_app/const/constant_texts.dart';
import 'package:business_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1DA1F2),
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'SF-Pro-Display',
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'SF-Pro-Display',
        ),
      ),
      themeMode:
          themeProvider.themeMode == AppThemeMode.system
              ? ThemeMode.system
              : (themeProvider.themeMode == AppThemeMode.light
                  ? ThemeMode.light
                  : ThemeMode.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _advancedDrawerController = AdvancedDrawerController();

  bool _isBottomBarVisible = true;
  final Duration _animationDuration = Duration(milliseconds: 300);

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  // List of pages for bottom navigation -----------
  List<Widget> get _pages => [
    // Home page with tabs
    NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is UserScrollNotification) {
          if (notification.direction == ScrollDirection.reverse &&
              _isBottomBarVisible) {
            setState(() => _isBottomBarVisible = false);
          } else if (notification.direction == ScrollDirection.forward &&
              !_isBottomBarVisible) {
            setState(() => _isBottomBarVisible = true);
          }
        }
        return false;
      },
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                snap: true,
                pinned: false,
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder:
                        (_, value, __) => AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child:
                              value.visible
                                  ? Icon(
                                    Icons.clear,
                                    key: ValueKey<bool>(value.visible),
                                  )
                                  : ClipOval(
                                    child: Image.asset(
                                      Assets.trademateLogo,
                                      key: ValueKey<bool>(value.visible),
                                      width: 30.0,
                                      height: 30.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                        ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Center(child: GoldText('Trademate'))),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Upgrade',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1DA1F2),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.verified,
                          size: 24,
                          color: Color(0xFF1DA1F2),
                        ),
                      ],
                    ),
                  ],
                ),
                bottom: TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF1DA1F2),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFF1DA1F2),
                  indicatorWeight: 4,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
                ),
              ),
            ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent('For You'),
            _buildTabContent('Following'),
          ],
        ),
      ),
    ),
    // Example: Search page
    SearchUi(
      onScrollBottomBarVisibility: (visible) {
        if (_isBottomBarVisible != visible) {
          setState(() => _isBottomBarVisible = visible);
        }
      },
    ),
    //Example: Create post page
    CreatePostPage(
      onScrollBottomBarVisibility: (visible) {
        if (_isBottomBarVisible != visible) {
          setState(() => _isBottomBarVisible = visible);
        }
      },
    ),

    // Example: Profile page
    MessagesUi(
      onScrollBottomBarVisibility: (visible) {
        if (_isBottomBarVisible != visible) {
          setState(() => _isBottomBarVisible = visible);
        }
      },
    ),
    //Example: premium page if unsubscribe
    SubscribeUi(
      onScrollBottomBarVisibility: (visible) {
        if (_isBottomBarVisible != visible) {
          setState(() => _isBottomBarVisible = visible);
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomAdvancedDrawer(
      controller: _advancedDrawerController,
      child: Scaffold(
        extendBody: true,
        body: _pages[_selectedIndex],
        bottomNavigationBar: AnimatedSlide(
          duration: _animationDuration,
          offset: _isBottomBarVisible ? Offset(0, 0) : Offset(0, 1),
          child: AnimatedOpacity(
            duration: _animationDuration,
            opacity: _isBottomBarVisible ? 1.0 : 0.0,
            child: CustomBottomBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: 100,
      itemBuilder:
          (context, index) => Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerDashboard(),
                              ),
                            ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'User $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '@user$index · ${index}h',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "This is a sample $title post.\nThis how the post is going to be looking like anytime from now onwards. Made by: Engineer, rever.DEV\n\nAny time from now I'm gonna buy iPhone 15 Pro Max and Samsung Galaxy S25 Ultra🛠😊",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.comment, size: 20, color: Colors.grey),
                      Icon(Icons.repeat, size: 20, color: Colors.grey),
                      Icon(Icons.favorite, size: 20, color: Colors.grey),
                      Icon(Icons.share, size: 20, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

//with scrollable bottom navigation bar

// import 'package:business_app/components/custom_advanced_drawer.dart';
// import 'package:business_app/components/custom_bottom_nav.dart';
// import 'package:business_app/components/user_profiles/customer_dashboard.dart';
// import 'package:business_app/const/assets.dart';
// import 'package:business_app/const/constant_texts.dart';
// import 'package:business_app/themes/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF1DA1F2),
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: ThemeData.light().textTheme.apply(
//           fontFamily: 'SF-Pro-Display',
//         ),
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         textTheme: ThemeData.dark().textTheme.apply(
//           fontFamily: 'SF-Pro-Display',
//         ),
//       ),
//       themeMode:
//           themeProvider.themeMode == AppThemeMode.system
//               ? ThemeMode.system
//               : (themeProvider.themeMode == AppThemeMode.light
//                   ? ThemeMode.light
//                   : ThemeMode.dark),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final _advancedDrawerController = AdvancedDrawerController();

//   bool _isBottomBarVisible = true;
//   final Duration _animationDuration = Duration(milliseconds: 300);

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _handleMenuButtonPressed() {
//     _advancedDrawerController.showDrawer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomAdvancedDrawer(
//       controller: _advancedDrawerController,
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           extendBody: true,
//           body: NotificationListener<ScrollNotification>(
//             onNotification: (ScrollNotification notification) {
//               if (notification is UserScrollNotification) {
//                 if (notification.direction == ScrollDirection.reverse &&
//                     _isBottomBarVisible) {
//                   setState(() => _isBottomBarVisible = false);
//                 } else if (notification.direction == ScrollDirection.forward &&
//                     !_isBottomBarVisible) {
//                   setState(() => _isBottomBarVisible = true);
//                 }
//               }
//               return false;
//             },
//             child: NestedScrollView(
//               physics: const BouncingScrollPhysics(),
//               headerSliverBuilder:
//                   (context, innerBoxIsScrolled) => [
//                     SliverAppBar(
//                       floating: true,
//                       snap: true,
//                       pinned: false,
//                       leading: IconButton(
//                         onPressed: _handleMenuButtonPressed,
//                         icon: ValueListenableBuilder<AdvancedDrawerValue>(
//                           valueListenable: _advancedDrawerController,
//                           builder:
//                               (_, value, __) => AnimatedSwitcher(
//                                 duration: Duration(milliseconds: 300),
//                                 child:
//                                     value.visible
//                                         ? Icon(
//                                           Icons.clear,
//                                           key: ValueKey<bool>(value.visible),
//                                         )
//                                         : ClipOval(
//                                           child: Image.asset(
//                                             Assets.trademateLogo,
//                                             key: ValueKey<bool>(value.visible),
//                                             width: 30.0,
//                                             height: 30.0,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                               ),
//                         ),
//                       ),
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(child: Center(child: GoldText('Trademate'))),
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 'Upgrade',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color(0xFF1DA1F2),
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Icon(
//                                 Icons.verified,
//                                 size: 24,
//                                 color: Color(0xFF1DA1F2),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       bottom: TabBar(
//                         controller: _tabController,
//                         labelColor: Color(0xFF1DA1F2),
//                         unselectedLabelColor: Colors.grey,
//                         indicatorColor: Color(0xFF1DA1F2),
//                         indicatorWeight: 4,
//                         labelStyle: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                         unselectedLabelStyle: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                         ),
//                         tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
//                       ),
//                     ),
//                   ],
//               body: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   _buildTabContent('For You'),
//                   _buildTabContent('Following'),
//                 ],
//               ),
//             ),
//           ),
//           bottomNavigationBar: AnimatedSlide(
//             duration: _animationDuration,
//             offset: _isBottomBarVisible ? Offset(0, 0) : Offset(0, 1),
//             child: AnimatedOpacity(
//               duration: _animationDuration,
//               opacity: _isBottomBarVisible ? 1.0 : 0.0,
//               child: CustomBottomBar(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(String title) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.only(top: 8),
//       itemCount: 100,
//       itemBuilder:
//           (context, index) => Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap:
//                             () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CustomerDashboard(),
//                               ),
//                             ),
//                         child: CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'User $index',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         '@user$index · ${index}h',
//                         style: TextStyle(color: Colors.grey, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "This is a sample $title post.\nThis how the post is going to be looking like anytime from now onwards. Made by: Engineer, rever.DEV\n\nAny time from now I'm gonna buy iPhone 15 Pro Max and Samsung Galaxy S25 Ultra🛠😊",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.comment, size: 20, color: Colors.grey),
//                       Icon(Icons.repeat, size: 20, color: Colors.grey),
//                       Icon(Icons.favorite, size: 20, color: Colors.grey),
//                       Icon(Icons.share, size: 20, color: Colors.grey),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//     );
//   }
// }

//good but without scrollable bottom navigation bar

// import 'package:business_app/components/custom_advanced_drawer.dart';
// import 'package:business_app/components/custom_bottom_nav.dart';
// import 'package:business_app/components/cutomer_profiles/customer_dashboard.dart';
// import 'package:business_app/const/assets.dart';
// import 'package:business_app/const/constant_texts.dart';
// import 'package:business_app/themes/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// //void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color(0xFF1DA1F2),
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: ThemeData.light().textTheme.apply(
//           fontFamily: 'SF-Pro-Display', // Set default font
//         ),
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         textTheme: ThemeData.dark().textTheme.apply(
//           fontFamily: 'SF-Pro-Display',
//         ),
//       ),
//       themeMode:
//           themeProvider.themeMode == AppThemeMode.system
//               ? ThemeMode.system
//               : (themeProvider.themeMode == AppThemeMode.light
//                   ? ThemeMode.light
//                   : ThemeMode.dark),
//       home: MyHomePage(),
//     );
//     /*return MaterialApp(
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData(
//    // primaryColor: Color(0xFF1DA1F2),
//     scaffoldBackgroundColor: Colors.white,
//     fontFamily: 'CustomFont', // Set default font
//   ),
//   darkTheme: ThemeData.dark().copyWith(
//     fontFamily: 'CustomFont',
//   ),
//   themeMode: themeProvider.themeMode == AppThemeMode.system
//       ? ThemeMode.system
//       : (themeProvider.themeMode == AppThemeMode.light
//           ? ThemeMode.light
//           : ThemeMode.dark),
//   home: MyHomePage(),
// ); */
//   }
// }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 2,
// //       child: Scaffold(
// //         body: NestedScrollView(
// //           physics: const BouncingScrollPhysics(),
// //           headerSliverBuilder:
// //               (context, innerBoxIsScrolled) => [
// //                 SliverAppBar(
// //                   floating: true,
// //                   snap: true,
// //                   pinned: false, // <- not pinned
// //                   backgroundColor: Colors.white,
// //                   title: Row(
// //                     children: [
// //                       Text(
// //                         'Upgrade',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w600,
// //                           color: Color(0xFF1DA1F2),
// //                         ),
// //                       ),
// //                       SizedBox(width: 8),
// //                       Icon(Icons.verified, size: 24, color: Color(0xFF1DA1F2)),
// //                     ],
// //                   ),
// //                   bottom: TabBar(
// //                     controller: _tabController,
// //                     labelColor: Color(0xFF1DA1F2),
// //                     unselectedLabelColor: Colors.grey,
// //                     indicatorColor: Color(0xFF1DA1F2),
// //                     indicatorWeight: 4,
// //                     labelStyle: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 16,
// //                     ),
// //                     unselectedLabelStyle: TextStyle(
// //                       fontWeight: FontWeight.normal,
// //                       fontSize: 16,
// //                     ),
// //                     tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
// //                   ),
// //                 ),
// //               ],
// //           body: TabBarView(
// //             controller: _tabController,
// //             children: [
// //               _buildTabContent('For You'),
// //               _buildTabContent('Following'),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTabContent(String title) {
// //     return ListView.builder(
// //       physics: const BouncingScrollPhysics(),
// //       padding: const EdgeInsets.only(top: 8),
// //       itemCount: 50,
// //       itemBuilder:
// //           (context, index) => Card(
// //             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: Padding(
// //               padding: EdgeInsets.all(16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       CircleAvatar(radius: 20),
// //                       SizedBox(width: 8),
// //                       Text(
// //                         'User $index',
// //                         style: TextStyle(fontWeight: FontWeight.bold),
// //                       ),
// //                       SizedBox(width: 8),
// //                       Text(
// //                         '@user$index · ${index}h',
// //                         style: TextStyle(color: Colors.grey),
// //                       ),
// //                     ],
// //                   ),
// //                   SizedBox(height: 8),
// //                   Text('This is a sample $title post.'),
// //                   SizedBox(height: 8),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Icon(Icons.comment, size: 20, color: Colors.grey),
// //                       Icon(Icons.repeat, size: 20, color: Colors.grey),
// //                       Icon(Icons.favorite_border, size: 20, color: Colors.grey),
// //                       Icon(Icons.share, size: 20, color: Colors.grey),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final _advancedDrawerController = AdvancedDrawerController();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _handleMenuButtonPressed() {
//     _advancedDrawerController.showDrawer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomAdvancedDrawer(
//       controller: _advancedDrawerController,
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           extendBody: true,
//           body: NestedScrollView(
//             physics: const BouncingScrollPhysics(),
//             headerSliverBuilder:
//                 (context, innerBoxIsScrolled) => [
//                   SliverAppBar(
//                     floating: true,
//                     snap: true,
//                     pinned: false,

//                     //backgroundColor: Colors.white,
//                     leading: IconButton(
//                       onPressed: _handleMenuButtonPressed,
//                       icon: ValueListenableBuilder<AdvancedDrawerValue>(
//                         valueListenable: _advancedDrawerController,
//                         builder: (_, value, __) {
//                           return AnimatedSwitcher(
//                             duration: Duration(milliseconds: 300),
//                             child:
//                                 value.visible
//                                     ? Icon(
//                                       Icons.clear,
//                                       key: ValueKey<bool>(value.visible),
//                                     )
//                                     : ClipOval(
//                                       child: Image.asset(
//                                         Assets
//                                             .trademateLogo, // Replace with your image path
//                                         key: ValueKey<bool>(value.visible),
//                                         width:
//                                             30.0, // Adjust the size as needed
//                                         height: 30.0,
//                                         fit:
//                                             BoxFit
//                                                 .cover, // Ensures the image fits within the circular shape
//                                       ),
//                                     ),
//                           );
//                         },
//                       ),
//                     ),
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(child: Center(child: GoldText('Trademate'))),
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Upgrade',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFF1DA1F2),
//                               ),
//                             ),
//                             SizedBox(width: 8),
//                             Icon(
//                               Icons.verified,
//                               size: 24,
//                               color: Color(0xFF1DA1F2),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     bottom: TabBar(
//                       controller: _tabController,
//                       labelColor: Color(0xFF1DA1F2),
//                       unselectedLabelColor: Colors.grey,
//                       indicatorColor: Color(0xFF1DA1F2),
//                       indicatorWeight: 4,
//                       labelStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                       unselectedLabelStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: 16,
//                       ),
//                       tabs: [Tab(text: 'For You'), Tab(text: 'Following')],
//                     ),
//                   ),
//                 ],
//             body: TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildTabContent('For You'),
//                 _buildTabContent('Following'),
//               ],
//             ),
//           ),
//           // bottomNavigationBar: Positioned(
//           //   bottom: 16,
//           //   left: 16,
//           //   right: 16,
//           //   child: CustomBottomBar(),
//           // ),
//           bottomNavigationBar: CustomBottomBar(),
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(String title) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.only(top: 8),
//       itemCount: 100,
//       itemBuilder:
//           (context, index) => Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CustomerDashboard(),
//                             ),
//                           );
//                         },
//                         child: CircleAvatar(
//                           radius: 20,
//                           backgroundColor: Colors.grey,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'User $index',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         '@user$index · ${index}h',
//                         style: TextStyle(color: Colors.grey, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "This is a sample $title post.\nThis how the post is going to be looking like anytime from now onwards. Made by: Engineer, rever.DEV\n\nAny time from now I'm gonna buy iPhone 15 Pro Max and Samsung Galaxy S25 Ultra🛠️😊",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.comment, size: 20, color: Colors.grey),
//                       Icon(Icons.repeat, size: 20, color: Colors.grey),
//                       Icon(Icons.favorite, size: 20, color: Colors.grey),
//                       Icon(Icons.share, size: 20, color: Colors.grey),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//     );
//   }
// }
//ends here
//................................................
// This is a basic Flutter application that demonstrates the use of the MaterialApp widget.
// import 'package:business_app/settings/theme_settings.dart';
// import 'package:business_app/themes/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

//     return MaterialApp(
//       title: 'Theme Settings Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeProvider.lightTheme,
//       darkTheme: ThemeProvider.darkTheme,
//       themeMode:
//           themeProvider.themeMode == AppThemeMode.system
//               ? ThemeMode.system
//               : (themeProvider.themeMode == AppThemeMode.light
//                   ? ThemeMode.light
//                   : ThemeMode.dark),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 floating: true,
//                 pinned: false,
//                 snap: true,
//                 title: const Text('Theme Demo'),
//                 bottom: const TabBar(
//                   tabs: [
//                     Tab(text: 'New'), // Tab with text "New"
//                     Tab(text: 'Following'), // Tab with text "Following"
//                   ],
//                 ),
//               ),
//             ];
//           },
//           body: TabBarView(
//             children: [
//               // First tab content
//               ListView.builder(
//                 itemCount: 50,
//                 itemBuilder: (context, index) {
//                   return ListTile(title: Text('New Item ${index + 1}'));
//                 },
//               ),
//               // Second tab content
//               ListView.builder(
//                 itemCount: 50,
//                 itemBuilder: (context, index) {
//                   return ListTile(title: Text('Following Item ${index + 1}'));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Theme Demo'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   'Current Theme',
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'This app demonstrates theme switching like DeepSeek Mobile',
//                 style: Theme.of(context).textTheme.bodyLarge,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//......................................................

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
