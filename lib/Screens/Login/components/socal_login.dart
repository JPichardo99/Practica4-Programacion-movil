import 'package:flutter/material.dart';
import 'package:socialtec/Screens/Login/or_divider.dart';

import 'social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/facebook.png",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icons/github.png",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icons/gmail.png",
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
