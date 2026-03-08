const fs = require('fs');

const content = `import '../models/types.dart';

// 六十四卦数据（示例版本 - 每宫2卦）
// 完整版本应包含所有64卦

final List<Hexagram> hexagramsData = [
  // ==================== 乾宫 ====================
  // 1. 乾为天 (乾宫第一卦)
  const Hexagram(
    number: 1,
    name: '乾',
    fullName: '乾为天',
    upperTrigram: GuaName.qian,
    lowerTrigram: GuaName.qian,
    binary: '111111',
    unicode: '\\u4DC0',
    guaCi: '元亨利贞。',
    guaCiTranslation: '元始，亨通，和谐有利，正固持久。',
    daXiang: '天行健，君子以自强不息。',
    yaoTexts: [
      YaoText(
        position: '初九',
        text: '潜龙勿用。',
        translation: '龙潜伏在水中，暂时不宜有所作为。',
      ),
      YaoText(
        position: '九二',
        text: '见龙在田，利见大人。',
        translation: '龙出现在田野，有利于见到大德之人。',
      ),
      YaoText(
        position: '九三',
        text: '君子终日乾乾，夕惕若，厉无咎。',
        translation: '君子整天勤奋努力，夜晚警惕反省，虽有危险但无灾祸。',
      ),
      YaoText(
        position: '九四',
        text: '或跃在渊，无咎。',
        translation: '龙或跃起或潜于深渊，没有灾祸。',
      ),
      YaoText(
        position: '九五',
        text: '飞龙在天，利见大人。',
        translation: '龙飞翔在天空，有利于见到大德之人。',
      ),
      YaoText(
        position: '上九',
        text: '亢龙有悔。',
        translation: '龙飞得过高，将有悔恨。',
      ),
    ],
    yongText: '用九：见群龙无首，吉。',
    keywords: ['刚健', '创始', '领导', '自强不息', '成功'],
    palace: GuaName.qian,
    palaceOrder: 1,
    worldLine: 6,
    responseLine: 3,
  ),

  // 44. 天风姤 (乾宫第二卦)
  const Hexagram(
    number: 44,
    name: '姤',
    fullName: '天风姤',
    upperTrigram: GuaName.qian,
    lowerTrigram: GuaName.xun,
    binary: '111011',
    unicode: '\\u4DDB',
    guaCi: '女壮，勿用取女。',
    guaCiTranslation: '女子过于强盛，不宜娶为妻子。',
    daXiang: '天下有风，姤。后以施命诰四方。',
    yaoTexts: [
      YaoText(
        position: '初六',
        text: '系于金柅，贞吉。有攸往，见凶。羸豕孚蹢躅。',
        translation: '系缚在金属制动器上，守正吉祥。有所前往，出现凶险。羸弱的猪被牵系而徘徊。',
      ),
      YaoText(
        position: '九二',
        text: '包有鱼，无咎，不利宾。',
        translation: '厨房里有鱼，没有灾祸，但不利于招待宾客。',
      ),
      YaoText(
        position: '九三',
        text: '臀无肤，其行次且，厉，无大咎。',
        translation: '臀部没有皮肤，行走困难，有危险，但没有大灾祸。',
      ),
      YaoText(
        position: '九四',
        text: '包无鱼，起凶。',
        translation: '厨房里没有鱼，引发凶险。',
      ),
      YaoText(
        position: '九五',
        text: '以杞包瓜，含章，有陨自天。',
        translation: '用杞柳包瓜，内含文采，有坠落之物从天而降。',
      ),
      YaoText(
        position: '上九',
        text: '姤其角，吝，无咎。',
        translation: '遇到在角落，有憾惜，但没有灾祸。',
      ),
    ],
    keywords: ['相遇', '邂逅', '阴长阳消', '防范'],
    palace: GuaName.qian,
    palaceOrder: 2,
    worldLine: 1,
    responseLine: 4,
  ),
];
`;

fs.mkdirSync('zhouyi/lib/data', { recursive: true });
fs.writeFileSync('zhouyi/lib/data/hexagrams_data.dart', content, 'utf8');
console.log('File created');
