import 'package:flutter/material.dart';

import '../constants/asset_constants.dart';

class Background extends StatelessWidget {
  final Widget child;

  final String topImage,backgroundImage, bottomImage;
  const Background({
    Key? key,
    required this.child,
    this.topImage = demoProfilePic,
    this.bottomImage = demoProfilePic,
    this.backgroundImage = bgSplashScreen,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgSplashScreen),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // uncomment if corner image required
            /*Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(bottomImage, width: 120),
            ),*/
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
