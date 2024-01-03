import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatelessWidget {
  //현재 선택된 index
  //카드에 담긴 상품 갯수
  //클릭이벤트
  final int currentIndex;
  final String cartTotal;
  final Function(int index)? onTap;

  const BottomBar(
      {super.key,
      required this.currentIndex,
      required this.cartTotal,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Catalog'),
        BottomNavigationBarItem(
            icon: badges.Badge(
              child: const Icon(Icons.shopping_cart),
              badgeContent: Text(
                cartTotal,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            label: 'Cart'),
      ],
    );
  }
}
