// 行为验证测试 - 与 Node.js 版本对比
import 'package:flutter_test/flutter_test.dart';
import 'package:zhouyi/models/types.dart';
import 'package:zhouyi/core/divination.dart';
import 'package:zhouyi/core/analysis.dart';
import 'package:zhouyi/core/calendar.dart';
import 'package:zhouyi/data/trigrams_data.dart';

void main() {
  group('周易行为验证测试', () {
    
    test('【测试1】梅花易数 - 数字起卦', () {
      print('\n【测试1】梅花易数 - 数字起卦');
      print('输入: num1=123, num2=456');
      
      final result = meihuaNumberMethod(123, 456);
      final yaoValues = result.yaoValues.map((y) => y.value).toList();
      
      print('爻值: $yaoValues');
      // 123%8=3->离, 456%8=0->8->坤, (123+456)%6=3
      // 下卦坤000=678, 上卦离101=787, 动爻3
      print('期望: [7,8,6,7,8,7] 或 [8,8,6,7,8,7] (下卦坤000, 上卦离101, 动爻3)');
      
      // 验证：应该有1个变爻（动爻）
      final changingCount = result.yaoValues.where((y) => y.isChanging).length;
      expect(changingCount, equals(1));
      
      // 验证动爻位置
      final changingLine = result.yaoValues.indexWhere((y) => y.isChanging) + 1;
      expect(changingLine, equals(3));
    });

    test('【测试2】日历计算', () {
      print('\n【测试2】日历计算');
      
      final timeInfo = getDivinationTime(DateTime(2026, 3, 8, 18, 51, 7));
      print('时间信息: ${timeInfo.display}');
      print('日干: ${timeInfo.dayGan.displayName}, 日支: ${timeInfo.dayZhi.displayName}, 月建: ${timeInfo.monthZhi.displayName}');
      
      // 验证：2026年3月8日应该是辛巳日
      expect(timeInfo.dayGan, equals(TianGan.xin));
      expect(timeInfo.dayZhi, equals(DiZhi.si));
    });

    test('【测试3】八卦识别', () {
      print('\n【测试3】八卦识别');
      
      // 乾卦 111111 - 全老阳
      final yaoValues = [
        YaoValue.oldYang, YaoValue.oldYang, YaoValue.oldYang,
        YaoValue.oldYang, YaoValue.oldYang, YaoValue.oldYang,
      ];
      final yinyangs = yaoValues.map(yaoToYinYang).toList();
      final hexInfo = identifyHexagram(yinyangs);
      
      print('爻值: ${yaoValues.map((y) => y.value).toList()} -> 阴阳: $yinyangs');
      print('上卦: ${hexInfo.upper.displayName}, 下卦: ${hexInfo.lower.displayName}, 二进制: ${hexInfo.binary}');
      
      expect(hexInfo.upper, equals(GuaName.qian));
      expect(hexInfo.lower, equals(GuaName.qian));
      expect(hexInfo.binary, equals('111111'));
    });

    test('【测试4】纳甲表验证', () {
      print('\n【测试4】纳甲表验证');
      
      final qianNajia = najiaTable[GuaName.qian]!;
      final kunNajia = najiaTable[GuaName.kun]!;
      
      print('乾卦纳甲: 干=${qianNajia.gan.map((g) => g.displayName).toList()}, 支=${qianNajia.zhi.map((z) => z.displayName).toList()}');
      print('坤卦纳甲: 干=${kunNajia.gan.map((g) => g.displayName).toList()}, 支=${kunNajia.zhi.map((z) => z.displayName).toList()}');
      
      // 验证乾卦纳甲
      expect(qianNajia.gan[0], equals(TianGan.jia));
      expect(qianNajia.zhi[0], equals(DiZhi.zi));
      
      // 验证坤卦纳甲
      expect(kunNajia.gan[0], equals(TianGan.yi));
      expect(kunNajia.zhi[0], equals(DiZhi.wei));
    });

    test('【测试5】六亲推导', () {
      print('\n【测试5】六亲推导（宫五行为金）');
      
      const palaceElement = WuXing.metal;
      final testElements = [
        WuXing.metal, WuXing.water, WuXing.wood, WuXing.fire, WuXing.earth
      ];
      
      for (final el in testElements) {
        final liuQin = getLiuQin(palaceElement, el);
        print('  ${palaceElement.displayName} 见 ${el.displayName} -> ${liuQin.displayName}');
      }
      
      // 验证
      expect(getLiuQin(WuXing.metal, WuXing.metal), equals(LiuQin.sibling));
      expect(getLiuQin(WuXing.metal, WuXing.water), equals(LiuQin.child));
      expect(getLiuQin(WuXing.metal, WuXing.wood), equals(LiuQin.wealth));
      expect(getLiuQin(WuXing.metal, WuXing.fire), equals(LiuQin.officer));
      expect(getLiuQin(WuXing.metal, WuXing.earth), equals(LiuQin.parent));
    });

    test('【测试6】六神配置', () {
      print('\n【测试6】六神配置');
      
      final liuShenArray = getLiuShenArray(TianGan.jia);
      print('日干: 甲 -> 六神: ${liuShenArray.map((s) => s.displayName).toList()}');
      
      expect(liuShenArray[0], equals(LiuShen.qinglong));
      expect(liuShenArray[1], equals(LiuShen.zhuque));
      expect(liuShenArray[2], equals(LiuShen.gouchen));
      expect(liuShenArray[3], equals(LiuShen.tengshe));
      expect(liuShenArray[4], equals(LiuShen.baihu));
      expect(liuShenArray[5], equals(LiuShen.xuanwu));
    });

    test('【测试7】旬空计算', () {
      print('\n【测试7】旬空计算');
      
      final testCases = [
        (TianGan.jia, DiZhi.zi, [DiZhi.xu, DiZhi.hai]),
        (TianGan.bing, DiZhi.yin, [DiZhi.xu, DiZhi.hai]),
        (TianGan.wu, DiZhi.chen, [DiZhi.xu, DiZhi.hai]),
        (TianGan.geng, DiZhi.wu, [DiZhi.xu, DiZhi.hai]),
        (TianGan.ren, DiZhi.shen, [DiZhi.xu, DiZhi.hai]),
        (TianGan.jia, DiZhi.xu, [DiZhi.shen, DiZhi.you]),
      ];
      
      for (final (gan, zhi, expected) in testCases) {
        final xunkong = getEmptyBranches(gan, zhi);
        print('  ${gan.displayName}${zhi.displayName}日 -> 旬空: ${xunkong.map((z) => z.displayName).join(',')}');
        expect(xunkong, equals(expected));
      }
    });

    test('【测试8】完整分析流程', () {
      print('\n【测试8】完整分析流程');
      
      // 模拟起卦结果 [9,8,7,6,8,7] - 初爻老阳，四爻老阴 -> 两个变爻
      final mockResult = DivinationResult(
        yaoValues: [
          YaoValue.oldYang,   // 9 - 初爻
          YaoValue.youngYin,  // 8
          YaoValue.youngYang, // 7
          YaoValue.oldYin,    // 6 - 四爻
          YaoValue.youngYin,  // 8
          YaoValue.youngYang, // 7
        ],
        method: DivinationMethod.coin,
        datetime: DateTime(2026, 3, 8, 18, 51, 7),
      );
      
      final timeInfo = getDivinationTime(DateTime(2026, 3, 8, 18, 51, 7));
      
      final analysis = analyzeHexagram(
        result: mockResult,
        dayGan: timeInfo.dayGan,
        dayZhi: timeInfo.dayZhi,
        monthZhi: timeInfo.monthZhi,
        worldLine: 6,
        responseLine: 3,
        questionType: QuestionType.career,
        question: '测试问题',
        palace: GuaName.qian,
      );
      
      print('本卦: ${analysis.originalHexagram.fullName}');
      print('之卦: ${analysis.changedHexagram?.fullName ?? '无'}');
      print('变爻数: ${analysis.changingCount}');
      print('变爻位置: ${analysis.changingLines}');
      print('断卦规则: ${analysis.interpretationRule}');
      
      expect(analysis.changingCount, equals(2));
      expect(analysis.changingLines, equals([1, 4]));
    });
  });
}
