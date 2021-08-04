import 'dart:io';
import 'dart:convert';

var readme = '';
var mock = '''
/// `Demoji` class which returns emoji accessed by static properties
/// e.g `Demoji.grinning` returns 😀
class Demoji{
''';

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
      readme += "| ```Demoji.$k``` | ${v['char']} |\n";
    });
    mock += "}";
    new File('./emoji.dart').writeAsString(mock).whenComplete(() {
      new File('../../README.md').readAsString().then((rm) {
        rm += readme;
        new File('../../README.md').writeAsString(rm).whenComplete(() {
          print("Job done");
        });
      });
    });
  });
}
