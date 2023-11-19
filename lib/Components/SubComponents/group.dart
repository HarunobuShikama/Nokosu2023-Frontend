import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nokosu2023/models/models.dart';
import 'package:nokosu2023/utils/constants.dart';

class GroupFolder extends StatefulWidget {
  final Group group;
  final TextEditingController groupController;
  final TextEditingController groupNameController;

  const GroupFolder({
    Key? key,
    required this.group,
    required this.groupController,
    required this.groupNameController,
  }) : super(key: key);

  @override
  State<GroupFolder> createState() => _GroupState();
}

class _GroupState extends State<GroupFolder> {
  late AppLocalizations locale;

  // Modify not to use this when using user uploaded folder images
  Color getRandomSoftColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      0.5, // Opacity (1.0 means fully opaque)
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.groupController.text = widget.group.id.toString();
          widget.groupNameController.text = widget.group.name!;
          Navigator.of(context).pop();
        },
        child: SizedBox(
          height: 80,
          width: 80,
          child: Neumo(
            border: 10,
            child: Column(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    getRandomSoftColor(),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(Imgs.folder),
                ),
                Text(
                  widget.group.name ?? locale.unnamed,
                  style: const TextStyle(
                    color: ThemeColours.txtBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
