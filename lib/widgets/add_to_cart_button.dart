import 'package:flutter/material.dart';
import 'package:pizzaapp/helpers/styles.dart';

class AddToCartButton extends StatelessWidget {
  final void Function() onTap;

  const AddToCartButton({super.key, required this.onTap, });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: Styles.addToCartButtonGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Styles.addToCartaButtonShadow,
        ),
        width: 60,
        height: 60,
        padding: EdgeInsets.all(15),
        child: Image.asset(
          'assets/images/cart.png',
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}