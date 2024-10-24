import 'package:flutter/material.dart';

class AppBarWidgetForOthers extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWidgetForOthers({
    required this.ontap,
    required this.name,
    super.key,
  });

  final VoidCallback ontap;
  final String name;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name),
      leading: IconButton(
        onPressed: ontap,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
