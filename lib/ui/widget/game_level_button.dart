import 'package:flutter/material.dart';
import 'package:mall_app/constants/assets.dart';

class GameLevelButton extends StatelessWidget {
  final String image;
  final String title;
  final bool locked;
  final bool completed;

  const GameLevelButton(
      {Key? key,
      required this.title,
      required this.image,
      required this.locked,
      required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              if (locked)
                Image.asset(
                  Assets.assetsLock,
                  // color: Colors.white.withOpacity(0.4),
                  // colorBlendMode: BlendMode.modulate,
                )
              else if (completed)
                Image.asset(
                  Assets.assetsDone,
                )
              else
                Image.asset(
                  'assets/images/$image',
                ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        // if (locked)
        //   Image.asset(
        //     'assets/images/lock.png',
        //     width: 110,
        //   ),
        // if (completed)
        //   const Icon(
        //     Icons.check_circle_rounded,
        //     color: Colors.green,
        //   ),
      ],
    );
  }
}
