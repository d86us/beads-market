import 'package:flutter/material.dart';
import '../models/bead_item.dart';
import '../data/dummy_beads.dart';
import '../widgets/cart.dart';
import 'checkout_page.dart';

class HomeScreen extends StatefulWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BeadItem> _cart = [];
  bool _menuOpen = false;

  void _toggleMenu() => setState(() => _menuOpen = !_menuOpen);

  void _addToCart(BeadItem item) {
    setState(() {
      _cart.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Cart(
      items: _cart,
      notifyParent: () => setState(() {}),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _toggleMenu,
              ),
              title: const Text('BeadsMarket'),
              centerTitle: true,
              actions: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheckoutPage(cart: _cart),
                          ),
                        );
                      },
                    ),
                    if (_cart.isNotEmpty)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${_cart.length}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: dummyBeads.length,
              itemBuilder: (context, index) {
                final bead = dummyBeads[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            bead.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) => Container(
                              color: Theme.of(context).colorScheme.surface,
                              child: Icon(
                                Icons.image,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bead.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              bead.description,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withAlpha(179),
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'KSh ${bead.price.toInt()}',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () => _addToCart(bead),
                                  icon: const Icon(Icons.add_shopping_cart),
                                  label: const Text('Add to Cart'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (_menuOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleMenu,
                child: Container(color: Colors.black54),
              ),
            ),
          if (_menuOpen)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: 280,
              child: Material(
                child: SafeArea(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: Theme.of(context).colorScheme.secondary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BeadsMarket',
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fontSize: 24,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                              onPressed: _toggleMenu,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: _toggleMenu,
                      ),
                      ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: const Text('Cart'),
                        onTap: () {
                          _toggleMenu();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CheckoutPage(cart: _cart),
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(
                          widget.themeMode == ThemeMode.dark
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: widget.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            widget.onThemeChanged(
                              value ? ThemeMode.dark : ThemeMode.light,
                            );
                          },
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
  }
}
