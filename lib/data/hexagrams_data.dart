// 六十四卦数据

import '../models/types.dart';

final List<Hexagram> allHexagrams = [
  Hexagram(
    number: 1, name: '乾', fullName: '乾为天',
    upperTrigram: GuaName.qian, lowerTrigram: GuaName.qian,
    binary: '111111', unicode: '\u4DC0',
    guaCi: '乾。元亨，利贞。',
    guaCiTranslation: '乾卦。至为亨通，利于守持正固。',
    daXiang: '天行健，君子以自强不息。',
    yaoTexts: [], keywords: [],
    palace: GuaName.qian, palaceOrder: 1, worldLine: 6, responseLine: 3,
  ),
  Hexagram(
    number: 2, name: '坤', fullName: '坤为地',
    upperTrigram: GuaName.kun, lowerTrigram: GuaName.kun,
    binary: '000000', unicode: '\u4DC1',
    guaCi: '坤。元亨，利牝马之贞。',
    guaCiTranslation: '坤卦。至为亨通，利于像母马那样守持正固。',
    daXiang: '地势坤，君子以厚德载物。',
    yaoTexts: [], keywords: [],
    palace: GuaName.kun, palaceOrder: 1, worldLine: 6, responseLine: 3,
  ),
  Hexagram(
    number: 29, name: '坎', fullName: '坎为水',
    upperTrigram: GuaName.kan, lowerTrigram: GuaName.kan,
    binary: '010010', unicode: '\u4DDC',
    guaCi: '坎。有孚，维心亨，行有尚。',
    guaCiTranslation: '坎卦。有诚信，内心亨通，行动会有功赏。',
    daXiang: '水洊至，习坎。君子以常德行，习教事。',
    yaoTexts: [], keywords: [],
    palace: GuaName.kan, palaceOrder: 1, worldLine: 5, responseLine: 2,
  ),
  Hexagram(
    number: 30, name: '离', fullName: '离为火',
    upperTrigram: GuaName.li, lowerTrigram: GuaName.li,
    binary: '101101', unicode: '\u4DDD',
    guaCi: '离。利贞，亨。畜牝牛，吉。',
    guaCiTranslation: '离卦。利于守正，亨通。蓄养母牛，吉祥。',
    daXiang: '明两作，离。大人以继明照于四方。',
    yaoTexts: [], keywords: [],
    palace: GuaName.li, palaceOrder: 1, worldLine: 3, responseLine: 6,
  ),
  Hexagram(
    number: 51, name: '震', fullName: '震为雷',
    upperTrigram: GuaName.zhen, lowerTrigram: GuaName.zhen,
    binary: '100100', unicode: '\u4DF3',
    guaCi: '震。亨。震来虩虩，笑言哑哑。震惊百里，不丧匕鬯。',
    guaCiTranslation: '震卦。亨通。雷声震动令人恐惧，但能保持谈笑自若。雷声震惊百里，却不会失落手中的祭器。',
    daXiang: '洊雷，震。君子以恐惧修身。',
    yaoTexts: [], keywords: [],
    palace: GuaName.zhen, palaceOrder: 1, worldLine: 1, responseLine: 4,
  ),
  Hexagram(
    number: 52, name: '艮', fullName: '艮为山',
    upperTrigram: GuaName.gen, lowerTrigram: GuaName.gen,
    binary: '001001', unicode: '\u4DF4',
    guaCi: '艮其背，不获其身，行其庭，不见其人，无咎。',
    guaCiTranslation: '艮卦。止于背部，不显露自身，行走在庭院中却不见其人，无过咎。',
    daXiang: '兼山，艮。君子以思不出其位。',
    yaoTexts: [], keywords: [],
    palace: GuaName.gen, palaceOrder: 1, worldLine: 3, responseLine: 6,
  ),
  Hexagram(
    number: 57, name: '巽', fullName: '巽为风',
    upperTrigram: GuaName.xun, lowerTrigram: GuaName.xun,
    binary: '011011', unicode: '\u4DF9',
    guaCi: '巽。小亨，利有攸往，利见大人。',
    guaCiTranslation: '巽卦。稍有亨通，利于有所前往，利于拜见大德之人。',
    daXiang: '随风，巽。君子以申命行事。',
    yaoTexts: [], keywords: [],
    palace: GuaName.xun, palaceOrder: 1, worldLine: 4, responseLine: 1,
  ),
  Hexagram(
    number: 58, name: '兑', fullName: '兑为泽',
    upperTrigram: GuaName.dui, lowerTrigram: GuaName.dui,
    binary: '110110', unicode: '\u4DFA',
    guaCi: '兑。亨，利贞。',
    guaCiTranslation: '兑卦。亨通，利于守正。',
    daXiang: '丽泽，兑。君子以朋友讲习。',
    yaoTexts: [], keywords: [],
    palace: GuaName.dui, palaceOrder: 1, worldLine: 3, responseLine: 6,
  ),
];

final Map<String, Hexagram> binaryToHexagram = {
  for (var h in allHexagrams) h.binary: h
};

final Map<int, Hexagram> numberToHexagram = {
  for (var h in allHexagrams) h.number: h
};
