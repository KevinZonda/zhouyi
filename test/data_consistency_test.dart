// 验证与 Node.js 版本数据一致性测试

import 'package:flutter_test/flutter_test.dart';
import 'package:zhouyi/data/hexagrams_data.dart';

void main() {
  group('Data Consistency Verification', () {
    test('Shan Lei Yi (Hexagram 27) data integrity', () {
      final yi = allHexagrams[26]; // index 26 = Hexagram 27
      
      expect(yi.number, equals(27));
      expect(yi.name, equals('颐'));
      expect(yi.fullName, equals('山雷颐'));
      expect(yi.binary, equals('100001'));
      expect(yi.guaCi, equals('贞吉。观颐，自求口实。'));
      expect(yi.daXiang, equals('山下有雷，颐。君子以慎言语，节饮食。'));
      
      // Verify yao texts count
      expect(yi.yaoTexts.length, equals(6));
      
      // Verify first yao
      expect(yi.yaoTexts[0].position, equals('初九'));
      expect(yi.yaoTexts[0].text, equals('舍尔灵龟，观我朵颐，凶。'));
      
      // Verify last yao
      expect(yi.yaoTexts[5].position, equals('上九'));
      expect(yi.yaoTexts[5].text, equals('由颐，厉，吉。利涉大川。'));
    });
    
    test('Qian (Hexagram 1) data integrity', () {
      final qian = allHexagrams[0];
      
      expect(qian.number, equals(1));
      expect(qian.name, equals('乾'));
      expect(qian.guaCi, equals('乾。元亨，利贞。'));
      expect(qian.yaoTexts.length, equals(6));
      expect(qian.yaoTexts[0].text, equals('潜龙勿用。'));
      expect(qian.yaoTexts[4].text, equals('飞龙在天，利见大人。'));
    });
    
    test('Kun (Hexagram 2) data integrity', () {
      final kun = allHexagrams[1];
      
      expect(kun.number, equals(2));
      expect(kun.name, equals('坤'));
      expect(kun.guaCi.contains('元亨'), isTrue);
      expect(kun.yaoTexts.length, equals(6));
      expect(kun.yaoTexts[0].text, equals('履霜，坚冰至。'));
    });
    
    test('All 64 hexagrams data integrity check', () {
      expect(allHexagrams.length, equals(64));
      
      for (final hex in allHexagrams) {
        // Verify basic fields are not empty
        expect(hex.number, greaterThan(0));
        expect(hex.number, lessThanOrEqualTo(64));
        expect(hex.name.isNotEmpty, isTrue);
        expect(hex.fullName.isNotEmpty, isTrue);
        expect(hex.binary.length, equals(6));
        expect(hex.guaCi.isNotEmpty, isTrue);
        expect(hex.guaCiTranslation.isNotEmpty, isTrue);
        expect(hex.daXiang.isNotEmpty, isTrue);
        expect(hex.yaoTexts.length, equals(6));
        expect(hex.keywords.isNotEmpty, isTrue);
        
        // Verify each yao text
        for (final yao in hex.yaoTexts) {
          expect(yao.position.isNotEmpty, isTrue);
          expect(yao.text.isNotEmpty, isTrue);
          expect(yao.translation.isNotEmpty, isTrue);
        }
      }
    });
  });
}
