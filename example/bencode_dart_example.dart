import 'dart:typed_data';

import 'package:bencode_dart/bencode_dart.dart' as bencode;

void main() {
  print(String.fromCharCodes(bencode.encode('string') as Iterable<int>)); // => "6:string"
  print(String.fromCharCodes(bencode.encode(123) as Iterable<int>)); // => "i123e"
  print(
      String.fromCharCodes(bencode.encode(['str', 123]) as Iterable<int>)); // => "l3:stri123ee"
  print(String.fromCharCodes(
      bencode.encode({'key': 'value'}) as Iterable<int>)); // => "d3:key5:valuee"
  var map = bencode.decode(Uint8List.fromList('d3:key5:valuee'.codeUnits),
      stringEncoding:
          'utf-8'); // => { key: "value" } , the string value is bytes array

  print(map);
  // Special character
  var ccc = bencode.encode({'中文': 'ddd'});
  var m1 = bencode.decode(ccc);
  print(m1);
}
