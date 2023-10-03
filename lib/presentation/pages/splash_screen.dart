import 'dart:io';

import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_bloc.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_event.dart';
import 'package:nowingoogle/presentation/bloc/splash_module/splash_state.dart';
import 'package:nowingoogle/presentation/injector.dart';
import 'package:nowingoogle/presentation/pages/layouts/bottom_sheets/create_profile_bottom_sheet.dart';

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
                Row(
                  children: [
                    Image.asset(
                      "assets/logo-gdg.png",
                      height: 16,
                      color: Colors.grey.shade700,
                      colorBlendMode: BlendMode.srcATop,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Developers",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    // SvgPicture.asset(
                    //   "assets/io-logo.svg",
                    //   width: 100,
                    //   colorFilter:
                    //       Theme.of(context).brightness == Brightness.dark
                    //           ? const ColorFilter.mode(
                    //               Colors.white, BlendMode.srcIn)
                    //           : null,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Now in \nGoogle",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                const SplashBlocInjector(),
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

class SplashBlocInjector extends StatelessWidget {
  const SplashBlocInjector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) async {
      if (state is SplashUserAvailable) {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) {
            return CreateProfileBottomSheet(
              GlobalKey(),
            );
          },
        );
      } else if (state is SplashError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            iconColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            icon: const Icon(
              Icons.sentiment_dissatisfied_rounded,
            ),
            title: const Text("Error"),
            content: Text(
                "We were unable to sign you in at the moment. ${state.error} Please try again now or later."),
            actions: [
              OutlinedButton(
                onPressed: () {
                  exit(1);
                },
                child: const Text("Close"),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Injector.splashPageBloc.add(const OnAppInit());
                },
                child: const Text("Try Again"),
              )
            ],
          ),
        );
      } else if (state is SplashNewUser) {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) {
            return CreateProfileBottomSheet(
              GlobalKey(),
            );
          },
        );
      }
    }, builder: (context, state) {
      if (state is SplashUserLoggedOut) {
        if (!Platform.isAndroid) {
          return MaterialButton(
              color: Colors.white,
              onPressed: () {
                Injector.splashPageBloc.add(const OnSignInWithGoogle());
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
              Injector.splashPageBloc.add(const OnSignInWithGoogle());
            },
            child: const Text('Get Started'),
          );
        }
      } else {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: CircularCappedProgressIndicator(),
        );
      }
    });
  }
}
