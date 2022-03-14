import 'package:flutter/material.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';
import 'package:todo/ui_elements/molecules/circle_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Spacer(),
              MediumCircle(
                label: 'Logo',
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: DefaultText('TODO App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
