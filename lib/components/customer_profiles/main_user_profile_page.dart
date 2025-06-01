import 'package:business_app/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainUserProfilePage extends StatelessWidget {
  const MainUserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 100,
                elevation: 0,
                // backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(Assets.newProfile, fit: BoxFit.cover),
                      Positioned(
                        bottom: -20,
                        left: 16,
                        child: Hero(
                          tag: 'profile-picture',
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                  child: _buildProfileInfo(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    tabs: const [
                      Tab(text: 'Tweets'),
                      Tab(text: 'Replies'),
                      Tab(text: 'Media'),
                      Tab(text: 'Likes'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [_TweetTab(), _RepliesTab(), _MediaTab(), _LikesTab()],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jane Doe',
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          '@janedoe',
          style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 12),
        Text(
          'Flutter Developer • Coffee Lover • Open Source Enthusiast',
          style: GoogleFonts.roboto(fontSize: 14),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text('San Francisco, CA', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 12),
            Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
            SizedBox(width: 4),
            Text('Joined June 2019', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              '512 ',
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
            Text(
              'Following',
              style: GoogleFonts.roboto(color: Colors.grey[700]),
            ),
            const SizedBox(width: 16),
            Text(
              '3,200 ',
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
            ),
            Text(
              'Followers',
              style: GoogleFonts.roboto(color: Colors.grey[700]),
            ),
          ],
        ),
      ],
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

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
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}

// ------------------ Tabs Content ----------------------

class _TweetTab extends StatelessWidget {
  const _TweetTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) => _tweetCard('This is tweet #$index'),
    );
  }
}

class _RepliesTab extends StatelessWidget {
  const _RepliesTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder:
          (context, index) => _tweetCard('Reply to @user: Great point!'),
    );
  }
}

class _MediaTab extends StatelessWidget {
  const _MediaTab();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder:
          (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: 'https://via.placeholder.com/150?media=$index',
              fit: BoxFit.cover,
            ),
          ),
    );
  }
}

class _LikesTab extends StatelessWidget {
  const _LikesTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) => _tweetCard('Liked tweet #$index'),
    );
  }
}

Widget _tweetCard(String content) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/50'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jane Doe @janedoe · 1h',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: GoogleFonts.roboto(fontSize: 15, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// facebook_clone
// import 'package:business_app/const/assets.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MainUserProfilePage extends StatelessWidget {
//   const MainUserProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 expandedHeight: 300,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Stack(
//                     fit: StackFit.expand,
//                     children: [
//                       Image.asset(Assets.newProfile, fit: BoxFit.cover),
//                       // CachedNetworkImage(
//                       //   imageUrl:
//                       //       'https://via.placeholder.com/800x400', // Cover photo
//                       //   fit: BoxFit.cover,
//                       // ),
//                       Positioned(
//                         bottom: 0,
//                         left: 16,
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 50,
//                               backgroundImage: NetworkImage(
//                                 'https://via.placeholder.com/150',
//                               ), // Profile image
//                             ),
//                             const SizedBox(width: 16),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'John Doe',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'Software Developer at Meta',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: 14,
//                                     color: Colors.white70,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildProfileButton(Icons.person_add, 'Follow'),
//                       _buildProfileButton(Icons.message, 'Message'),
//                       _buildProfileButton(Icons.more_horiz, 'More'),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate: _TabBarDelegate(
//                   child: TabBar(
//                     labelColor: Colors.black,
//                     indicatorColor: Colors.blue,
//                     tabs: const [
//                       Tab(text: 'Posts'),
//                       Tab(text: 'About'),
//                       Tab(text: 'Friends'),
//                       Tab(text: 'Photos'),
//                       Tab(text: 'Videos'),
//                     ],
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: const TabBarView(
//             children: [
//               _PostsTab(),
//               _AboutTab(),
//               _FriendsTab(),
//               _PhotosTab(),
//               _VideosTab(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileButton(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.blue.shade50,
//           child: Icon(icon, color: Colors.blue),
//         ),
//         const SizedBox(height: 4),
//         Text(label, style: GoogleFonts.roboto(fontSize: 12)),
//       ],
//     );
//   }
// }

// class _TabBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar child;

//   _TabBarDelegate({required this.child});

//   @override
//   double get minExtent => child.preferredSize.height;
//   @override
//   double get maxExtent => child.preferredSize.height;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Container(color: Colors.white, child: child);
//   }

//   @override
//   bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
//     return false;
//   }
// }

// // ------------------------ Tab Content Widgets -------------------------

// class _PostsTab extends StatelessWidget {
//   const _PostsTab();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.only(bottom: 16),
//           elevation: 3,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Post Title $index',
//                   style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'This is the content of post number $index.',
//                   style: GoogleFonts.roboto(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _AboutTab extends StatelessWidget {
//   const _AboutTab();

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         _aboutRow('Work', 'Meta'),
//         _aboutRow('Education', 'Harvard University'),
//         _aboutRow('Lives in', 'San Francisco, CA'),
//         _aboutRow('From', 'New York, NY'),
//       ],
//     );
//   }

//   Widget _aboutRow(String label, String value) {
//     return ListTile(
//       leading: const Icon(Icons.info_outline),
//       title: Text(
//         label,
//         style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(value, style: GoogleFonts.roboto()),
//     );
//   }
// }

// class _FriendsTab extends StatelessWidget {
//   const _FriendsTab();

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 12,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         childAspectRatio: 0.8,
//       ),
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             CircleAvatar(
//               radius: 35,
//               backgroundImage: NetworkImage('https://via.placeholder.com/100'),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               'Friend ${index + 1}',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.roboto(fontSize: 12),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _PhotosTab extends StatelessWidget {
//   const _PhotosTab();

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 9,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8,
//         crossAxisSpacing: 8,
//       ),
//       itemBuilder: (context, index) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: CachedNetworkImage(
//             imageUrl: 'https://via.placeholder.com/150?img=$index',
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
// }

// class _VideosTab extends StatelessWidget {
//   const _VideosTab();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Videos tab coming soon!',
//         style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey),
//       ),
//     );
//   }
// }
