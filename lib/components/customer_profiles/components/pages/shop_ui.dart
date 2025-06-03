import 'package:business_app/components/customer_profiles/customer_dashboard.dart';
import 'package:business_app/const/assets.dart';
import 'package:flutter/material.dart';

// Shop UI Page

class ShopUi extends StatelessWidget {
  final String username = "Christina";
  const ShopUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            elevation: 0,
            //leading icon
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
                          builder: (context) => CustomerDashboard(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            //ends here
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate whether the app bar is collapsed
                final isCollapsed =
                    constraints.maxHeight <= kToolbarHeight + 10;

                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                  title:
                      isCollapsed
                          ? Text(
                            "Hello, $username",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                          : null,
                  background: Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 60),
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Wrap(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Christina Fashions",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  // Remove overflow property
                                ),
                                maxLines: 2, // or remove for unlimited lines
                                softWrap: true,
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.shopping_cart,
                            //     color: Colors.white,
                            //   ),
                            // ),
                            Stack(
                              clipBehavior:
                                  Clip.none, // Ensures badge can overflow if needed
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                Positioned(
                                  // Adjust these values to perfectly overlap the icon
                                  right: 4,
                                  top: -2,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 22,
                                      minHeight: 22,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '8',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.filter_list),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main content remains the same
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner with Discount
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(Assets.product1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 16,
                          left: 16,
                          child: Text(
                            '50% OFF',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text(
                              'Shop now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Brands Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular brands',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        _BrandLogo(assetPath: Assets.product1),
                        _BrandLogo(assetPath: Assets.product2),
                        _BrandLogo(assetPath: Assets.product3),
                        _BrandLogo(assetPath: Assets.product4),
                        _BrandLogo(assetPath: Assets.product1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Men's Shoes Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Men's Shoes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  // Horizontal Scrolling
                  SizedBox(
                    height: 280,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        ShoeCard(
                          image: Assets.product1,
                          title: 'Pure Decent',
                          rating: 5,
                          colors: 5,
                          price: 250000,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product2,
                          title: 'Dr. Martens',
                          rating: 5,
                          colors: 8,
                          price: 130500,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product3,
                          title: 'Sneakers',
                          rating: 3,
                          colors: 4,
                          price: 50000,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Women's Shoes Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Women's Shoes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  // Horizontal Scrolling
                  SizedBox(
                    height: 280,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        ShoeCard(
                          image: Assets.product1,
                          title: 'Pure Decent',
                          rating: 5,
                          colors: 5,
                          price: 250000,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product2,
                          title: 'Dr. Martens',
                          rating: 5,
                          colors: 8,
                          price: 130500,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product3,
                          title: 'Sneakers',
                          rating: 3,
                          colors: 4,
                          price: 50000,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Kitchen's Utils Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Kitchen Utils",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 280,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        ShoeCard(
                          image: Assets.product1,
                          title: 'Pure Decent',
                          rating: 5,
                          colors: 5,
                          price: 250000,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product2,
                          title: 'Dr. Martens',
                          rating: 5,
                          colors: 8,
                          price: 130500,
                        ),
                        SizedBox(width: 16),
                        ShoeCard(
                          image: Assets.product3,
                          title: 'Sneakers',
                          rating: 3,
                          colors: 4,
                          price: 50000,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "You're all catched up 👍!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////

//////
class _BrandLogo extends StatelessWidget {
  final String assetPath;

  const _BrandLogo({Key? key, required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(assetPath),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

// Brand Circle Widget
class BrandCircle extends StatelessWidget {
  final String brandImage;

  const BrandCircle({super.key, required this.brandImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Center(
        child: Image.asset(
          brandImage,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// Shoe Card Widget
class ShoeCard extends StatelessWidget {
  final String image;
  final String title;
  final int rating;
  final int colors;
  final double price;

  const ShoeCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.colors,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$colors Colors',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\MWK$price',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.shopping_cart, color: Colors.red[400], size: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
