import 'package:flutter/material.dart';
import 'package:snake_game/screen/widgets/blank_pixel.dart';
import 'package:snake_game/screen/widgets/food_pixel.dart';
import 'package:snake_game/screen/widgets/snake_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Grid Dimensions
  int rowSize = 10;
  int totalNumberSquares = 100;
  //Snake Position
  List<int> snakePosition = [
    0,
    1,
    2,
  ];
  //Food Position
  int foodPosition = 55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //High Scores
          Expanded(
            child: Container(),
          ),
          //GameGrid
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: totalNumberSquares,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowSize,
              ),
              itemBuilder: (context, index) {
                if (snakePosition.contains(index)) {
                  return const SnakePixel();
                } else if (foodPosition == index) {
                  return const FoodPixel();
                } else {
                  return const BlankPixel();
                }
              },
            ),
          ),
          //Play Button
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
