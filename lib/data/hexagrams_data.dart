// 六十四卦完整数据

import '../models/types.dart';

// 六十四卦Unicode映射（根据文王卦序）
// 范围：U+4DC0 - U+4DFF
const List<String> _hexagramUnicode = [
  '\u4DC0', '\u4DC1', '\u4DC2', '\u4DC3', '\u4DC4', '\u4DC5', '\u4DC6', '\u4DC7',
  '\u4DC8', '\u4DC9', '\u4DCA', '\u4DCB', '\u4DCC', '\u4DCD', '\u4DCE', '\u4DCF',
  '\u4DD0', '\u4DD1', '\u4DD2', '\u4DD3', '\u4DD4', '\u4DD5', '\u4DD6', '\u4DD7',
  '\u4DD8', '\u4DD9', '\u4DDA', '\u4DDB', '\u4DDC', '\u4DDD', '\u4DDE', '\u4DDF',
  '\u4DE0', '\u4DE1', '\u4DE2', '\u4DE3', '\u4DE4', '\u4DE5', '\u4DE6', '\u4DE7',
  '\u4DE8', '\u4DE9', '\u4DEA', '\u4DEB', '\u4DEC', '\u4DED', '\u4DEE', '\u4DEF',
  '\u4DF0', '\u4DF1', '\u4DF2', '\u4DF3', '\u4DF4', '\u4DF5', '\u4DF6', '\u4DF7',
  '\u4DF8', '\u4DF9', '\u4DFA', '\u4DFB', '\u4DFC', '\u4DFD', '\u4DFE', '\u4DFF',
];

// 六十四卦名称映射（根据文王卦序）
const List<String> _hexagramNames = [
  '乾', '坤', '屯', '蒙', '需', '讼', '师', '比',
  '小畜', '履', '泰', '否', '同人', '大有', '谦', '豫',
  '随', '蛊', '临', '观', '噬嗑', '贲', '剥', '复',
  '无妄', '大畜', '颐', '大过', '坎', '离', '咸', '恒',
  '遁', '大壮', '晋', '明夷', '家人', '睽', '蹇', '解',
  '损', '益', '夬', '姤', '萃', '升', '困', '井',
  '革', '鼎', '震', '艮', '渐', '归妹', '丰', '旅',
  '巽', '兑', '涣', '节', '中孚', '小过', '既济', '未济',
];

// 六十四卦全称映射
const List<String> _hexagramFullNames = [
  '乾为天', '坤为地', '水雷屯', '山水蒙', '水天需', '天水讼', '地水师', '水地比',
  '风天小畜', '天泽履', '地天泰', '天地否', '天火同人', '火天大有', '地山谦', '雷地豫',
  '泽雷随', '山风蛊', '地泽临', '风地观', '火雷噬嗑', '山火贲', '山地剥', '地雷复',
  '天雷无妄', '山天大畜', '山雷颐', '泽风大过', '坎为水', '离为火', '泽山咸', '雷风恒',
  '天山遁', '雷天大壮', '火地晋', '地火明夷', '风火家人', '火泽睽', '水山蹇', '雷水解',
  '山泽损', '风雷益', '泽天夬', '天风姤', '泽地萃', '地风升', '泽水困', '水风井',
  '泽火革', '火风鼎', '震为雷', '艮为山', '风山渐', '雷泽归妹', '雷火丰', '火山旅',
  '巽为风', '兑为泽', '风水涣', '水泽节', '风泽中孚', '雷山小过', '水火既济', '火水未济',
];

// 上卦映射（根据文王卦序）
const List<GuaName> _upperTrigrams = [
  GuaName.qian, GuaName.kun, GuaName.kan, GuaName.gen, GuaName.kan, GuaName.qian, GuaName.kun, GuaName.kan,
  GuaName.xun, GuaName.qian, GuaName.kun, GuaName.qian, GuaName.qian, GuaName.li, GuaName.kun, GuaName.zhen,
  GuaName.dui, GuaName.gen, GuaName.kun, GuaName.xun, GuaName.li, GuaName.gen, GuaName.gen, GuaName.kun,
  GuaName.qian, GuaName.gen, GuaName.gen, GuaName.dui, GuaName.kan, GuaName.li, GuaName.dui, GuaName.zhen,
  GuaName.qian, GuaName.zhen, GuaName.li, GuaName.kun, GuaName.xun, GuaName.li, GuaName.kan, GuaName.zhen,
  GuaName.gen, GuaName.xun, GuaName.dui, GuaName.qian, GuaName.dui, GuaName.kun, GuaName.dui, GuaName.kan,
  GuaName.dui, GuaName.li, GuaName.zhen, GuaName.gen, GuaName.xun, GuaName.zhen, GuaName.zhen, GuaName.li,
  GuaName.xun, GuaName.dui, GuaName.xun, GuaName.kan, GuaName.xun, GuaName.zhen, GuaName.kan, GuaName.li,
];

// 下卦映射（根据文王卦序）
const List<GuaName> _lowerTrigrams = [
  GuaName.qian, GuaName.kun, GuaName.zhen, GuaName.kan, GuaName.qian, GuaName.kan, GuaName.kun, GuaName.kun,
  GuaName.qian, GuaName.dui, GuaName.qian, GuaName.kun, GuaName.li, GuaName.qian, GuaName.gen, GuaName.kun,
  GuaName.zhen, GuaName.xun, GuaName.dui, GuaName.kun, GuaName.zhen, GuaName.li, GuaName.kun, GuaName.zhen,
  GuaName.zhen, GuaName.qian, GuaName.zhen, GuaName.xun, GuaName.kan, GuaName.li, GuaName.gen, GuaName.xun,
  GuaName.gen, GuaName.qian, GuaName.kun, GuaName.li, GuaName.xun, GuaName.dui, GuaName.gen, GuaName.kan,
  GuaName.dui, GuaName.zhen, GuaName.qian, GuaName.xun, GuaName.kun, GuaName.xun, GuaName.kan, GuaName.xun,
  GuaName.li, GuaName.xun, GuaName.zhen, GuaName.gen, GuaName.gen, GuaName.dui, GuaName.li, GuaName.gen,
  GuaName.xun, GuaName.dui, GuaName.kan, GuaName.dui, GuaName.dui, GuaName.gen, GuaName.li, GuaName.kan,
];

// 二进制映射（根据文王卦序，从初爻到上爻）
const List<String> _binaryCodes = [
  '111111', '000000', '100010', '010001', '111010', '010111', '000010', '010000',
  '111011', '110111', '111000', '000111', '101111', '111101', '001000', '000100',
  '100011', '011001', '000110', '011000', '101001', '100101', '000001', '100000',
  '100111', '111100', '100001', '011110', '010010', '101101', '110100', '100110',
  '001111', '100111', '000101', '101000', '011011', '101110', '010100', '001010',
  '001101', '110001', '011111', '111110', '011000', '000110', '010110', '011010',
  '011101', '101011', '100100', '001001', '001011', '110100', '101100', '001101',
  '011011', '110110', '110010', '010110', '011011', '001100', '010101', '101010',
];

// 生成完整的六十四卦数据
List<Hexagram> _generateAllHexagrams() {
  final List<Hexagram> hexagrams = [];
  
  for (int i = 0; i < 64; i++) {
    hexagrams.add(Hexagram(
      number: i + 1,
      name: _hexagramNames[i],
      fullName: _hexagramFullNames[i],
      upperTrigram: _upperTrigrams[i],
      lowerTrigram: _lowerTrigrams[i],
      binary: _binaryCodes[i],
      unicode: _hexagramUnicode[i],
      guaCi: '',
      guaCiTranslation: '',
      daXiang: '',
      yaoTexts: const [],
      keywords: const [],
      palace: _upperTrigrams[i], // 简化处理，使用上卦作为宫
      palaceOrder: 1,
      worldLine: 6, // 默认值
      responseLine: 3, // 默认值
    ));
  }
  
  return hexagrams;
}

// 完整的六十四卦数据
final List<Hexagram> allHexagrams = _generateAllHexagrams();

// 通过二进制查找卦
final Map<String, Hexagram> binaryToHexagram = {
  for (var h in allHexagrams) h.binary: h
};

// 通过卦序查找
final Map<int, Hexagram> numberToHexagram = {
  for (var h in allHexagrams) h.number: h
};

// 通过卦名查找
final Map<String, Hexagram> nameToHexagram = {
  for (var h in allHexagrams) h.name: h
};
