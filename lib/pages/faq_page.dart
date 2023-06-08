import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  var coc = {
    "What is I/O Extended?":
        "Google I/O Extended is the community led counterpart to Google I/O, our annual Google led conference where the world hears about Google’s latest developer solutions, products, and technology.\nGoogle I/O Extended is a series of community led tech meetups, that bring the knowledge and excitement of Google I/O to developers on a city level, all around the globe.",
    "Who can atttend I/O Extended '23?": "Anyone.",
    "When and where is I/O Extended '23?":
        "The community led counterpart to Google I/O, will be held on April 1st and in the surely in the city of Destiny, Visakhapatnam. The exact venue will be shared soon.",
    "How do I register for I/O Extended '23: Vizag":
        "Just hit the 'Register Now' button that's on the home screen and fill out the form. We'll then reach back to you soon after reviewing your application. You can be sure you're an official attendee of the event, if you recieve your ticket! However, we'll notify you via email and notification as well.",
    "I'm am not able to find the 'Register Now' button":
        "No worries, you should be able to find the 'Sign in' button, just tap on it, sign in with your Google account which you want us to create a profile from, fill in basic profile and you should now see the 'Register Now' button.",
    "How can I stay informed on the latest from GDG Vizag's I/O Extended '23?":
        "To stay up-to-date on the latest information on sessions, speakers, and overall activities, be sure to frequently visit the I/O Extended '23: Vizag website, and follow us on Twitter and Instagram. Be sure to spread the news via the official #ioextended hashtag. In addition, we'll be emailing and sending notifications with all the important information to all registered attendees, along with check-in instructions prior to the festival.",
    "Will the sessions be livestreamed? What if I can’t follow the event in real time?":
        "The sessions will be livestreamed on the event website’s homepage and also on YouTube. If you’re busy at work or on the other side of the planet with a tricky time difference, you can watch the session recordings later on the GDG Vizag's YouTube channel.",
    "Where can I get my ticket?":
        "To expedite the check-in process, all shortlisted attendees can download their virtual ID cards from the `My Tickets` section. #savetheenvironment",
    "I'm unable to find the `My Tickets` section?":
        "Mostly, that means we weren't able to take you in this time. But, don't worry, you can catch up the I/O Extended '23 experience virtually though the live stream.",
    "I'm unable to download my virtual ID card from the `My Tickets` section?":
        "We're sorry to hear that. Kindly write a mail to us at vizaggdg@gmail.com and we'll try to get back to you as soon as possible.",
    "Would I be provided any accomodation for IWD'23 Vizag":
        "We currently dont have any plans for providing accomodation. However, if there's any change in plans, we'll surely let you know.",
    "Google's Event Community Guidelines and Anti-Harrasement Policy":
        "Google is dedicated to providing a harassment-free and inclusive event experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category. In an effort to make the event as inclusive as possible, gender-neutral bathrooms will be offered throughout the venue.\n\nWe don’t tolerate harassment of event participants in any form.\n\nGoogle takes violations of our policy seriously and will respond appropriately.\n\nAll participants of Google events must abide by the following policy and our code of conduct"
  };
  var expandedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left_rounded),
          iconSize: 24,
        ),
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            SizedBox(
              height: 48,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "FAQ",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Answers to your questions",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListView.separated(
              itemCount: coc.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                expandedIndex == index
                                    ? expandedIndex = -1
                                    : expandedIndex = index;
                              });
                            },
                            child: Text(
                              coc.entries.toList()[index].key,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: expandedIndex == index
                                          ? FontWeight.w500
                                          : null),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                expandedIndex == index
                                    ? expandedIndex = -1
                                    : expandedIndex = index;
                              });
                            },
                            icon: Icon(expandedIndex == index
                                ? Icons.expand_less_rounded
                                : Icons.expand_more_rounded))
                      ],
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: expandedIndex == index
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(coc.entries.toList()[index].value)
                              ],
                            )
                          : SizedBox(),
                    ),
                  ],
                );
              },
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (_, __) {
                return Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
