// 周易八卦与辅助数据

import '../models/types.dart';

// 八卦数据
final Map<GuaName, Trigram> trigramsData = {
  GuaName.qian: const Trigram(
    name: GuaName.qian,
    nature: '天',
    attribute: '健',
    family: '父',
    body: '首',
    animal: '马',
  ),
  GuaName.dui: const Trigram(
    name: GuaName.dui,
    nature: '泽',
    attribute: '悦',
    family: '少女',
    body: '口',
    animal: '羊',
  ),
  GuaName.li: const Trigram(
    name: GuaName.li,
    nature: '火',
    attribute: '丽',
    family: '中女',
    body: '目',
    animal: '雉',
  ),
  GuaName.zhen: const Trigram(
    name: GuaName.zhen,
    nature: '雷',
    attribute: '动',
    family: '长男',
    body: '足',
    animal: '龙',
  ),
  GuaName.xun: const Trigram(
    name: GuaName.xun,
    nature: '风',
    attribute: '入',
    family: '长女',
    body: '股',
    animal: '鸡',
  ),
  GuaName.kan: const Trigram(
    name: GuaName.kan,
    nature: '水',
    attribute: '陷',
    family: '中男',
    body: '耳',
    animal: '豕',
  ),
  GuaName.gen: const Trigram(
    name: GuaName.gen,
    nature: '山',
    attribute: '止',
    family: '少男',
    body: '手',
    animal: '狗',
  ),
  GuaName.kun: const Trigram(
    name: GuaName.kun,
    nature: '地',
    attribute: '顺',
    family: '母',
    body: '腹',
    animal: '牛',
  ),
};

// 二进制 -> 卦名 反查表
final Map<String, GuaName> binaryToTrigram = {
  '111': GuaName.qian,
  '110': GuaName.dui,
  '101': GuaName.li,
  '100': GuaName.zhen,
  '011': GuaName.xun,
  '010': GuaName.kan,
  '001': GuaName.gen,
  '000': GuaName.kun,
};

// 纳甲表：每卦的天干地支对应
// 索引 0=初爻, 5=上爻
class NajiaEntry {
  final List<TianGan> gan;
  final List<DiZhi> zhi;

  const NajiaEntry({required this.gan, required this.zhi});
}

final Map<GuaName, NajiaEntry> najiaTable = {
  GuaName.qian: const NajiaEntry(
    gan: [TianGan.jia, TianGan.jia, TianGan.jia, TianGan.ren, TianGan.ren, TianGan.ren],
    zhi: [DiZhi.zi, DiZhi.yin, DiZhi.chen, DiZhi.wu, DiZhi.shen, DiZhi.xu],
  ),
  GuaName.kun: const NajiaEntry(
    gan: [TianGan.yi, TianGan.yi, TianGan.yi, TianGan.gui, TianGan.gui, TianGan.gui],
    zhi: [DiZhi.wei, DiZhi.si, DiZhi.mao, DiZhi.chou, DiZhi.hai, DiZhi.you],
  ),
  GuaName.zhen: const NajiaEntry(
    gan: [TianGan.geng, TianGan.geng, TianGan.geng, TianGan.geng, TianGan.geng, TianGan.geng],
    zhi: [DiZhi.zi, DiZhi.yin, DiZhi.chen, DiZhi.wu, DiZhi.shen, DiZhi.xu],
  ),
  GuaName.xun: const NajiaEntry(
    gan: [TianGan.xin, TianGan.xin, TianGan.xin, TianGan.xin, TianGan.xin, TianGan.xin],
    zhi: [DiZhi.chou, DiZhi.hai, DiZhi.you, DiZhi.wei, DiZhi.si, DiZhi.mao],
  ),
  GuaName.kan: const NajiaEntry(
    gan: [TianGan.wu, TianGan.wu, TianGan.wu, TianGan.wu, TianGan.wu, TianGan.wu],
    zhi: [DiZhi.yin, DiZhi.chen, DiZhi.wu, DiZhi.shen, DiZhi.xu, DiZhi.zi],
  ),
  GuaName.li: const NajiaEntry(
    gan: [TianGan.ji, TianGan.ji, TianGan.ji, TianGan.ji, TianGan.ji, TianGan.ji],
    zhi: [DiZhi.mao, DiZhi.chou, DiZhi.hai, DiZhi.you, DiZhi.wei, DiZhi.si],
  ),
  GuaName.gen: const NajiaEntry(
    gan: [TianGan.bing, TianGan.bing, TianGan.bing, TianGan.bing, TianGan.bing, TianGan.bing],
    zhi: [DiZhi.chen, DiZhi.wu, DiZhi.shen, DiZhi.xu, DiZhi.zi, DiZhi.yin],
  ),
  GuaName.dui: const NajiaEntry(
    gan: [TianGan.ding, TianGan.ding, TianGan.ding, TianGan.ding, TianGan.ding, TianGan.ding],
    zhi: [DiZhi.si, DiZhi.mao, DiZhi.chou, DiZhi.hai, DiZhi.you, DiZhi.wei],
  ),
};

// 五行相生关系
final Map<WuXing, WuXing> wuxingGenerate = {
  WuXing.wood: WuXing.fire,
  WuXing.fire: WuXing.earth,
  WuXing.earth: WuXing.metal,
  WuXing.metal: WuXing.water,
  WuXing.water: WuXing.wood,
};

// 五行相克关系
final Map<WuXing, WuXing> wuxingOvercome = {
  WuXing.wood: WuXing.earth,
  WuXing.earth: WuXing.water,
  WuXing.water: WuXing.fire,
  WuXing.fire: WuXing.metal,
  WuXing.metal: WuXing.wood,
};

// 六神固定顺序
const List<LiuShen> liushenOrder = [
  LiuShen.qinglong,
  LiuShen.zhuque,
  LiuShen.gouchen,
  LiuShen.tengshe,
  LiuShen.baihu,
  LiuShen.xuanwu,
];

// 六神起点（根据日干确定）
final Map<TianGan, int> liushenStart = {
  TianGan.jia: 0,
  TianGan.yi: 0,
  TianGan.bing: 1,
  TianGan.ding: 1,
  TianGan.wu: 2,
  TianGan.ji: 3,
  TianGan.geng: 4,
  TianGan.xin: 4,
  TianGan.ren: 5,
  TianGan.gui: 5,
};

// 空亡表：旬干支对应空亡地支
final Map<String, List<DiZhi>> xunkongTable = {
  '甲子': [DiZhi.xu, DiZhi.hai],
  '甲戌': [DiZhi.shen, DiZhi.you],
  '甲申': [DiZhi.wu, DiZhi.wei],
  '甲午': [DiZhi.chen, DiZhi.si],
  '甲辰': [DiZhi.yin, DiZhi.mao],
  '甲寅': [DiZhi.zi, DiZhi.chou],
};

// 推导六亲
LiuQin getLiuQin(WuXing palaceElement, WuXing yaoElement) {
  if (palaceElement == yaoElement) return LiuQin.sibling;
  if (wuxingGenerate[palaceElement] == yaoElement) return LiuQin.child;
  if (wuxingOvercome[palaceElement] == yaoElement) return LiuQin.wealth;
  if (wuxingOvercome[yaoElement] == palaceElement) return LiuQin.officer;
  if (wuxingGenerate[yaoElement] == palaceElement) return LiuQin.parent;
  return LiuQin.sibling;
}

// 配置六神数组
List<LiuShen> getLiuShenArray(TianGan dayGan) {
  final startIdx = liushenStart[dayGan] ?? 0;
  return List.generate(6, (i) => liushenOrder[(startIdx + i) % 6]);
}

// 获取空亡地支
List<DiZhi> getEmptyBranches(TianGan dayGan, DiZhi dayZhi) {
  const tianGanList = [
    TianGan.jia, TianGan.yi, TianGan.bing, TianGan.ding, TianGan.wu,
    TianGan.ji, TianGan.geng, TianGan.xin, TianGan.ren, TianGan.gui
  ];
  const diZhiList = [
    DiZhi.zi, DiZhi.chou, DiZhi.yin, DiZhi.mao, DiZhi.chen, DiZhi.si,
    DiZhi.wu, DiZhi.wei, DiZhi.shen, DiZhi.you, DiZhi.xu, DiZhi.hai
  ];

  final ganIdx = tianGanList.indexOf(dayGan);
  final zhiIdx = diZhiList.indexOf(dayZhi);

  final xunStartZhiIdx = (zhiIdx - ganIdx + 12) % 12;
  final xunKey = '甲${diZhiList[xunStartZhiIdx].displayName}';

  return xunkongTable[xunKey] ?? [];
}
