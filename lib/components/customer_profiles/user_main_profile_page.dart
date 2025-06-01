import 'package:business_app/main.dart';
import 'package:flutter/material.dart';

class UserMainProfilePage extends StatefulWidget {
  @override
  _UserMainProfilePageState createState() => _UserMainProfilePageState();
}

class _UserMainProfilePageState extends State<UserMainProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _profilePhotoAnimation;
  final double expandedHeight = 300;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _profilePhotoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: expandedHeight,
                pinned: true,
                floating: false,
                stretch: true,
                //backgroundColor: Colors.blue,
                // backgroundColor:
                //     Theme.of(context).brightness == Brightness.dark
                //         ? Colors.grey.withOpacity(0.6)
                //         : Colors.white.withOpacity(0.6),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back, //color: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search, // color: Colors.white
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert, //color: Colors.white
                    ),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    final percent =
                        ((constraints.maxHeight - kToolbarHeight) /
                            (expandedHeight - kToolbarHeight));
                    return FlexibleSpaceBar(
                      stretchModes: [StretchMode.zoomBackground],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1350&q=80',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 16,
                            bottom: 16,
                            child: Opacity(
                              opacity: percent.clamp(0.0, 1.0),
                              child: ScaleTransition(
                                scale: _profilePhotoAnimation,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                        'https://cdni.pornpics.com/1280/7/15/72115077/72115077_054_ff39.jpg',
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      children: [
                                        Text(
                                          "21,360,000",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.white,
                                          ),
                                        ),
                                        // SizedBox(width: 4),
                                        Text(
                                          "Likes",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: _buildProfileDetails()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    //labelColor: Colors.blue,
                    labelColor: Color(0xFF1DA1F2),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFF1DA1F2),
                    indicatorWeight: 5,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    tabs: const [
                      Tab(text: 'Products'),
                      Tab(text: 'Communities'),
                      Tab(text: 'Posts'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _buildTabContent('Products'),
              _buildTabContent('Communities'),
              _buildTabContent('Posts'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetails() {
    return FadeTransition(
      opacity: _profilePhotoAnimation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // <-- Add this line
                  children: [
                    Row(
                      children: [
                        Text(
                          'Blessings Rever Chilemba',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.verified, color: Colors.blue, size: 20),
                      ],
                    ),
                    Text(
                      '@rever_bc',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12),
            Text(
              'Ingeniero de sistemas de software ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),

            // Bio

            /// Edit Profile Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    //color: Colors.white
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Edit profile',
                  style: TextStyle(
                    //color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String tabName) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      physics: BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return FadeTransition(
          opacity: _profilePhotoAnimation,
          child: Card(
            child: ListTile(
              title: Text('$tabName Item $index'),
              subtitle: Text('This is a sample $tabName item.'),
            ),
          ),
        );
      },
    );
  }
}

/// For pinning the TabBar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      //color: Colors.transparent,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

// old code
// class UserMainProfilePage extends StatefulWidget {
//   const UserMainProfilePage({super.key});

//   @override
//   State<UserMainProfilePage> createState() => _UserMainProfilePageState();
// }

// class _UserMainProfilePageState extends State<UserMainProfilePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: NestedScrollView(
//         headerSliverBuilder:
//             (context, innerBoxIsScrolled) => [
//               SliverAppBar(
//                 expandedHeight: 200.0,
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: Colors.black,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.asset(Assets.newProfile, fit: BoxFit.cover),
//                       // Image.network(
//                       //   'https://via.placeholder.com/1500x500',
//                       //   fit: BoxFit.cover,
//                       // ),
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.black.withOpacity(0.5),
//                               Colors.transparent,
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 leading: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 actions: [
//                   IconButton(
//                     icon: const Icon(Icons.search, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.more_vert, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage: NetworkImage(
//                               'https://via.placeholder.com/150',
//                             ),
//                           ),
//                           Positioned(
//                             bottom: -10,
//                             right: -10,
//                             child: Container(
//                               padding: const EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: IconButton(
//                                 icon: const Icon(
//                                   Icons.edit,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                                 onPressed: () {},
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'John Doe',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const Text(
//                         '@johndoe',
//                         style: TextStyle(fontSize: 16, color: Colors.white70),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         'Passionate about tech and innovation. Building the future at TrademateAI.',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.location_on,
//                             color: Colors.white70,
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             'San Francisco, CA',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                           const SizedBox(width: 16),
//                           const Icon(
//                             Icons.link,
//                             color: Colors.white70,
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           GestureDetector(
//                             onTap: () {},
//                             child: const Text(
//                               'Trademate.ai',
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.calendar_today_outlined,
//                             color: Colors.white70,
//                             size: 16,
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             'Joined June 2025',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           const SizedBox(width: 16),
//                           const Icon(
//                             Icons.phone,
//                             color: Colors.white70,
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           GestureDetector(
//                             onTap: () {},
//                             child: const Text(
//                               '098-765-4321',
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ],
//                       ),
//                       /////////
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Text(
//                             '100',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             'Following',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                           const SizedBox(width: 16),
//                           const Text(
//                             '1.2K',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             'Followers',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: double.infinity,
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           style: OutlinedButton.styleFrom(
//                             side: const BorderSide(color: Colors.white),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: const Text(
//                             'Edit profile',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate: _SliverAppBarDelegate(
//                   TabBar(
//                     controller: _tabController,
//                     labelColor: Colors.white,
//                     unselectedLabelColor: Colors.white70,
//                     indicatorColor: Colors.blue,
//                     tabs: const [
//                       Tab(text: 'Posts'),
//                       Tab(text: 'Replies'),
//                       Tab(text: 'Highlights'),
//                       Tab(text: 'Media'),
//                       Tab(text: 'Likes'),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             _buildPostList('Post'),
//             _buildTabPlaceholder('Replies Tab'),
//             _buildTabPlaceholder('Highlights Tab'),
//             _buildTabPlaceholder('Media Tab'),
//             _buildTabPlaceholder('Likes Tab'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPostList(String label) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder:
//           (context, index) => ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: NetworkImage('https://via.placeholder.com/50'),
//             ),
//             title: const Text(
//               'John Doe',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   '@johndoe · 1h',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 Text(
//                   'This is a sample $label #$index',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//     );
//   }

//   Widget _buildTabPlaceholder(String label) {
//     return Center(
//       child: Text(label, style: const TextStyle(color: Colors.white)),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Container(color: Colors.black, child: _tabBar);
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
// }
