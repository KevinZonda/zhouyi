// ?????
import '../models/types.dart';

const List<TianGan> tianGanList = [
  TianGan.jia, TianGan.yi, TianGan.bing, TianGan.ding, TianGan.wu,
  TianGan.ji, TianGan.geng, TianGan.xin, TianGan.ren, TianGan.gui
];

const List<DiZhi> diZhiList = [
  DiZhi.zi, DiZhi.chou, DiZhi.yin, DiZhi.mao, DiZhi.chen, DiZhi.si,
  DiZhi.wu, DiZhi.wei, DiZhi.shen, DiZhi.you, DiZhi.xu, DiZhi.hai
];

/// ???????
int julianDayNumber(int year, int month, int day) {
  int a = (14 - month) ~/ 12;
  int y = year + 4800 - a;
  int m = month + 12 * a - 3;
  return day + (153 * m + 2) ~/ 5 + 365 * y + y ~/ 4 - y ~/ 100 + y ~/ 400 - 32045;
}

/// ?????
({TianGan gan, DiZhi zhi}) getDayGanZhi(DateTime date) {
  int jdn = julianDayNumber(date.year, date.month, date.day);
  int baseJdn = 2415021; // 1900-01-01
  int offset = jdn - baseJdn;
  int ganIndex = ((offset % 10) + 10) % 10;
  int zhiIndex = (((offset + 10) % 12) + 12) % 12;
  return (gan: tianGanList[ganIndex], zhi: diZhiList[zhiIndex]);
}

/// ????????
DiZhi getMonthZhi(DateTime date) {
  int m = date.month;
  int d = date.day;
  
  final boundaries = [
    (1, 6, DiZhi.chou), (2, 4, DiZhi.yin), (3, 6, DiZhi.mao),
    (4, 5, DiZhi.chen), (5, 6, DiZhi.si), (6, 6, DiZhi.wu),
    (7, 7, DiZhi.wei), (8, 8, DiZhi.shen), (9, 8, DiZhi.you),
    (10, 8, DiZhi.xu), (11, 7, DiZhi.hai), (12, 7, DiZhi.zi),
  ];
  
  for (int i = boundaries.length - 1; i >= 0; i--) {
    var (bm, bd, bz) = boundaries[i];
    if (m > bm || (m == bm && d >= bd)) {
      return bz;
    }
  }
  return DiZhi.zi;
}

/// ??????
({DiZhi zhi, String name}) getShiChen(DateTime date) {
  int hour = date.hour;
  int index = ((hour + 1) % 24) ~/ 2;
  final names = [
    '??(23-01)', '??(01-03)', '??(03-05)', '??(05-07)',
    '??(07-09)', '??(09-11)', '??(11-13)', '??(13-15)',
    '??(15-17)', '??(17-19)', '??(19-21)', '??(21-23)',
  ];
  return (zhi: diZhiList[index], name: names[index]);
}

/// ???????????
DivinationTime getDivinationTime([DateTime? date]) {
  final d = date ?? DateTime.now();
  final dayGanZhi = getDayGanZhi(d);
  final monthZhi = getMonthZhi(d);
  final shiChen = getShiChen(d);
  
  final display = '${d.year}年${d.month}月${d.day}日 ${shiChen.name} '
      '${dayGanZhi.gan.displayName}${dayGanZhi.zhi.displayName}日 ${monthZhi.displayName}月';
  
  return DivinationTime(
    dayGan: dayGanZhi.gan,
    dayZhi: dayGanZhi.zhi,
    monthZhi: monthZhi,
    shiChen: shiChen.zhi,
    shiChenName: shiChen.name,
    display: display,
  );
}
