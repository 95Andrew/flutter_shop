import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/shared/const_strings.dart';

import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onPressed;

  const DefaultAppBar({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(logout),
      centerTitle: true,
      backgroundColor: Colors.purple,
      elevation: 0,
      actions: [IconButton(icon: const Icon(Icons.logout), onPressed: onPressed)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.size.height / 20);
}
