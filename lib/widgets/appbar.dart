import 'package:flutter/material.dart';
import 'package:nowingoogle/utils/constants.dart';
import 'package:nowingoogle/widgets/miniwidgets.dart';

class DefAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: IconButton(
        icon: MenuIcon(),
        onPressed: () {},
      ),
      centerTitle: false,
      scrolledUnderElevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: screenPadding),
          child: ProfileImage(
              url:
                  'https://media.licdn.com/dms/image/D5603AQEDCiL9MlzEzQ/profile-displayphoto-shrink_400_400/0/1680166995219?e=1691020800&v=beta&t=gH2nBa1-PT6Beo68UatmIhHrsIf6kGu_t0kF419rNHg'),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
