// 周易占卜系统 - 核心类型定义

import 'package:flutter/material.dart';

// 阴阳
enum YinYang { yin, yang }

// 爻值（占卜结果）
// 6=老阴, 7=少阳, 8=少阴, 9=老阳
enum YaoValue {
  oldYin(6),    // 老阴，变爻
  youngYang(7), // 少阳，不变
  youngYin(8),  // 少阴，不变
  oldYang(9);   // 老阳，变爻

  final int value;
  const YaoValue(this.value);

  bool get isChanging => this == YaoValue.oldYin || this == YaoValue.oldYang;
  bool get isYang => this == YaoValue.youngYang || this == YaoValue.oldYang;
  
  static YaoValue fromInt(int value) {
    return YaoValue.values.firstWhere((e) => e.value == value);
  }
}

// 五行
enum WuXing { wood, fire, earth, metal, water }

extension WuXingExtension on WuXing {
  String get displayName {
    switch (this) {
      case WuXing.wood: return '木';
      case WuXing.fire: return '火';
      case WuXing.earth: return '土';
      case WuXing.metal: return '金';
      case WuXing.water: return '水';
    }
  }

  Color get color {
    switch (this) {
      case WuXing.wood: return const Color(0xFF4CAF50);
      case WuXing.fire: return const Color(0xFFF44336);
      case WuXing.earth: return const Color(0xFF795548);
      case WuXing.metal: return const Color(0xFFFFD700);
      case WuXing.water: return const Color(0xFF2196F3);
    }
  }
}

// 六亲
enum LiuQin { parent, sibling, child, wealth, officer }

extension LiuQinExtension on LiuQin {
  String get displayName {
    switch (this) {
      case LiuQin.parent: return '父母';
      case LiuQin.sibling: return '兄弟';
      case LiuQin.child: return '子孙';
      case LiuQin.wealth: return '妻财';
      case LiuQin.officer: return '官鬼';
    }
  }
}

// 六神
enum LiuShen { qinglong, zhuque, gouchen, tengshe, baihu, xuanwu }

extension LiuShenExtension on LiuShen {
  String get displayName {
    switch (this) {
      case LiuShen.qinglong: return '青龙';
      case LiuShen.zhuque: return '朱雀';
      case LiuShen.gouchen: return '勾陈';
      case LiuShen.tengshe: return '螣蛇';
      case LiuShen.baihu: return '白虎';
      case LiuShen.xuanwu: return '玄武';
    }
  }

  Color get color {
    switch (this) {
      case LiuShen.qinglong: return const Color(0xFF4CAF50);
      case LiuShen.zhuque: return const Color(0xFFF44336);
      case LiuShen.gouchen: return const Color(0xFF795548);
      case LiuShen.tengshe: return const Color(0xFF9C27B0);
      case LiuShen.baihu: return const Color(0xFF607D8B);
      case LiuShen.xuanwu: return const Color(0xFF2196F3);
    }
  }
}

// 天干
enum TianGan { jia, yi, bing, ding, wu, ji, geng, xin, ren, gui }

extension TianGanExtension on TianGan {
  String get displayName {
    switch (this) {
      case TianGan.jia: return '甲';
      case TianGan.yi: return '乙';
      case TianGan.bing: return '丙';
      case TianGan.ding: return '丁';
      case TianGan.wu: return '戊';
      case TianGan.ji: return '己';
      case TianGan.geng: return '庚';
      case TianGan.xin: return '辛';
      case TianGan.ren: return '壬';
      case TianGan.gui: return '癸';
    }
  }

  WuXing get element {
    switch (this) {
      case TianGan.jia:
      case TianGan.yi:
        return WuXing.wood;
      case TianGan.bing:
      case TianGan.ding:
        return WuXing.fire;
      case TianGan.wu:
      case TianGan.ji:
        return WuXing.earth;
      case TianGan.geng:
      case TianGan.xin:
        return WuXing.metal;
      case TianGan.ren:
      case TianGan.gui:
        return WuXing.water;
    }
  }
}

// 地支
enum DiZhi { zi, chou, yin, mao, chen, si, wu, wei, shen, you, xu, hai }

extension DiZhiExtension on DiZhi {
  String get displayName {
    switch (this) {
      case DiZhi.zi: return '子';
      case DiZhi.chou: return '丑';
      case DiZhi.yin: return '寅';
      case DiZhi.mao: return '卯';
      case DiZhi.chen: return '辰';
      case DiZhi.si: return '巳';
      case DiZhi.wu: return '午';
      case DiZhi.wei: return '未';
      case DiZhi.shen: return '申';
      case DiZhi.you: return '酉';
      case DiZhi.xu: return '戌';
      case DiZhi.hai: return '亥';
    }
  }

  WuXing get element {
    switch (this) {
      case DiZhi.yin:
      case DiZhi.mao:
        return WuXing.wood;
      case DiZhi.si:
      case DiZhi.wu:
        return WuXing.fire;
      case DiZhi.chen:
      case DiZhi.chou:
      case DiZhi.wei:
      case DiZhi.xu:
        return WuXing.earth;
      case DiZhi.shen:
      case DiZhi.you:
        return WuXing.metal;
      case DiZhi.zi:
      case DiZhi.hai:
        return WuXing.water;
    }
  }
}

// 八卦名
enum GuaName { qian, dui, li, zhen, xun, kan, gen, kun }

extension GuaNameExtension on GuaName {
  String get displayName {
    switch (this) {
      case GuaName.qian: return '乾';
      case GuaName.dui: return '兑';
      case GuaName.li: return '离';
      case GuaName.zhen: return '震';
      case GuaName.xun: return '巽';
      case GuaName.kan: return '坎';
      case GuaName.gen: return '艮';
      case GuaName.kun: return '坤';
    }
  }

  String get symbol {
    switch (this) {
      case GuaName.qian: return '☰';
      case GuaName.dui: return '☱';
      case GuaName.li: return '☲';
      case GuaName.zhen: return '☳';
      case GuaName.xun: return '☴';
      case GuaName.kan: return '☵';
      case GuaName.gen: return '☶';
      case GuaName.kun: return '☷';
    }
  }

  WuXing get element {
    switch (this) {
      case GuaName.qian:
      case GuaName.dui:
        return WuXing.metal;
      case GuaName.li:
        return WuXing.fire;
      case GuaName.zhen:
      case GuaName.xun:
        return WuXing.wood;
      case GuaName.kan:
        return WuXing.water;
      case GuaName.gen:
      case GuaName.kun:
        return WuXing.earth;
    }
  }

  String get binary {
    switch (this) {
      case GuaName.qian: return '111';
      case GuaName.dui: return '110';
      case GuaName.li: return '101';
      case GuaName.zhen: return '100';
      case GuaName.xun: return '011';
      case GuaName.kan: return '010';
      case GuaName.gen: return '001';
      case GuaName.kun: return '000';
    }
  }

  // 先天八卦数 1-8
  int get xiantianIndex {
    switch (this) {
      case GuaName.qian: return 1;
      case GuaName.dui: return 2;
      case GuaName.li: return 3;
      case GuaName.zhen: return 4;
      case GuaName.xun: return 5;
      case GuaName.kan: return 6;
      case GuaName.gen: return 7;
      case GuaName.kun: return 8;
    }
  }
}

// 问事类型
enum QuestionType { career, wealth, marriage, health, exam, travel, lawsuit, other }

extension QuestionTypeExtension on QuestionType {
  String get displayName {
    switch (this) {
      case QuestionType.career: return '事业';
      case QuestionType.wealth: return '财运';
      case QuestionType.marriage: return '婚姻';
      case QuestionType.health: return '健康';
      case QuestionType.exam: return '考试';
      case QuestionType.travel: return '出行';
      case QuestionType.lawsuit: return '诉讼';
      case QuestionType.other: return '其他';
    }
  }

  LiuQin? get yongShen {
    switch (this) {
      case QuestionType.career:
      case QuestionType.health:
      case QuestionType.lawsuit:
        return LiuQin.officer;
      case QuestionType.wealth:
      case QuestionType.marriage:
        return LiuQin.wealth;
      case QuestionType.exam:
      case QuestionType.travel:
        return LiuQin.parent;
      case QuestionType.other:
        return null;
    }
  }
}

// 起卦方式
enum DivinationMethod { coin, dayan, meihuaTime, meihuaNumber }

extension DivinationMethodExtension on DivinationMethod {
  String get displayName {
    switch (this) {
      case DivinationMethod.coin: return '铜钱法';
      case DivinationMethod.dayan: return '大衍筮法';
      case DivinationMethod.meihuaTime: return '梅花易数(时间)';
      case DivinationMethod.meihuaNumber: return '梅花易数(数字)';
    }
  }

  String get description {
    switch (this) {
      case DivinationMethod.coin:
        return '三枚铜钱投掷六次，概率对称，简便快捷';
      case DivinationMethod.dayan:
        return '模拟49根蓍草，十八变成卦，古法正统';
      case DivinationMethod.meihuaTime:
        return '以年月日时起卦，随感而占';
      case DivinationMethod.meihuaNumber:
        return '以数字取卦，万物皆有数';
    }
  }
}

// 八卦（经卦/三画卦）
class Trigram {
  final GuaName name;
  final String nature;
  final String attribute;
  final String family;
  final String body;
  final String animal;

  const Trigram({
    required this.name,
    required this.nature,
    required this.attribute,
    required this.family,
    required this.body,
    required this.animal,
  });
}

// 爻辞
class YaoText {
  final String position;
  final String text;
  final String translation;

  const YaoText({
    required this.position,
    required this.text,
    required this.translation,
  });
}

// 六十四卦
class Hexagram {
  final int number;
  final String name;
  final String fullName;
  final GuaName upperTrigram;
  final GuaName lowerTrigram;
  final String binary;
  final String unicode;
  final String guaCi;
  final String guaCiTranslation;
  final String daXiang;
  final List<YaoText> yaoTexts;
  final String? yongText;
  final List<String> keywords;
  final GuaName palace;
  final int palaceOrder;
  final int worldLine;
  final int responseLine;

  const Hexagram({
    required this.number,
    required this.name,
    required this.fullName,
    required this.upperTrigram,
    required this.lowerTrigram,
    required this.binary,
    required this.unicode,
    required this.guaCi,
    required this.guaCiTranslation,
    required this.daXiang,
    required this.yaoTexts,
    this.yongText,
    required this.keywords,
    required this.palace,
    required this.palaceOrder,
    required this.worldLine,
    required this.responseLine,
  });
}

// 单爻信息（装卦后）
class YaoInfo {
  final int position;
  final YinYang yinyang;
  final bool changing;
  final TianGan tianGan;
  final DiZhi diZhi;
  final WuXing element;
  final LiuQin liuQin;
  final LiuShen liuShen;
  final bool isWorld;
  final bool isResponse;
  final bool isEmpty;

  const YaoInfo({
    required this.position,
    required this.yinyang,
    required this.changing,
    required this.tianGan,
    required this.diZhi,
    required this.element,
    required this.liuQin,
    required this.liuShen,
    required this.isWorld,
    required this.isResponse,
    required this.isEmpty,
  });
}

// 起卦结果
class DivinationResult {
  final List<YaoValue> yaoValues;
  final DivinationMethod method;
  final DateTime datetime;

  const DivinationResult({
    required this.yaoValues,
    required this.method,
    required this.datetime,
  });
}

// 装卦分析结果
class HexagramAnalysis {
  final Hexagram originalHexagram;
  final Hexagram? changedHexagram;
  final Hexagram mutualHexagram;
  final List<YaoInfo> yaoInfos;
  final List<int> changingLines;
  final int changingCount;
  final String interpretationRule;
  final List<String> relevantTexts;
  final String? question;
  final QuestionType? questionType;
  final DivinationMethod method;
  final DateTime datetime;
  final TianGan dayGan;
  final DiZhi dayZhi;
  final DiZhi monthZhi;

  const HexagramAnalysis({
    required this.originalHexagram,
    this.changedHexagram,
    required this.mutualHexagram,
    required this.yaoInfos,
    required this.changingLines,
    required this.changingCount,
    required this.interpretationRule,
    required this.relevantTexts,
    this.question,
    this.questionType,
    required this.method,
    required this.datetime,
    required this.dayGan,
    required this.dayZhi,
    required this.monthZhi,
  });
}

// 占卜时间信息
class DivinationTime {
  final TianGan dayGan;
  final DiZhi dayZhi;
  final DiZhi monthZhi;
  final DiZhi shiChen;
  final String shiChenName;
  final String display;

  const DivinationTime({
    required this.dayGan,
    required this.dayZhi,
    required this.monthZhi,
    required this.shiChen,
    required this.shiChenName,
    required this.display,
  });
}
