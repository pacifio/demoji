import 'package:test/test.dart';
import 'package:demoji/demoji.dart';

void main() {
  test('emoji testing', () {
    expect(Demoji.grinning, '😀');
    expect(Demoji.joy, '😂');
    expect(Demoji.abacus, '🧮');
  });
}
