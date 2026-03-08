// ??????
import '../models/types.dart';
import 'dart:math';

/// ?????
DivinationResult coinMethod() {
  final random = Random();
  final yaoValues = <YaoValue>[];
  
  for (int i = 0; i < 6; i++) {
    int sum = 0;
    for (int j = 0; j < 3; j++) {
      sum += random.nextBool() ? 3 : 2;
    }
    yaoValues.add(YaoValue.fromInt(sum));
  }
  
  return DivinationResult(
    yaoValues: yaoValues,
    method: DivinationMethod.coin,
    datetime: DateTime.now(),
  );
}

/// ??????
DivinationResult dayanMethod() {
  final yaoValues = <YaoValue>[];
  for (int i = 0; i < 6; i++) {
    yaoValues.add(_dayanOneYao());
  }
  return DivinationResult(
    yaoValues: yaoValues,
    method: DivinationMethod.dayan,
    datetime: DateTime.now(),
  );
}

YaoValue _dayanOneYao() {
  final random = Random();
  int remaining = 49;
  remaining = _dayanOneChange(remaining, random);
  remaining = _dayanOneChange(remaining, random);
  remaining = _dayanOneChange(remaining, random);
  return YaoValue.fromInt(remaining ~/ 4);
}

int _dayanOneChange(int total, Random random) {
  int left = random.nextInt(total - 1) + 1;
  int right = total - left - 1;
  
  int rLeft = left % 4;
  if (rLeft == 0) rLeft = 4;
  int rRight = right % 4;
  if (rRight == 0) rRight = 4;
  
  int guiqi = 1 + rLeft + rRight;
  return total - guiqi;
}

/// ???? - ????
DivinationResult meihuaNumberMethod(int num1, int num2) {
  final upperIdx = num1 % 8 == 0 ? 8 : num1 % 8;
  final lowerIdx = num2 % 8 == 0 ? 8 : num2 % 8;
  final movingLine = (num1 + num2) % 6 == 0 ? 6 : (num1 + num2) % 6;
  
  final xiantianMap = {
    1: GuaName.qian, 2: GuaName.dui, 3: GuaName.li, 4: GuaName.zhen,
    5: GuaName.xun, 6: GuaName.kan, 7: GuaName.gen, 8: GuaName.kun,
  };
  
  final guaBinary = {
    GuaName.qian: '111', GuaName.dui: '110', GuaName.li: '101', GuaName.zhen: '100',
    GuaName.xun: '011', GuaName.kan: '010', GuaName.gen: '001', GuaName.kun: '000',
  };
  
  final upperName = xiantianMap[upperIdx]!;
  final lowerName = xiantianMap[lowerIdx]!;
  final fullBinary = guaBinary[lowerName]! + guaBinary[upperName]!;
  
  final yaoValues = <YaoValue>[];
  for (int i = 0; i < 6; i++) {
    bool isYang = fullBinary[i] == '1';
    if (i + 1 == movingLine) {
      yaoValues.add(isYang ? YaoValue.oldYang : YaoValue.oldYin);
    } else {
      yaoValues.add(isYang ? YaoValue.youngYang : YaoValue.youngYin);
    }
  }
  
  return DivinationResult(
    yaoValues: yaoValues,
    method: DivinationMethod.meihuaNumber,
    datetime: DateTime.now(),
  );
}
