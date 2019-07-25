import 'dart:core' as core;
import 'dart:io';
import 'dart:convert';

var mock = '''
/*
  THIS IS A FILE WHICH CONTAINS ALL THE EMOJI CODE
  THIS FILE IS AUTO GENERATED SO IT IS RECOMMENDED NOT TO EDIT
*/

/// The main Demoji class which contains all the emojis
/// 
/// You can use things like Demoji.grinning which will return -> 😀
/// This library contains 1500+ emojis for multiplatform use
/// Note that this hasn't been tested on flutter
class Demoji{
''';

/// Main function
/// main code for generating emoji in emoji.dart using emojis.json
/// emojis.json lives here https://bit.ly/2YdBb5X
/// but a modified version live here -> ./emojis.json
void main() {
  new File('./emojis.json')
      .readAsString()
      .then((stringData) => jsonDecode(stringData))
      .then((jsonData) {
    jsonData.forEach((k, v) {
      mock += '''
        /// Returns ${v['char']}
        static const $k = '${v['char']}';\n
      ''';
    });
    mock += "}";
    new File('./emoji.dart').writeAsString(mock).whenComplete(() {
      core.print("Job done");
    });
  });
}
