import 'package:flutter/material.dart';
import 'package:nect_widgets/home_page.dart';

void main() {
  var hi = 'Hi DK';
  print('String is "$hi"\n');

  // Length.
  print('String.length: ${hi.length}');
  print('Characters.length: ${hi.characters.length}\n');

  // Last character.
  print('The string ends with: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');

  // Skip last character.
  print('Substring -1: "${hi.substring(0, hi.length - 1)}"');
  print('Skipping last character: "${hi.characters.skipLast(1)}"\n');

  // Replace characters.
  var newHi = hi.characters.replaceAll('🇩🇰'.characters, '🇺🇸'.characters);
  print('Change flag: "$newHi"');
  Map test1 = {
    "key1": "value1",
    "key2": 2,
    "key3": 4.5,
    "key4": [1, 2, 3, 4],
    "key5": {
      "key1": "value1",
      "key2": 2,
      "key3": 4.5,
      "key4": [1, 2, 3, 4]
    },
  };
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
