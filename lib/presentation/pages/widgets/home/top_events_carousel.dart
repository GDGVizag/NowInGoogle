import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nowingoogle/data/datasources/sample_data/sample_events.dart';
import 'package:nowingoogle/presentation/layouts/event_card.dart';

class TopEventsCarousel extends StatelessWidget {
  const TopEventsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: events.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return EventCard(
          event: events[itemIndex].toEntity(),
          primaryColor: events[itemIndex].primaryColor,
          secondaryColor: events[itemIndex].secondaryColor,
        );
      },
      options: CarouselOptions(
          aspectRatio: 0.87, viewportFraction: 1, autoPlay: true),
    );
  }
}
