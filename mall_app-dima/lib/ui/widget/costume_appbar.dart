import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';

class CostumeAppBar extends StatelessWidget {
  const CostumeAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.of(context).pop(),
          ),
          Expanded(
              child: Center(
                  child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          )))
        ],
      ),
    );
  }
}
