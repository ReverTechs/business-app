import 'package:business_app/components/customer_profiles/customer_dashboard.dart';
import 'package:business_app/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Shop UI Page

class ShopUi extends StatelessWidget {
  final String username = "Blessings";
  const ShopUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Back button and cart
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerDashboard(),
                              ),
                            );
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.1),
                                ],
                                stops: const [0.4, 1.0],
                                center: Alignment.center,
                                radius: 1.0,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'https://cdni.pornpics.com/1280/7/725/40669812/40669812_034_2bed.jpg', // Replace with your image URL
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Christina Fashions & Cosmetics",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.blue,
                                size: 26,
                              ),
                            ),
                            Positioned(
                              right: 4,
                              top: -2,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(),
                                    ),
                                  );
                                },
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
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Good moaning, $username",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(32.0),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner with Discount
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: const DecorationImage(
                      image: AssetImage(Assets.product1),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 16,
                        left: 8,
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
                        right: 8,
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
                const SizedBox(height: 8.0),
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
                const AutoScrollingBrandList(),
                /* SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _BrandLogo(assetPath: Assets.trademateLogo),
                      _BrandLogo(assetPath: Assets.product2),
                      _BrandLogo(assetPath: Assets.trademateLogo),
                      _BrandLogo(assetPath: Assets.product4),
                      _BrandLogo(assetPath: Assets.product1),
                    ],
                  ),
                ),*/
                const SizedBox(height: 8.0),
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
                      SizedBox(width: 8),
                      ShoeCard(
                        image: Assets.product2,
                        title: 'Dr. Martens',
                        rating: 5,
                        colors: 8,
                        price: 130500,
                      ),
                      SizedBox(width: 8),
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
                const SizedBox(height: 8),
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
                const SizedBox(height: 8),
                SizedBox(
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      ShoeCard(
                        image: Assets.product1,
                        title: 'Pure Decent',
                        rating: 2,
                        colors: 6,
                        price: 10000,
                      ),
                      SizedBox(width: 8),
                      ShoeCard(
                        image: Assets.product2,
                        title: 'Dr. Martens',
                        rating: 4,
                        colors: 8,
                        price: 30000,
                      ),
                      SizedBox(width: 8),
                      ShoeCard(
                        image: Assets.product3,
                        title: 'Sneakers',
                        rating: 3,
                        colors: 4,
                        price: 11000,
                      ),
                    ],
                  ),
                ),
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
                      SizedBox(width: 8),
                      ShoeCard(
                        image: Assets.product2,
                        title: 'Dr. Martens',
                        rating: 5,
                        colors: 8,
                        price: 130500,
                      ),
                      SizedBox(width: 8),
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
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    "You're all caught up 👍!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const TwitterFab(),
    );
  }
}

//class for auto scroll of brans list
class AutoScrollingBrandList extends StatefulWidget {
  const AutoScrollingBrandList({super.key});

  @override
  State<AutoScrollingBrandList> createState() => _AutoScrollingBrandListState();
}

class _AutoScrollingBrandListState extends State<AutoScrollingBrandList>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller;
  late final Ticker _ticker;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    if (!_controller.hasClients) return;
    _scrollPosition += 0.3; // Adjust speed here
    if (_scrollPosition > _controller.position.maxScrollExtent) {
      _scrollPosition = 0;
    }
    _controller.jumpTo(_scrollPosition);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: const [
          _BrandLogo(assetPath: Assets.product4),
          _BrandLogo(assetPath: Assets.trademateLogo),
          _BrandLogo(assetPath: Assets.product2),
          _BrandLogo(assetPath: Assets.trademateLogo),
          _BrandLogo(assetPath: Assets.product4),
          _BrandLogo(assetPath: Assets.product1),
          _BrandLogo(assetPath: Assets.product3),
        ],
      ),
    );
  }
}

// floating action button
class TwitterFab extends StatelessWidget {
  const TwitterFab({super.key});

  void _openComposeSheet(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Compose",
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (_, animation, __, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: const ComposeTweetOverlay(),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _openComposeSheet(context),
      backgroundColor: Colors.blue,
      shape: const CircleBorder(),
      elevation: 8,
      child: const Icon(Icons.edit, color: Colors.white),
    );
  }
}

//for adding a compose tweet overlay

class ComposeTweetOverlay extends StatelessWidget {
  const ComposeTweetOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close icon on top right
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: const Icon(Icons.close, size: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Header
                  const Text(
                    "Compose Special Oder",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Text field
                  TextField(
                    maxLines: 5,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: "What special order would you like to make?",
                      hintMaxLines: 2,
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tweet button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop(); // Or handle tweet logic
                      },
                      icon: const Icon(Icons.send),
                      label: const Text("Send Special Order"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .animate()
            .scale(duration: 300.ms, curve: Curves.easeOutBack)
            .fadeIn(duration: 300.ms),
      ),
    );
  }
}

// FAB code ends here
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

// floating action button

class ClassFloatingActionButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final double size;
  final String? tooltip;

  const ClassFloatingActionButton({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFF1DA1F2),
    this.iconColor = Colors.white,
    required this.onPressed,
    this.size = 56.0,
    this.tooltip,
  }) : super(key: key);

  @override
  _ClassFloatingActionButtonState createState() =>
      _ClassFloatingActionButtonState();
}

class _ClassFloatingActionButtonState extends State<ClassFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onPressed();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 6.0,
          shape: const CircleBorder(),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                widget.icon,
                color: widget.iconColor,
                size: widget.size * 0.5,
              ),
              tooltip: widget.tooltip,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

//cart page UI ------------------
// Cart Page UI
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample cart items
  final List<CartItem> cartItems = [
    CartItem(
      id: 1,
      name: 'Wireless Headphones',
      price: 79.99,
      imageUrl: Assets.product3, //'https://via.placeholder.com/100',
      quantity: 1,
    ),
    CartItem(
      id: 2,
      name: 'Smartwatch',
      price: 199.99,
      imageUrl: Assets.product3, //'https://via.placeholder.com/100',
      quantity: 2,
    ),
    CartItem(
      id: 3,
      name: 'Dr Martens Boots',
      price: 80.66,
      imageUrl: Assets.product3, //'https://via.placeholder.com/100',
      quantity: 3,
    ),
  ];

  void updateQuantity(int id, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        cartItems.removeWhere((item) => item.id == id);
      } else {
        final item = cartItems.firstWhere((item) => item.id == id);
        item.quantity = newQuantity;
      }
    });
  }

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // backgroundColor: Colors.white,
        elevation: 0,
        // foregroundColor: Colors.black,
      ),
      body:
          cartItems.isEmpty
              ? const Center(
                child: Text(
                  'Your cart is empty!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemWidget(
                          item: item,
                          onQuantityChanged:
                              (newQuantity) =>
                                  updateQuantity(item.id, newQuantity),
                        );
                      },
                    ),
                  ),
                  _buildSummarySection(context),
                ],
              ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        //color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     // color: Colors.grey.withOpacity(0.1),
        //     blurRadius: 10,
        //     offset: const Offset(0, -2),
        //   ),
        //],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                cartItems.isEmpty ? '\$0.00' : '\$10.00',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Est. Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${(subtotal + (cartItems.isEmpty ? 0 : 10.0)).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Text(
            "Business will provide total price! It will confirm your order and shipping details, including any tax, fees and discounts.",
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  cartItems.isEmpty
                      ? null
                      : () {
                        // Handle checkout action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Proceeding to checkout...'),
                          ),
                        );
                      },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onQuantityChanged(0),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              QuantitySelector(
                quantity: item.quantity,
                onChanged: (newQuantity) => onQuantityChanged(newQuantity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Function(int) onChanged;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => onChanged(quantity - 1),
          icon: const Icon(Icons.remove_circle_outline),
          color: Colors.grey,
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () => onChanged(quantity + 1),
          icon: const Icon(Icons.add_circle_outline),
          color: Colors.grey,
        ),
      ],
    );
  }
}

//cart page UI ends here
