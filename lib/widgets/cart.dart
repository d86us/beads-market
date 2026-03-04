import 'package:flutter/material.dart';
import '../models/bead_item.dart';

class Cart extends InheritedWidget {
  final List<BeadItem> items;
  final VoidCallback notifyParent;

  const Cart({
    super.key,
    required this.items,
    required this.notifyParent,
    required super.child,
  });

  static Cart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Cart>()!;
  }

  @override
  bool updateShouldNotify(Cart oldWidget) => items != oldWidget.items;

  double get total => items.fold(0, (sum, item) => sum + item.price);
}
