import 'dart:io';

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_bloc.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_event.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_state.dart';
import 'package:nowingoogle/presentation/injector.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Injector.splashPageBloc.add(const OnAppInit());
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
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                ),
                Text(
                  "Now in \nGoogle",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
                  if (state is SplashUserAvailable) {
                    return FilledButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: const Text("Sign out"));
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
                              const SizedBox(
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
                        onPressed: () {
                          Injector.splashPageBloc
                              .add(const OnSignInWithGoogle());
                        },
                        child: const Text('Get Started'),
                      );
                    }
                  } else if (state is SplashError) {
                    //TODO: Handle the error in a more intuitive way
                    return Text(state.error);
                  } else if (state is SplashNewUser) {
                    //TODO: Work on the bottom sheet
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container();
                        });
                    return const SizedBox();
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CircularCappedProgressIndicator(),
                    );
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
