import 'package:flutter_test/flutter_test.dart';
import 'package:nowingoogle/utils/capitalize.dart';
import 'package:nowingoogle/utils/get_avatar.dart';

void main() {
  test("String should be capitalized", () {
    const String value = "string to be capitalized";
    const String actualValue = "String To Be Capitalized";
    final String expectedValue = capitalize(value);
    expect(expectedValue, actualValue);
  });
  test("Get correct avatar image", () {
    const volunteer = "volunteer";
    const speaker = "Speaker";
    const organizer = "Organizer";
    const attendee = "attendee";
    expect(getAvatarUrl(volunteer), "assets/avatar/blue.png");
    expect(getAvatarUrl(speaker), "assets/avatar/green.png");
    expect(getAvatarUrl(organizer), "assets/avatar/red.png");
    expect(getAvatarUrl(attendee), "assets/avatar/yellow.png");
  });
}
