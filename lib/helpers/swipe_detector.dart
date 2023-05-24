import 'package:flutter/cupertino.dart';

class SwipeConfiguration {
  //Vertical swipe configuration options
  double verticalSwipeMaxWidthThreshold = 50.0;
  double verticalSwipeMinDisplacement = 100.0;
  double verticalSwipeMinVelocity = 300.0;

  //Horizontal swipe configuration options
  double horizontalSwipeMaxHeightThreshold = 50.0;
  double horizontalSwipeMinDisplacement = 100.0;
  double horizontalSwipeMinVelocity = 300.0;

  SwipeConfiguration({
    required double verticalSwipeMaxWidthThreshold,
    required double verticalSwipeMinDisplacement,
    required double verticalSwipeMinVelocity,
    required double horizontalSwipeMaxHeightThreshold,
    required double horizontalSwipeMinDisplacement,
    required double horizontalSwipeMinVelocity,
  }) {
    this.verticalSwipeMaxWidthThreshold = verticalSwipeMaxWidthThreshold;

    this.verticalSwipeMinDisplacement = verticalSwipeMinDisplacement;

    this.verticalSwipeMinVelocity = verticalSwipeMinVelocity;

    this.horizontalSwipeMaxHeightThreshold =
        horizontalSwipeMaxHeightThreshold;

    this.horizontalSwipeMinDisplacement = horizontalSwipeMinDisplacement;

    this.horizontalSwipeMinVelocity = horizontalSwipeMinVelocity;
  }
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function() onSwipeLeft;
  final Function() onSwipeRight;
  final SwipeConfiguration swipeConfiguration;

  SwipeDetector(
      {required this.child,
      required this.onSwipeLeft,
      required this.onSwipeRight,
      required SwipeConfiguration swipeConfiguration})
      : swipeConfiguration = swipeConfiguration;

  @override
  Widget build(BuildContext context) {

    DragStartDetails startVerticalDragDetails = 1 as DragStartDetails;
    DragUpdateDetails updateVerticalDragDetails = 1 as DragUpdateDetails;

    DragStartDetails startHorizontalDragDetails =
        DragStartDetails(globalPosition: const Offset(0, 0));

    DragUpdateDetails updateHorizontalDragDetails =
        DragUpdateDetails(globalPosition: const Offset(0, 0));

    return GestureDetector(
      child: child,
      onVerticalDragStart: (dragDetails) {
        startVerticalDragDetails = dragDetails;
      },
      onVerticalDragUpdate: (dragDetails) {
        updateVerticalDragDetails = dragDetails;
      },
      onVerticalDragEnd: (endDetails) {
        double dx = updateVerticalDragDetails.globalPosition.dx -
            startVerticalDragDetails.globalPosition.dx;
        double dy = updateVerticalDragDetails.globalPosition.dy -
            startVerticalDragDetails.globalPosition.dy;
        double? velocity = endDetails.primaryVelocity;

        //Convert values to be positive
        if (dx < 0) dx = -dx;
        if (dy < 0) dy = -dy;
        double? positiveVelocity = velocity! < 0 ? -velocity : velocity;

        if (dx > swipeConfiguration.verticalSwipeMaxWidthThreshold) return;
        if (dy < swipeConfiguration.verticalSwipeMinDisplacement) return;
        if (positiveVelocity! < swipeConfiguration.verticalSwipeMinVelocity) {
          return;
        }


      },
      onHorizontalDragStart: (dragDetails) {
        startHorizontalDragDetails = dragDetails;
      },
      onHorizontalDragUpdate: (dragDetails) {
        updateHorizontalDragDetails = dragDetails;
      },
      onHorizontalDragEnd: (endDetails) {
        double dx = updateHorizontalDragDetails.globalPosition.dx -
            startHorizontalDragDetails.globalPosition.dx;
        double dy = updateHorizontalDragDetails.globalPosition.dy -
            startHorizontalDragDetails.globalPosition.dy;
        double? velocity = endDetails.primaryVelocity;

        if (dx < 0) dx = -dx;
        if (dy < 0) dy = -dy;
        double positiveVelocity = velocity! < 0 ? -velocity : velocity;

        // print("$dx $dy $velocity $positiveVelocity");

        if (dx < swipeConfiguration.horizontalSwipeMinDisplacement) return;
        if (dy > swipeConfiguration.horizontalSwipeMaxHeightThreshold) return;
        if (positiveVelocity < swipeConfiguration.horizontalSwipeMinVelocity)
          return;

        if (velocity < 0) {
          //Swipe Up
          onSwipeLeft();
        } else {
          //Swipe Down
          onSwipeRight();
        }
      },
    );
  }
}