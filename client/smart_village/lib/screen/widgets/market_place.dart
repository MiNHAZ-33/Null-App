import 'package:flutter/material.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 3,
          itemBuilder: (context, index) => ProductCard(),
        ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 40,
        // width: 40,
        // color: Colors.red,
        );
  }
}
