// ???????????
import '../models/types.dart';
import '../data/trigrams_data.dart';
import '../data/hexagrams_data.dart';

/// ?????
YinYang yaoToYinYang(YaoValue value) {
  return value.isYang ? YinYang.yang : YinYang.yin;
}

/// ??????
bool isChanging(YaoValue value) {
  return value.isChanging;
}

/// ?6?????????
({GuaName upper, GuaName lower, String binary}) identifyHexagram(List<YinYang> yinyangs) {
  final binary = yinyangs.map((y) => y == YinYang.yang ? '1' : '0').join();
  final lowerBin = binary.substring(0, 3);
  final upperBin = binary.substring(3, 6);
  return (
    upper: binaryToTrigram[upperBin]!,
    lower: binaryToTrigram[lowerBin]!,
    binary: binary,
  );
}

/// ????????????
List<YinYang> getChangedYinYangs(List<YaoValue> yaoValues) {
  return yaoValues.map((v) {
    if (v == YaoValue.oldYang) return YinYang.yin;
    if (v == YaoValue.oldYin) return YinYang.yang;
    if (v == YaoValue.youngYang) return YinYang.yang;
    return YinYang.yin;
  }).toList();
}

/// ????????
List<YinYang> getMutualYinYangs(List<YinYang> yinyangs) {
  return [
    yinyangs[1], yinyangs[2], yinyangs[3],
    yinyangs[2], yinyangs[3], yinyangs[4],
  ];
}

/// 获取变爻解读规则说明
String getInterpretationRule(int changingCount) {
  const rules = {
    0: '无变爻（静卦），以本卦卦辞断。',
    1: '一爻变，以本卦变爻之爻辞断。',
    2: '两爻变，以本卦两变爻爻辞断，上爻为主。',
    3: '三爻变，以本卦卦辞和之卦卦辞断，本卦为主。',
    4: '四爻变，以之卦两不变爻爻辞断，下爻为主。',
    5: '五爻变，以之卦不变爻之爻辞断。',
    6: '六爻全变。乾坤看用九/用六，其他看之卦卦辞。',
  };
  return rules[changingCount] ?? '';
}

/// ??????????
HexagramAnalysis analyzeHexagram({
  required DivinationResult result,
  required TianGan dayGan,
  required DiZhi dayZhi,
  required DiZhi monthZhi,
  int worldLine = 6,
  int responseLine = 3,
  QuestionType? questionType,
  String? question,
  GuaName? palace,
}) {
  final yaoValues = result.yaoValues;
  
  // 1. ????
  final originalYinYangs = yaoValues.map(yaoToYinYang).toList();
  final hexInfo = identifyHexagram(originalYinYangs);
  final originalBinary = hexInfo.binary;
  final upper = hexInfo.upper;
  final lower = hexInfo.lower;
  
  // 2. ????
  final changingLines = <int>[];
  for (int i = 0; i < 6; i++) {
    if (isChanging(yaoValues[i])) changingLines.add(i + 1);
  }
  final changingCount = changingLines.length;
  
  // 3. ????
  String? changedBinary;
  if (changingCount > 0) {
    final changedYinYangs = getChangedYinYangs(yaoValues);
    changedBinary = changedYinYangs.map((y) => y == YinYang.yang ? '1' : '0').join();
  }
  
  // 4. ????
  final mutualYinYangs = getMutualYinYangs(originalYinYangs);
  final mutualBinary = mutualYinYangs.map((y) => y == YinYang.yang ? '1' : '0').join();
  
  // 5. ????
  final lowerNajia = najiaTable[lower]!;
  final upperNajia = najiaTable[upper]!;
  
  // 6. ??????
  final palaceElement = (palace ?? upper).element;
  
  // 7. ????
  final liuShenArray = getLiuShenArray(dayGan);
  
  // 8. ????
  final emptyBranches = getEmptyBranches(dayGan, dayZhi);
  
  // 9. ?????
  final yaoInfos = <YaoInfo>[];
  for (int i = 0; i < 6; i++) {
    final position = i + 1;
    final yinyang = yaoToYinYang(yaoValues[i]);
    final changing = isChanging(yaoValues[i]);
    
    final TianGan tianGan;
    final DiZhi diZhi;
    if (i < 3) {
      tianGan = lowerNajia.gan[i];
      diZhi = lowerNajia.zhi[i];
    } else {
      tianGan = upperNajia.gan[i - 3];
      diZhi = upperNajia.zhi[i - 3];
    }
    
    final element = diZhi.element;
    final liuQin = getLiuQin(palaceElement, element);
    final liuShen = liuShenArray[i];
    final isEmpty = emptyBranches.contains(diZhi);
    
    yaoInfos.add(YaoInfo(
      position: position,
      yinyang: yinyang,
      changing: changing,
      tianGan: tianGan,
      diZhi: diZhi,
      element: element,
      liuQin: liuQin,
      liuShen: liuShen,
      isWorld: position == worldLine,
      isResponse: position == responseLine,
      isEmpty: isEmpty,
    ));
  }
  
  // 10. ????
  final interpretationRule = getInterpretationRule(changingCount);
  
  // ??????
  final originalHex = binaryToHexagram[originalBinary] ?? _createPlaceholderHexagram(originalBinary, upper, lower);
  final changedHex = changedBinary != null ? (binaryToHexagram[changedBinary] ?? _createPlaceholderHexagram(changedBinary, upper, lower)) : null;
  final mutualHex = binaryToHexagram[mutualBinary] ?? _createPlaceholderHexagram(mutualBinary, upper, lower);
  
  return HexagramAnalysis(
    originalHexagram: originalHex,
    changedHexagram: changedHex,
    mutualHexagram: mutualHex,
    yaoInfos: yaoInfos,
    changingLines: changingLines,
    changingCount: changingCount,
    interpretationRule: interpretationRule,
    relevantTexts: _getRelevantTexts(changingCount, changingLines),
    question: question,
    questionType: questionType,
    method: result.method,
    datetime: result.datetime,
    dayGan: dayGan,
    dayZhi: dayZhi,
    monthZhi: monthZhi,
  );
}

List<String> _getRelevantTexts(int changingCount, List<int> changingLines) {
  if (changingCount == 0) return ['本卦卦辞'];
  if (changingCount == 1) return ['本卦第${changingLines[0]}爻爻辞'];
  if (changingCount == 2) return ['本卦第${changingLines[0]}爻', '本卦第${changingLines[1]}爻(以上爻为主)'];
  if (changingCount == 3) return ['本卦卦辞', '之卦卦辞(以本卦为主)'];
  if (changingCount == 4) return ['之卦不变爻(以下爻为主)'];
  if (changingCount == 5) return ['之卦不变爻'];
  return ['乾坤看用九/用六，其他卦看之卦卦辞'];
}

Hexagram _createPlaceholderHexagram(String binary, GuaName upper, GuaName lower) {
  return Hexagram(
    number: 0,
    name: 'Unknown',
    fullName: '${lower.displayName}${upper.displayName}',
    upperTrigram: upper,
    lowerTrigram: lower,
    binary: binary,
    unicode: '?',
    guaCi: '',
    guaCiTranslation: '',
    daXiang: '',
    yaoTexts: [],
    keywords: [],
    palace: upper,
    palaceOrder: 1,
    worldLine: 6,
    responseLine: 3,
  );
}
