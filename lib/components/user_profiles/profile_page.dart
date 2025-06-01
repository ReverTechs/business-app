import 'package:business_app/components/customer_profiles/bottom_sheets/more_display.dart';
import 'package:business_app/components/user_profiles/components/pages/user_groups_page.dart';
import 'package:business_app/components/user_profiles/components/pages/user_posts_page.dart';
import 'package:business_app/components/user_profiles/components/pages/user_products.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _showNameInAppBar = false;

  final double profilePicRadius = 60.0;
  final double coverImageHeight = 200.0;
  final double profilePicOverlap = 30.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_showNameInAppBar) {
        setState(() {
          _showNameInAppBar = true;
        });
      } else if (_scrollController.offset <= 200 && _showNameInAppBar) {
        setState(() {
          _showNameInAppBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                actions: [
                  //without gradient
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.search, //color: Colors.white
                  //   ),
                  //   onPressed: () {},
                  // ),
                  SizedBox(width: 8),
                  //without gradient
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.1),
                        ],
                        stops: [0.4, 1.0],
                        center: Alignment.center,
                        radius: 1.0,
                      ),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      // size: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  //without gradient
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.1),
                        ],
                        stops: [0.4, 1.0],
                        center: Alignment.center,
                        radius: 1.0,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {
                        // Show the MoreAbout bottom sheet
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) => MoreAbout(),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  //without gradient
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.more_vert, //color: Colors.white
                  //   ),
                  //   onPressed: () {
                  //     // Show the MoreAbout bottom sheet
                  //     showModalBottomSheet(
                  //       context: context,
                  //       backgroundColor: Colors.transparent,
                  //       builder: (BuildContext context) => MoreAbout(),
                  //     );
                  //   },
                  // ),
                ],
                expandedHeight:
                    coverImageHeight + profilePicRadius - profilePicOverlap,
                title:
                    _showNameInAppBar
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Blessings Chilemba",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '816K',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text("Likes", style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        )
                        : null,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: coverImageHeight,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1350&q=80',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 0,
                        //ORIGINAL WIDGET
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: profilePicRadius,
                            backgroundImage: NetworkImage(
                              'https://cdni.pornpics.com/1280/1/367/25814960/25814960_003_bb2b.jpg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Insert card above tabs
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Blessings Chilemba',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    /* SizedBox(width: 12),
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.grey),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        backgroundColor: Colors.white
                                            .withOpacity(0.1),
                                      ),
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                                Text(
                                  '@rever_bc',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Things change when we change them ~(R),\niPhone 15 Pro Max & Samsung Galaxy S25 Ultra',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),

                          // SizedBox(width: 10),
                          // OutlinedButton(
                          //   onPressed: () {},
                          //   style: OutlinedButton.styleFrom(
                          //     side: BorderSide(color: Colors.grey),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     backgroundColor: Colors.white.withOpacity(0.1),
                          //   ),
                          //   child: Text(
                          //     'Follow',
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),

                      SizedBox(height: 8),

                      // Following and Customers
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    '200',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '56,4M',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Customers',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
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
                      /* Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 16,
                                          //color: Colors.blue,
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            'Call',
                                            style: TextStyle(
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        size: 16,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Like',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Open now',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),

              // Sticky tab bar
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    controller: _tabController,
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
                      Tab(text: 'Groups'),
                      Tab(text: 'Posts'),
                    ],
                  ),
                ),
              ),
            ],
        body: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: [
            //  _buildTabContent("Products"),
            //   _buildTabContent("Groups'),"),
            //   _buildTabContent("Posts" ),
            UserProducts(),
            UserGroupsPage(),
            UserPostsPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String label) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(title: Text('$label Item $index'));
      },
    );
  }
}

// Sticky TabBar delegate
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
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
