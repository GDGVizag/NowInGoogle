import 'dart:io';

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_one_tap_sign_in/google_one_tap_sign_in.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_bloc.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_event.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_state.dart';
import 'package:nowingoogle/presentation/injector.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Injector.splashPageBloc.add(OnAppInit());
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        Transform.translate(
          offset: const Offset(0, 54),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/io-logo.svg",
                  width: 100,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
                Text(
                  "Now in \nGoogle",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 12,
                ),
                BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
                  if (state is SplashUserAvailable) {
                    return Text("Home screen");
                  } else if (state is SplashUserLoggedOut) {
                    if (!Platform.isAndroid) {
                      return MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                            Injector.splashPageBloc
                                .add(const OnSignInWithGoogle());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/google-logo.svg',
                                width: 18,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.54),
                                ),
                              ),
                            ],
                          ));
                    } else {
                      // var data = GoogleOneTapSignIn.startSignIn(webClientId: _webClientId);

                      return FilledButton(
                        onPressed: () {},
                        child: Text('Continue'),
                      );
                    }
                  } else {
                    return CircularCappedProgressIndicator();
                  }
                }),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            "assets/io-bridge.png",
          ),
        ),
      ]),
    );
  }
}
