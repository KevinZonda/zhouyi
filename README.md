# 周易

> Credits go to [koriyoshi2041/zhouyi](https://github.com/koriyoshi2041/zhouyi)

基于传统易学规则的周易占卜应用，使用 Flutter 框架开发。

## 功能特性

- **三种起卦方式**
  - 大衍筮法：模拟49根蓍草，古法正统
  - 铜钱法：三枚铜钱投掷六次，简便快捷
  - 梅花易数：数字起卦，万物皆有数

- **完整的装卦分析**
  - 纳甲：按八宫纳甲法配天干地支
  - 六亲：根据五行生克推导
  - 六神：根据日干配置
  - 世应：六十四卦世应爻位
  - 空亡：根据日干支所在旬判定

- **优雅的GUI界面**
  - 深色主题设计
  - 流畅的动画效果
  - 清晰的信息展示

## 项目结构

```
lib/
├── models/
│   └── types.dart          # 核心类型定义
├── data/
│   ├── trigrams_data.dart  # 八卦数据与纳甲表
│   └── hexagrams_data.dart # 六十四卦数据
├── core/
│   ├── divination.dart     # 起卦算法
│   ├── analysis.dart       # 装卦分析引擎
│   └── calendar.dart       # 干支历计算
├── screens/
│   ├── home_screen.dart    # 主页
│   ├── divination_screen.dart # 起卦页面
│   └── result_screen.dart  # 结果页面
└── main.dart               # 应用入口
```

## 运行方式

```bash
flutter pub get
flutter run
```

## 技术说明

本项目逻辑与 `zhouyi_node` (Node.js/TypeScript版本) 保持一致：
- 相同的起卦算法和概率分布
- 相同的纳甲、六亲、六神推导规则
- 相同的断卦规则
