import 'package:business_app/components/experimental_ui/imessage_ui.dart';
import 'package:business_app/components/customer_profiles/bottom_sheets/more_display.dart';
import 'package:business_app/components/customer_profiles/components/pages/groups_page.dart';
import 'package:business_app/components/customer_profiles/components/pages/posts_page.dart';
import 'package:business_app/components/customer_profiles/components/pages/products_page.dart';
import 'package:business_app/main.dart';
import 'package:flutter/material.dart';

class CustomerDashboard extends StatefulWidget {
  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard>
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
                //expandedHeight: expandedHeight,
                expandedHeight: 240,
                pinned: true,
                floating: false,
                stretch: true,
                //backgroundColor: Colors.blue,
                /*backgroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.withOpacity(0.6)
                        : Colors.white.withOpacity(0.6),*/
                //Color(0xFF1DA1F2),
                /*leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back, // color: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),*/
                leading: Row(
                  children: [
                    SizedBox(width: 16),
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
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                actions: [
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
                      Icons.notifications_off,
                      color: Colors.white,
                      // size: 20,
                    ),
                  ),
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
                      Icons.favorite,
                      color: Colors.red,
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
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    final percent =
                        ((constraints.maxHeight - kToolbarHeight) /
                            (expandedHeight - kToolbarHeight));
                    return FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://cdni.pornpics.com/1280/7/79/73647896/73647896_062_6e0d.jpg',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 16,
                            bottom: 16,
                            child: Opacity(
                              opacity: percent.clamp(0.0, 1.0),
                              child: ScaleTransition(
                                scale: _profilePhotoAnimation,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                            'https://cdni.pornpics.com/1280/7/725/40669812/40669812_034_2bed.jpg',
                                          ),
                                          backgroundColor: Colors.blue,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          children: [
                                            Text(
                                              "8.6M",
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
                                    //call and message buttons
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10),
                                          OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              backgroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.1),
                                              minimumSize: Size(
                                                120,
                                                40,
                                              ), // Width and height
                                            ),

                                            child: Row(
                                              children: [
                                                Icon(Icons.call, size: 20),
                                                SizedBox(width: 4),
                                                Text(
                                                  'Call',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 24),
                                          OutlinedButton(
                                            //onPressed: () {},
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => ChatScreen(),
                                                ),
                                              );
                                            },
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              backgroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.1),
                                              minimumSize: Size(
                                                120,
                                                40,
                                              ), // Width and height
                                            ),
                                            child: Text(
                                              'Message',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                      Tab(text: 'Groups'),
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
              // _buildTabContent('Products'),
              // _buildTabContent('Groups'),
              // _buildTabContent('Posts'),
              ProductsPage(),
              GroupsPage(),
              PostsPage(),
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
                              'Christina Lungu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.verified, color: Colors.blue, size: 20),
                        ],
                      ),
                      Text(
                        '@chri_lungu',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Text(
              'Beauty, cosmetics, & personal care, Education, Event Planner\nMother of 3 ❤️',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),

            // Following and Customers
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        '36',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Following',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '860K',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Customers',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Bio
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.blue),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Open now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            /* Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 4,
              //margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                                Icons.location_on,
                                size: 18,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  'Open now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                              size: 18,
                              color: Colors.red,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Like business',
                              style: TextStyle(
                                fontSize: 16,
                                //color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //SizedBox(height: 8),
                  ],
                ),
              ),
            ),*/
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
