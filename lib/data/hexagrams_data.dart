// Hexagrams data
import '../models/types.dart';

final List<Hexagram> allHexagrams = [
  Hexagram(
    number: 1, name: '?', fullName: '???',
    upperTrigram: GuaName.qian, lowerTrigram: GuaName.qian,
    binary: '111111', unicode: '\u4DC0',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.qian, palaceOrder: 1,
    worldLine: 6, responseLine: 3,
  ),
  Hexagram(
    number: 2, name: '?', fullName: '???',
    upperTrigram: GuaName.kun, lowerTrigram: GuaName.kun,
    binary: '000000', unicode: '\u4DC1',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.kun, palaceOrder: 1,
    worldLine: 6, responseLine: 3,
  ),
  Hexagram(
    number: 29, name: '?', fullName: '???',
    upperTrigram: GuaName.kan, lowerTrigram: GuaName.kan,
    binary: '010010', unicode: '\u4DDC',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.kan, palaceOrder: 1,
    worldLine: 5, responseLine: 2,
  ),
  Hexagram(
    number: 30, name: '?', fullName: '???',
    upperTrigram: GuaName.li, lowerTrigram: GuaName.li,
    binary: '101101', unicode: '\u4DDD',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.li, palaceOrder: 1,
    worldLine: 3, responseLine: 6,
  ),
  Hexagram(
    number: 51, name: '?', fullName: '???',
    upperTrigram: GuaName.zhen, lowerTrigram: GuaName.zhen,
    binary: '100100', unicode: '\u4DF3',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.zhen, palaceOrder: 1,
    worldLine: 1, responseLine: 4,
  ),
  Hexagram(
    number: 52, name: '?', fullName: '???',
    upperTrigram: GuaName.gen, lowerTrigram: GuaName.gen,
    binary: '001001', unicode: '\u4DF4',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.gen, palaceOrder: 1,
    worldLine: 3, responseLine: 6,
  ),
  Hexagram(
    number: 57, name: '?', fullName: '???',
    upperTrigram: GuaName.xun, lowerTrigram: GuaName.xun,
    binary: '011011', unicode: '\u4DF9',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.xun, palaceOrder: 1,
    worldLine: 4, responseLine: 1,
  ),
  Hexagram(
    number: 58, name: '?', fullName: '???',
    upperTrigram: GuaName.dui, lowerTrigram: GuaName.dui,
    binary: '110110', unicode: '\u4DFA',
    guaCi: '', guaCiTranslation: '', daXiang: '',
    yaoTexts: [], keywords: [],
    palace: GuaName.dui, palaceOrder: 1,
    worldLine: 3, responseLine: 6,
  ),
];

final Map<String, Hexagram> binaryToHexagram = {
  for (var h in allHexagrams) h.binary: h
};
