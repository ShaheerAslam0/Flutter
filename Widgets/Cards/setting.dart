import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SettingsBlock extends StatelessWidget {
  final String heading1;
  final VoidCallback onTapAction;

  const SettingsBlock({
    Key? key,
    required this.heading1,
    required this.onTapAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onTapAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

         Text(
           heading1,
           style: const TextStyle(
             fontFamily: 'Inter-VariableFont_slntwght',
             fontSize: 14,
             fontWeight: FontWeight.w500,
             color: Colors.black,
           ),
         ),

          Icon(
              FeatherIcons.chevronRight,
            color: Colors.grey.shade300,
          )


        ],
      ),
    );
  }
}
