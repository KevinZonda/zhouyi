// 六十四卦爻辞数据
// 按文王卦序排列（1-64）
import '../models/types.dart';

const List<List<YaoText>> allYaoTexts = [
  // 1. 乾
  [
    YaoText(position: '初九', text: '潜龙勿用。', translation: '龙潜伏在水中，暂时不宜有所作为。'),
    YaoText(position: '九二', text: '见龙在田，利见大人。', translation: '龙出现在田野之上，利于拜见大德之人。'),
    YaoText(position: '九三', text: '君子终日乾乾，夕惕若厉，无咎。', translation: '君子整日勤勉不懈，到了晚上仍保持警惕戒惧，虽有危险但无过咎。'),
    YaoText(position: '九四', text: '或跃在渊，无咎。', translation: '或腾跃而起，或退居深渊，只要把握时机就无过咎。'),
    YaoText(position: '九五', text: '飞龙在天，利见大人。', translation: '龙飞翔在天空之上，利于拜见大德之人。'),
    YaoText(position: '上九', text: '亢龙有悔。', translation: '龙飞得过高，必将有所悔恨。'),
  ],
  // 2. 坤
  [
    YaoText(position: '初六', text: '履霜，坚冰至。', translation: '踩到了薄霜，坚硬的冰层快要到来了。'),
    YaoText(position: '六二', text: '直方大，不习无不利。', translation: '正直、端方、宏大，不用学习也无所不利。'),
    YaoText(position: '六三', text: '含章可贞。或从王事，无成有终。', translation: '蕴含文采而能守正。如果参与王事，虽不居功但能有好的结局。'),
    YaoText(position: '六四', text: '括囊，无咎无誉。', translation: '扎紧口袋，没有灾咎也没有荣誉。'),
    YaoText(position: '六五', text: '黄裳，元吉。', translation: '黄色的下裳，大吉。'),
    YaoText(position: '上六', text: '龙战于野，其血玄黄。', translation: '龙在旷野上争斗，流出青黄色的血。'),
  ],
  // 3. 屯
  [
    YaoText(position: '初九', text: '磐桓，利居贞，利建侯。', translation: '徘徊不前，利于安居守正，利于建立诸侯。'),
    YaoText(position: '六二', text: '屯如邅如，乘马班如。匪寇婚媾，女子贞不字，十年乃字。', translation: '艰难困顿，骑马盘旋不前。不是来抢劫的，而是来求婚的。女子守正不嫁，十年后才出嫁。'),
    YaoText(position: '六三', text: '即鹿无虞，惟入于林中，君子几不如舍，往吝。', translation: '追逐鹿却没有猎人引导，只会迷入森林之中。君子见机不如放弃，前往会有憾。'),
    YaoText(position: '六四', text: '乘马班如，求婚媾，往吉，无不利。', translation: '骑马盘旋不前，前去求婚，前往吉祥，无所不利。'),
    YaoText(position: '九五', text: '屯其膏，小贞吉，大贞凶。', translation: '屯积恩泽，小事守正吉祥，大事守正凶险。'),
    YaoText(position: '上六', text: '乘马班如，泣血涟如。', translation: '骑马盘旋不前，泣泪涟涟如血。'),
  ],
  // 4. 蒙
  [
    YaoText(position: '初六', text: '发蒙，利用刑人，用说桎梏，以往吝。', translation: '启发蒙昧，利用刑罚来教育人，使其脱去桎梏。但若继续前往则有憾惜。'),
    YaoText(position: '九二', text: '包蒙，吉。纳妇，吉。子克家。', translation: '包容蒙昧之人，吉祥。娶妻，吉祥。儿子能治理家业。'),
    YaoText(position: '六三', text: '勿用取女，见金夫，不有躬，无攸利。', translation: '不宜娶这样的女子，见到有钱的男子就失去自持，没有什么利益。'),
    YaoText(position: '六四', text: '困蒙，吝。', translation: '被蒙昧所困，有憾惜。'),
    YaoText(position: '六五', text: '童蒙，吉。', translation: '童子般的蒙昧，吉祥。'),
    YaoText(position: '上九', text: '击蒙，不利为寇，利御寇。', translation: '击打蒙昧之人，不利于做强盗，利于抵御强盗。'),
  ],
  // 5. 需
  [
    YaoText(position: '初九', text: '需于郊，利用恒，无咎。', translation: '在郊外等待，利于保持恒心，没有灾咎。'),
    YaoText(position: '九二', text: '需于沙，小有言，终吉。', translation: '在沙滩上等待，稍有口舌之争，最终吉祥。'),
    YaoText(position: '九三', text: '需于泥，致寇至。', translation: '在泥泞中等待，招致盗寇到来。'),
    YaoText(position: '六四', text: '需于血，出自穴。', translation: '在血泊中等待，从洞穴中出来。'),
    YaoText(position: '九五', text: '需于酒食，贞吉。', translation: '在酒食宴席中等待，守正则吉祥。'),
    YaoText(position: '上六', text: '入于穴，有不速之客三人来，敬之终吉。', translation: '进入洞穴，有三位不请自来的客人到来，恭敬地对待他们最终吉祥。'),
  ],
  // 6. 讼
  [
    YaoText(position: '初六', text: '不永所事，小有言，终吉。', translation: '不把争讼之事长久进行下去，虽然有些闲话，最终吉祥。'),
    YaoText(position: '九二', text: '不克讼，归而逋，其邑人三百户，无眚。', translation: '争讼不能获胜，回来逃避，所在封邑有三百户人家，没有灾祸。'),
    YaoText(position: '六三', text: '食旧德，贞厉，终吉。或从王事，无成。', translation: '享用旧有的德业，守正虽有危险，但最终吉祥。如果参与王事，不会有成就。'),
    YaoText(position: '九四', text: '不克讼，复即命，渝，安贞吉。', translation: '争讼不能获胜，回来顺从天命，改变态度，安于守正则吉祥。'),
    YaoText(position: '九五', text: '讼，元吉。', translation: '争讼得到公正裁决，大吉。'),
    YaoText(position: '上九', text: '或锡之鞶带，终朝三褫之。', translation: '即使赐给皮带，在一天之内也会被剥夺三次。'),
  ],
  // 7. 师
  [
    YaoText(position: '初六', text: '师出以律，否臧凶。', translation: '出兵作战要有纪律，否则不论胜败都有凶险。'),
    YaoText(position: '九二', text: '在师中吉，无咎，王三锡命。', translation: '在军中得到信任，吉祥，没有灾咎，君王多次给予嘉奖。'),
    YaoText(position: '六三', text: '师或舆尸，凶。', translation: '军队可能会用车载尸而归，凶险。'),
    YaoText(position: '六四', text: '师左次，无咎。', translation: '军队向左后退驻扎，没有灾咎。'),
    YaoText(position: '六五', text: '田有禽，利执言，无咎。长子帅师，弟子舆尸，贞凶。', translation: '田中有猎物，利于捕获，没有灾咎。长子统帅军队则可，若用无能之人则会载尸而归，守正也有凶险。'),
    YaoText(position: '上六', text: '大君有命，开国承家，小人勿用。', translation: '天子颁布命令，分封诸侯，建立家业，但不能任用小人。'),
  ],
  // 8. 比
  [
    YaoText(position: '初六', text: '有孚比之，无咎。有孚盈缶，终来有他吉。', translation: '以诚信亲近他人，没有灾咎。诚信满溢如缶中之水，最终会有其他的吉祥。'),
    YaoText(position: '六二', text: '比之自内，贞吉。', translation: '从内部亲近辅佐，守正则吉祥。'),
    YaoText(position: '六三', text: '比之匪人。', translation: '亲近了不正当的人。'),
    YaoText(position: '六四', text: '外比之，贞吉。', translation: '从外部亲近辅佐，守正则吉祥。'),
    YaoText(position: '九五', text: '显比。王用三驱，失前禽，邑人不诫，吉。', translation: '光明正大地亲近。君王用三面围猎之法，放走前面逃跑的猎物，百姓不必戒备，吉祥。'),
    YaoText(position: '上六', text: '比之无首，凶。', translation: '亲近他人却没有好的开始，凶险。'),
  ],
  // 9. 小畜
  [
    YaoText(position: '初九', text: '复自道，何其咎？吉。', translation: '返回到自己的正道上来，有什么灾咎呢？吉祥。'),
    YaoText(position: '九二', text: '牵复，吉。', translation: '被牵引着一同返回，吉祥。'),
    YaoText(position: '九三', text: '舆说辐，夫妻反目。', translation: '车轮脱落了辐条，夫妻反目失和。'),
    YaoText(position: '六四', text: '有孚，血去惕出，无咎。', translation: '心怀诚信，忧惧消除，警惕解除，没有灾咎。'),
    YaoText(position: '九五', text: '有孚挛如，富以其邻。', translation: '心怀诚信，紧密相连，以自己的富有带动邻人。'),
    YaoText(position: '上九', text: '既雨既处，尚德载。妇贞厉，月几望。君子征凶。', translation: '雨已经下了又停了，崇尚德行而有所承载。妇人守正也有危险，月亮将近满盈。君子此时出征有凶险。'),
  ],
  // 10. 履
  [
    YaoText(position: '初九', text: '素履，往无咎。', translation: '朴素地行走，前往没有灾咎。'),
    YaoText(position: '九二', text: '履道坦坦，幽人贞吉。', translation: '行走在平坦的大道上，幽隐之人守正则吉祥。'),
    YaoText(position: '六三', text: '眇能视，跛能履，履虎尾，咥人，凶。武人为于大君。', translation: '独眼能看，瘸腿能走，踩到老虎尾巴，老虎咬人，凶险。武人这样做是为了大君主。'),
    YaoText(position: '九四', text: '履虎尾，愬愬，终吉。', translation: '踩到老虎尾巴，恐惧谨慎，最终吉祥。'),
    YaoText(position: '九五', text: '夬履，贞厉。', translation: '果断地行走，守正以防危险。'),
    YaoText(position: '上九', text: '视履考祥，其旋元吉。', translation: '回头审视自己的行为，考察其吉凶祸福，周旋得当则大吉。'),
  ],
  // 11. 泰
  [
    YaoText(position: '初九', text: '拔茅茹，以其汇，征吉。', translation: '拔起茅草，牵连同类，前进则吉祥。'),
    YaoText(position: '九二', text: '包荒，用冯河，不遐遗，朋亡，得尚于中行。', translation: '包容荒芜，徒步涉河，不遗忘远方，不结党营私，得以推崇中正之道。'),
    YaoText(position: '九三', text: '无平不陂，无往不复。艰贞无咎。勿恤其孚，于食有福。', translation: '没有平坦而不变为倾斜的，没有前往而不返回的。在艰难中守正则无灾咎。不要忧虑诚信的问题，在饮食上会有福分。'),
    YaoText(position: '六四', text: '翩翩不富以其邻，不戒以孚。', translation: '翩然而来，不因富裕而拉拢邻居，不用告诫而以诚信相处。'),
    YaoText(position: '六五', text: '帝乙归妹，以祉元吉。', translation: '帝乙嫁女，因此获得福祉，大吉。'),
    YaoText(position: '上六', text: '城复于隍，勿用师。自邑告命，贞吝。', translation: '城墙倒塌回到护城河中，不可用兵。从自己的城邑发布命令，守正也有憾。'),
  ],
  // 12. 否
  [
    YaoText(position: '初六', text: '拔茅茹，以其汇，贞吉，亨。', translation: '拔起茅草，连根带茎一起拔出，守正则吉，亨通。'),
    YaoText(position: '六二', text: '包承，小人吉，大人否，亨。', translation: '包容顺承，小人吉利，大人处否塞之境，终将亨通。'),
    YaoText(position: '六三', text: '包羞。', translation: '内心包含羞愧。'),
    YaoText(position: '九四', text: '有命无咎，畴离祉。', translation: '有天命在身则无过咎，同类皆获福祉。'),
    YaoText(position: '九五', text: '休否，大人吉。其亡其亡，系于苞桑。', translation: '使否塞休止，大人吉祥。常怀"将要灭亡"的忧患意识，就如系于丛生桑树般稳固。'),
    YaoText(position: '上九', text: '倾否，先否后喜。', translation: '否塞倾覆，先经历否塞后获得喜悦。'),
  ],
  // 13. 同人
  [
    YaoText(position: '初九', text: '同人于门，无咎。', translation: '在门外与人和同，没有灾咎。'),
    YaoText(position: '六二', text: '同人于宗，吝。', translation: '只在宗族内部与人和同，有憾惜。'),
    YaoText(position: '九三', text: '伏戎于莽，升其高陵，三岁不兴。', translation: '在草莽中埋伏军队，登上高丘瞭望，三年都不能兴兵。'),
    YaoText(position: '九四', text: '乘其墉，弗克攻，吉。', translation: '登上城墙，但不进攻，吉祥。'),
    YaoText(position: '九五', text: '同人先号啕而后笑，大师克相遇。', translation: '与人和同先号啕大哭而后欢笑，大军战胜后得以相遇。'),
    YaoText(position: '上九', text: '同人于郊，无悔。', translation: '在郊外与人和同，没有悔恨。'),
  ],
  // 14. 大有
  [
    YaoText(position: '初九', text: '无交害，匪咎，艰则无咎。', translation: '没有交往的祸害，没有过咎，保持艰苦谨慎则无过咎。'),
    YaoText(position: '九二', text: '大车以载，有攸往，无咎。', translation: '用大车装载，有所前往，无过咎。'),
    YaoText(position: '九三', text: '公用亨于天子，小人弗克。', translation: '公侯以此朝献于天子，小人不能胜任。'),
    YaoText(position: '九四', text: '匪其彭，无咎。', translation: '不盛气凌人，无过咎。'),
    YaoText(position: '六五', text: '厥孚交如，威如，吉。', translation: '以诚信与人交往，同时保持威严，吉祥。'),
    YaoText(position: '上九', text: '自天祐之，吉无不利。', translation: '上天保佑，吉祥，无所不利。'),
  ],
  // 15. 谦
  [
    YaoText(position: '初六', text: '谦谦君子，用涉大川，吉。', translation: '谦而又谦的君子，可以渡过大河，吉祥。'),
    YaoText(position: '六二', text: '鸣谦，贞吉。', translation: '名声远播的谦虚，守正吉祥。'),
    YaoText(position: '九三', text: '劳谦，君子有终，吉。', translation: '有功劳而谦虚，君子能有好的结局，吉祥。'),
    YaoText(position: '六四', text: '无不利，撝谦。', translation: '没有不利的，发挥谦德。'),
    YaoText(position: '六五', text: '不富以其邻，利用侵伐，无不利。', translation: '不因富有而对邻居骄纵，利于征伐，没有不利。'),
    YaoText(position: '上六', text: '鸣谦，利用行师，征邑国。', translation: '名声远播的谦虚，利于出兵，征讨小国。'),
  ],
  // 16. 豫
  [
    YaoText(position: '初六', text: '鸣豫，凶。', translation: '出声欢乐，自鸣得意，凶。'),
    YaoText(position: '六二', text: '介于石，不终日，贞吉。', translation: '心志坚如磐石，不等一天就能察觉变化，守正则吉。'),
    YaoText(position: '六三', text: '盱豫，悔。迟有悔。', translation: '谄媚讨好以求欢乐，有悔恨。迟疑不决也有悔恨。'),
    YaoText(position: '九四', text: '由豫，大有得。勿疑，朋盍簪。', translation: '众人由其而欢乐，大有所得。不必疑虑，朋友像簪子聚拢头发一样聚合而来。'),
    YaoText(position: '六五', text: '贞疾，恒不死。', translation: '守正虽有疾病之患，但能长久不死。'),
    YaoText(position: '上六', text: '冥豫，成有渝，无咎。', translation: '沉迷于欢乐之中，虽有所成就但已有变化，及时改过则无灾咎。'),
  ],
  // 17. 随
  [
    YaoText(position: '初九', text: '官有渝，贞吉。出门交有功。', translation: '主管之事有所变化，守正则吉。出门交往有功效。'),
    YaoText(position: '六二', text: '系小子，失丈夫。', translation: '追随小人，就会失去大丈夫。'),
    YaoText(position: '六三', text: '系丈夫，失小子。随有求得，利居贞。', translation: '追随大丈夫，就会失去小人。随从而有所求则能得到，利于安居守正。'),
    YaoText(position: '九四', text: '随有获，贞凶。有孚在道，以明，何咎。', translation: '随从而有所获，守正防凶。心怀诚信合于正道，以光明磊落行事，有何灾咎。'),
    YaoText(position: '九五', text: '孚于嘉，吉。', translation: '诚信于美善之事，吉祥。'),
    YaoText(position: '上六', text: '拘系之，乃从维之。王用亨于西山。', translation: '拘束绑缚住他，又加以维系。君王在西山举行祭祀。'),
  ],
  // 18. 蛊
  [
    YaoText(position: '初六', text: '干父之蛊，有子，考无咎，厉终吉。', translation: '纠正父亲的弊病，有这样的儿子，父亲没有灾咎，虽有危险但终将吉祥。'),
    YaoText(position: '九二', text: '干母之蛊，不可贞。', translation: '纠正母亲的弊病，不可过于固执守正。'),
    YaoText(position: '九三', text: '干父之蛊，小有悔，无大咎。', translation: '纠正父亲的弊病，稍有悔恨，但没有大的灾咎。'),
    YaoText(position: '六四', text: '裕父之蛊，往见吝。', translation: '宽容放纵父亲的弊病，前往将会有憾惜。'),
    YaoText(position: '六五', text: '干父之蛊，用誉。', translation: '纠正父亲的弊病，获得赞誉。'),
    YaoText(position: '上九', text: '不事王侯，高尚其事。', translation: '不侍奉王侯，崇尚自己高洁的志向。'),
  ],
  // 19. 临
  [
    YaoText(position: '初九', text: '咸临，贞吉。', translation: '以感应来临近，守正则吉祥。'),
    YaoText(position: '九二', text: '咸临，吉，无不利。', translation: '以感应来临近，吉祥，无所不利。'),
    YaoText(position: '六三', text: '甘临，无攸利。既忧之，无咎。', translation: '以甜言蜜语来临近，没有什么好处。如果能忧虑而改正，就没有灾咎。'),
    YaoText(position: '六四', text: '至临，无咎。', translation: '亲自来临近，没有灾咎。'),
    YaoText(position: '六五', text: '知临，大君之宜，吉。', translation: '以智慧来临近，这是大君应有的做法，吉祥。'),
    YaoText(position: '上六', text: '敦临，吉，无咎。', translation: '以敦厚的态度来临近，吉祥，没有灾咎。'),
  ],
  // 20. 观
  [
    YaoText(position: '初六', text: '童观，小人无咎，君子吝。', translation: '像小孒一样幼稚地观察，小人无过咎，君子则有憾。'),
    YaoText(position: '六二', text: '窥观，利女贞。', translation: '从门缝中窥视，利于女子守正。'),
    YaoText(position: '六三', text: '观我生，进退。', translation: '观察自我的所作所为，以决定进退。'),
    YaoText(position: '六四', text: '观国之光，利用宾于王。', translation: '观察一国的风尚光华，利于作为宾客朝见君王。'),
    YaoText(position: '九五', text: '观我生，君子无咎。', translation: '观察自我的所作所为，君子无过咎。'),
    YaoText(position: '上九', text: '观其生，君子无咎。', translation: '观察他人的所作所为，君子无过咎。'),
  ],
  // 21. 噬嗑
  [
    YaoText(position: '初九', text: '屦校灭趾，无咎。', translation: '脚上戴着刑具遮没了脚趾，没有灾咎。'),
    YaoText(position: '六二', text: '噬肤灭鼻，无咎。', translation: '咬噬柔软的肤肉以至于遮没了鼻子，没有灾咎。'),
    YaoText(position: '六三', text: '噬腊肉，遇毒，小吝，无咎。', translation: '咬噬腊肉，遇到了毒物，稍有憾惜，但没有灾咎。'),
    YaoText(position: '九四', text: '噬干胏，得金矢，利艰贞，吉。', translation: '咬噬带骨的干肉，得到铜箭头，利于在艰难中守正，吉祥。'),
    YaoText(position: '六五', text: '噬干肉，得黄金，贞厉，无咎。', translation: '咬噬干肉，得到黄铜，守正虽有危险，但没有灾咎。'),
    YaoText(position: '上九', text: '何校灭耳，凶。', translation: '颈上戴着刑具遮没了耳朵，凶险。'),
  ],
  // 22. 贲
  [
    YaoText(position: '初九', text: '贲其趾，舍车而徒。', translation: '修饰脚趾，舍弃车辆而步行。'),
    YaoText(position: '六二', text: '贲其须。', translation: '修饰胡须。'),
    YaoText(position: '九三', text: '贲如濡如，永贞吉。', translation: '修饰得润泽光鲜，长久守正则吉祥。'),
    YaoText(position: '六四', text: '贲如皤如，白马翰如。匪寇婚媾。', translation: '修饰得洁白素雅，白马飞奔而来。不是来抢劫的，而是来求婚的。'),
    YaoText(position: '六五', text: '贲于丘园，束帛戋戋，吝，终吉。', translation: '以丘园的朴素来装饰，一束束帛虽少，虽有吝啬之嫌，但终究吉祥。'),
    YaoText(position: '上九', text: '白贲，无咎。', translation: '以白色装饰，返璞归真，没有灾咎。'),
  ],
  // 23. 剥
  [
    YaoText(position: '初六', text: '剥床以足，蔑贞凶。', translation: '剥落从床足开始，轻蔑正道则凶险。'),
    YaoText(position: '六二', text: '剥床以辨，蔑贞凶。', translation: '剥落到了床板的边框，轻蔑正道则凶险。'),
    YaoText(position: '六三', text: '剥之，无咎。', translation: '虽处剥落之中但能与上下断绝，无过咎。'),
    YaoText(position: '六四', text: '剥床以肤，凶。', translation: '剥落到了床面，凶险。'),
    YaoText(position: '六五', text: '贯鱼，以宫人宠，无不利。', translation: '像串鱼一样率领宫人受宠，无所不利。'),
    YaoText(position: '上九', text: '硕果不食，君子得舆，小人剥庐。', translation: '大的果实未被摘食，君子得到车乘，小人则连房屋也被剥落。'),
  ],
  // 24. 复
  [
    YaoText(position: '初九', text: '不远复，无祇悔，元吉。', translation: '走得不远就返回，不致于造成悔恨，大吉。'),
    YaoText(position: '六二', text: '休复，吉。', translation: '美好的返回，吉祥。'),
    YaoText(position: '六三', text: '频复，厉无咎。', translation: '频繁地返回，虽有危险但没有灾咎。'),
    YaoText(position: '六四', text: '中行独复。', translation: '走在中途独自返回。'),
    YaoText(position: '六五', text: '敦复，无悔。', translation: '敦厚地返回，没有悔恨。'),
    YaoText(position: '上六', text: '迷复，凶，有灾眚。用行师，终有大败，以其国君凶。至于十年不克征。', translation: '迷失而不知返回，凶险，有灾祸。用兵作战，最终大败，国君也有凶险。以至于十年不能出征。'),
  ],
  // 25. 无妄
  [
    YaoText(position: '初九', text: '无妄，往吉。', translation: '不妄行，前往则吉祥。'),
    YaoText(position: '六二', text: '不耕获，不菑畬，则利有攸往。', translation: '不在播种时想着收获，不在开荒时想着熟田，这样才利于有所前往。'),
    YaoText(position: '六三', text: '无妄之灾，或系之牛，行人之得，邑人之灾。', translation: '无妄之灾从天而降，好比有人拴住一头牛，路人得到了牛，却给村里人带来灾祸。'),
    YaoText(position: '九四', text: '可贞，无咎。', translation: '可以守正，没有灾咎。'),
    YaoText(position: '九五', text: '无妄之疾，勿药有喜。', translation: '无妄而得的疾病，不用服药自然会痊愈而有喜。'),
    YaoText(position: '上九', text: '无妄，行有眚，无攸利。', translation: '虽然不妄为，但行动仍有灾殃，没有什么利益。'),
  ],
  // 26. 大畜
  [
    YaoText(position: '初九', text: '有厉，利已。', translation: '有危险，利于停止。'),
    YaoText(position: '九二', text: '舆说輹。', translation: '车子脱落了车轴上的伏兔。'),
    YaoText(position: '九三', text: '良马逐，利艰贞。曰闲舆卫，利有攸往。', translation: '良马追逐奔驰，利于在艰难中守正。每日练习驾车和护卫，利于有所前往。'),
    YaoText(position: '六四', text: '童牛之牿，元吉。', translation: '给小牛角上装上横木，大吉。'),
    YaoText(position: '六五', text: '豮豕之牙，吉。', translation: '阉割的猪的牙齿（已无危害），吉祥。'),
    YaoText(position: '上九', text: '何天之衢，亨。', translation: '通达于天的大道，通达。'),
  ],
  // 27. 颐
  [
    YaoText(position: '初九', text: '舍尔灵龟，观我朵颐，凶。', translation: '舍弃你灵验的龟甲不用，却观望我鼓动腮帮进食的样子，凶险。'),
    YaoText(position: '六二', text: '颠颐，拂经，于丘颐，征凶。', translation: '颠倒颐养之道，违背常理，到山丘上去求取食物，出征有凶险。'),
    YaoText(position: '六三', text: '拂颐，贞凶，十年勿用，无攸利。', translation: '违背颐养之道，守正也有凶险，十年都不宜有所作为，没有什么利益。'),
    YaoText(position: '六四', text: '颠颐，吉。虎视眈眈，其欲逐逐，无咎。', translation: '颠倒颐养之道（向下求养于贤者），吉祥。像老虎注视猎物那样专注，欲望接连不断，没有灾咎。'),
    YaoText(position: '六五', text: '拂经，居贞吉，不可涉大川。', translation: '违背常理（依附于上九），安居守正则吉祥，不可渡过大河。'),
    YaoText(position: '上九', text: '由颐，厉，吉。利涉大川。', translation: '天下人都依靠他来颐养，虽有危险但终归吉祥。利于渡过大河。'),
  ],
  // 28. 大过
  [
    YaoText(position: '初六', text: '藉用白茅，无咎。', translation: '用白茅草铺垫在下面，没有灾咎。'),
    YaoText(position: '九二', text: '枯杨生稊，老夫得其女妻，无不利。', translation: '枯萎的杨树重新萌生新芽，老翁娶得年轻的妻子，无所不利。'),
    YaoText(position: '九三', text: '栋桡，凶。', translation: '栋梁弯曲，凶。'),
    YaoText(position: '九四', text: '栋隆，吉。有它，吝。', translation: '栋梁高耸隆起，吉。但若有其他企图，则有困难。'),
    YaoText(position: '九五', text: '枯杨生华，老妇得其士夫，无咎无誉。', translation: '枯萎的杨树开出花朵，老妇人嫁给年轻的丈夫，没有灾咎也没有荣誉。'),
    YaoText(position: '上六', text: '过涉灭顶，凶，无咎。', translation: '涉水过深淹没了头顶，凶，但舍身取义则无灾咎。'),
  ],
  // 29. 坎
  [
    YaoText(position: '初六', text: '习坎，入于坎窞，凶。', translation: '重重险难，陷入深坑之中，凶险。'),
    YaoText(position: '九二', text: '坎有险，求小得。', translation: '坎中有险，只能有小的收获。'),
    YaoText(position: '六三', text: '来之坎坎，险且枕，入于坎窞，勿用。', translation: '来来往往都是险坑，危险且困顿，陷入深坑之中，不可有所作为。'),
    YaoText(position: '六四', text: '樽酒簋贰，用缶，纳约自牖，终无咎。', translation: '一樽酒两簋饭，用瓦缶盛装，从窗口递送，最终没有灾咎。'),
    YaoText(position: '九五', text: '坎不盈，祗既平，无咎。', translation: '坎中之水未满，只等到水面平稳，就没有灾咎。'),
    YaoText(position: '上六', text: '系用徽纆，寘于丛棘，三岁不得，凶。', translation: '用绳索捆绑，关在荆棘丛中，三年不能脱困，凶险。'),
  ],
  // 30. 离
  [
    YaoText(position: '初九', text: '履错然，敬之，无咎。', translation: '脚步交错杂乱，保持恭敬谨慎，没有灾咎。'),
    YaoText(position: '六二', text: '黄离，元吉。', translation: '黄色的光明，大吉。'),
    YaoText(position: '九三', text: '日昃之离，不鼓缶而歌，则大耋之嗟，凶。', translation: '太阳偏西时的光明，若不击缶而歌，就会有老年的悲叹，凶险。'),
    YaoText(position: '九四', text: '突如其来如，焚如，死如，弃如。', translation: '突然到来，如火焚烧，如同死亡，如同被弃。'),
    YaoText(position: '六五', text: '出涕沱若，戚嗟若，吉。', translation: '流泪滂沱，忧伤叹息，吉祥。'),
    YaoText(position: '上九', text: '王用出征，有嘉折首，获匪其丑，无咎。', translation: '君王用兵出征，有嘉奖斩获敌首，擒获的不是同类，没有灾咎。'),
  ],
  // 31. 咸
  [
    YaoText(position: '初六', text: '咸其拇。', translation: '感应在脚拇指。'),
    YaoText(position: '六二', text: '咸其腓，凶，居吉。', translation: '感应在小腿肚，凶险，安居则吉。'),
    YaoText(position: '九三', text: '咸其股，执其随，往吝。', translation: '感应在大腿，执意跟随他人，前往有憾。'),
    YaoText(position: '九四', text: '贞吉悔亡，憧憧往来，朋从尔思。', translation: '守正吉祥悔恨消失，心意不定地来来往往，朋友会顺从你的心意。'),
    YaoText(position: '九五', text: '咸其脢，无悔。', translation: '感应在脊背，没有悔恨。'),
    YaoText(position: '上六', text: '咸其辅颊舌。', translation: '感应在面颊和舌头。'),
  ],
  // 32. 恒
  [
    YaoText(position: '初六', text: '浚恒，贞凶，无攸利。', translation: '追求深远的恒久，守正也凶，没有什么利益。'),
    YaoText(position: '九二', text: '悔亡。', translation: '悔恨消失。'),
    YaoText(position: '九三', text: '不恒其德，或承之羞，贞吝。', translation: '不能持久地保持德行，有时会蒙受羞辱，守正也有困难。'),
    YaoText(position: '九四', text: '田无禽。', translation: '田猎无所获。'),
    YaoText(position: '六五', text: '恒其德，贞。妇人吉，夫子凶。', translation: '持久地保持德行，守正。妇人吉，丈夫凶。'),
    YaoText(position: '上六', text: '振恒，凶。', translation: '躁动不安地求恒久，凶。'),
  ],
  // 33. 遁
  [
    YaoText(position: '初六', text: '遁尾，厉，勿用有攸往。', translation: '退避时落在后面，有危险，不宜有所前往。'),
    YaoText(position: '六二', text: '执之用黄牛之革，莫之胜说。', translation: '用黄牛皮制的绳索捆绑，没有人能挣脱。'),
    YaoText(position: '九三', text: '系遁，有疾厉，畜臣妾吉。', translation: '被牵绊而不能退避，有危险，蓄养臣仆婢妾则吉。'),
    YaoText(position: '九四', text: '好遁，君子吉，小人否。', translation: '从容退避，君子吉祥，小人不利。'),
    YaoText(position: '九五', text: '嘉遁，贞吉。', translation: '美好地退避，守正则吉祥。'),
    YaoText(position: '上九', text: '肥遁，无不利。', translation: '远走高飞地退避，无所不利。'),
  ],
  // 34. 大壮
  [
    YaoText(position: '初九', text: '壮于趾，征凶，有孚。', translation: '刚壮表现在脚趾，前进则凶险，但有诚信。'),
    YaoText(position: '九二', text: '贞吉。', translation: '守正则吉祥。'),
    YaoText(position: '九三', text: '小人用壮，君子用罔，贞厉。羝羊触藩，羸其角。', translation: '小人凭借刚壮蛮干，君子则不会这样，守正也有危险。公羊用角撞击篱笆，角被缠住了。'),
    YaoText(position: '九四', text: '贞吉悔亡，藩决不羸，壮于大舆之輹。', translation: '守正则吉祥，悔恨消失。篱笆被冲破而不再缠住角，刚壮如大车的车轴。'),
    YaoText(position: '六五', text: '丧羊于易，无悔。', translation: '在田边丢失了羊，没有悔恨。'),
    YaoText(position: '上六', text: '羝羊触藩，不能退，不能遂，无攸利。艰则吉。', translation: '公羊用角撞击篱笆，既不能退回，又不能前进，没有什么好处。在艰难中谨慎则吉祥。'),
  ],
  // 35. 晋
  [
    YaoText(position: '初六', text: '晋如，摧如，贞吉。罔孚，裕无咎。', translation: '前进时受到阻碍摧折，守正则吉。即使不被信任，宽裕自处则无过咎。'),
    YaoText(position: '六二', text: '晋如，愁如，贞吉。受兹介福，于其王母。', translation: '前进时忧愁重重，守正则吉。从祖母那里承受盛大的福泽。'),
    YaoText(position: '六三', text: '众允，悔亡。', translation: '众人信任允许，悔恨消亡。'),
    YaoText(position: '九四', text: '晋如鼫鼠，贞厉。', translation: '前进时如同硕鼠般贪婪畏缩，即使守正也有危险。'),
    YaoText(position: '六五', text: '悔亡，失得勿恤，往吉，无不利。', translation: '悔恨消亡，不必忧虑得失，前往吉祥，无所不利。'),
    YaoText(position: '上九', text: '晋其角，维用伐邑，厉吉无咎，贞吝。', translation: '以角顶进，只宜用来讨伐自己的城邑，虽有危险但终获吉祥无咎，若一味守正则有憾。'),
  ],
  // 36. 明夷
  [
    YaoText(position: '初九', text: '明夷于飞，垂其翼。君子于行，三日不食。有攸往，主人有言。', translation: '光明受伤飞行，垂下了翅膀。君子在旅途中，三天不吃东西。有所前往，主人有所议论。'),
    YaoText(position: '六二', text: '明夷，夷于左股，用拯马壮，吉。', translation: '光明受伤，伤在左腿，用强壮的马来拯救，吉祥。'),
    YaoText(position: '九三', text: '明夷于南狩，得其大首，不可疾贞。', translation: '光明受伤时到南方狩猎，捕获了大头目，不可操之过急。'),
    YaoText(position: '六四', text: '入于左腹，获明夷之心，于出门庭。', translation: '进入左腹之中，了解了使光明受伤者的心意，于是走出门庭。'),
    YaoText(position: '六五', text: '箕子之明夷，利贞。', translation: '箕子那样隐藏光明，利于守正。'),
    YaoText(position: '上六', text: '不明晦，初登于天，后入于地。', translation: '不是光明而是黑暗，起初升上天空，后来坠入地下。'),
  ],
  // 37. 家人
  [
    YaoText(position: '初九', text: '闲有家，悔亡。', translation: '治家之初就立好规矩防范过失，悔恨消失。'),
    YaoText(position: '六二', text: '无攸遂，在中馈，贞吉。', translation: '不要随意妄为，主持家中饮食之事，守正则吉祥。'),
    YaoText(position: '九三', text: '家人嗃嗃，悔厉，吉。妇子嘻嘻，终吝。', translation: '治家严厉使家人叫苦，虽有悔恨和危险，但终归吉祥。若让妇人孩子嘻嘻哈哈不守规矩，终将有憾。'),
    YaoText(position: '六四', text: '富家，大吉。', translation: '使家庭富裕，大吉。'),
    YaoText(position: '九五', text: '王假有家，勿恤，吉。', translation: '君王以此治理天下如治家，不必忧虑，吉祥。'),
    YaoText(position: '上九', text: '有孚威如，终吉。', translation: '心怀诚信且有威严，终将吉祥。'),
  ],
  // 38. 睽
  [
    YaoText(position: '初九', text: '悔亡，丧马勿逐，自复。见恶人，无咎。', translation: '悔恨消失，失去马匹不必追赶，它会自己回来。接见品行不好的人，没有灾咎。'),
    YaoText(position: '九二', text: '遇主于巷，无咎。', translation: '在小巷中遇到主人，没有灾咎。'),
    YaoText(position: '六三', text: '见舆曳，其牛掣，其人天且劓。无初有终。', translation: '看见车子被拖拉，拉车的牛被阻止，驾车人受了刺额割鼻之刑。没有好的开始，但有好的结局。'),
    YaoText(position: '九四', text: '睽孤，遇元夫，交孚，厉无咎。', translation: '乖离孤独，遇到善良的人，以诚信相交，虽有危险但没有灾咎。'),
    YaoText(position: '六五', text: '悔亡，厥宗噬肤，往何咎。', translation: '悔恨消失，同宗之人亲密如咬噬柔嫩的肉，前往有什么灾咎呢。'),
    YaoText(position: '上九', text: '睽孤，见豕负涂，载鬼一车，先张之弧，后说之弧。匪寇婚媾，往遇雨则吉。', translation: '乖离孤独，看见猪背上涂满污泥，一车上装满了鬼。先拉开弓要射，后来又放下了弓。不是来抢劫的，是来求婚的，前往遇到雨水就吉祥。'),
  ],
  // 39. 蹇
  [
    YaoText(position: '初六', text: '往蹇来誉。', translation: '前往有困难，退回来会得到赞誉。'),
    YaoText(position: '六二', text: '王臣蹇蹇，匪躬之故。', translation: '君王的臣子艰难前行，不是为了自己的缘故。'),
    YaoText(position: '九三', text: '往蹇来反。', translation: '前往有困难，退回来返归。'),
    YaoText(position: '六四', text: '往蹇来连。', translation: '前往有困难，退回来与人连合。'),
    YaoText(position: '九五', text: '大蹇朋来。', translation: '遭遇大困难，朋友前来帮助。'),
    YaoText(position: '上六', text: '往蹇来硕，吉。利见大人。', translation: '前往有困难，退回来有大收获，吉祥。利于拜见大德之人。'),
  ],
  // 40. 解
  [
    YaoText(position: '初六', text: '无咎。', translation: '没有灾咎。'),
    YaoText(position: '九二', text: '田获三狐，得黄矢，贞吉。', translation: '田猎获得三只狐狸，得到黄色的箭矢，守正则吉。'),
    YaoText(position: '六三', text: '负且乘，致寇至，贞吝。', translation: '背着东西又乘车，招来盗寇，守正也有困难。'),
    YaoText(position: '九四', text: '解而拇，朋至斯孚。', translation: '解除你的大拇指之束缚，朋友到来就能取得信任。'),
    YaoText(position: '六五', text: '君子维有解，吉。有孚于小人。', translation: '君子能够解除困难，吉祥。对小人也能以诚信感化。'),
    YaoText(position: '上六', text: '公用射隼于高墉之上，获之，无不利。', translation: '公侯在高墙上射中了隼鹰，捕获了它，无所不利。'),
  ],
  // 41. 损
  [
    YaoText(position: '初九', text: '已事遄往，无咎，酌损之。', translation: '办完事情赶快前往，没有灾咎，酌量减损。'),
    YaoText(position: '九二', text: '利贞，征凶。弗损益之。', translation: '利于守正，征伐则凶。不要减损它，反而要增益它。'),
    YaoText(position: '六三', text: '三人行则损一人，一人行则得其友。', translation: '三人同行就会减少一人，一人独行就会得到朋友。'),
    YaoText(position: '六四', text: '损其疾，使遄有喜，无咎。', translation: '减损自己的毛病，使人赶快来就会有喜庆，没有灾咎。'),
    YaoText(position: '六五', text: '或益之十朋之龟，弗克违，元吉。', translation: '有人送来价值十朋的大龟，不能推辞，大吉。'),
    YaoText(position: '上九', text: '弗损益之，无咎，贞吉，利有攸往，得臣无家。', translation: '不减损反而增益，没有灾咎，守正吉祥，利于有所前往，得到臣民归附而不分私家。'),
  ],
  // 42. 益
  [
    YaoText(position: '初九', text: '利用为大作，元吉，无咎。', translation: '利于大有作为，大吉，没有灾咎。'),
    YaoText(position: '六二', text: '或益之十朋之龟，弗克违，永贞吉。王用享于帝，吉。', translation: '有人赐予价值十朋的大龟，不可推辞，长久守正则吉祥。君王用此祭祀上帝，吉祥。'),
    YaoText(position: '六三', text: '益之用凶事，无咎。有孚中行，告公用圭。', translation: '因为凶险之事而获得增益，没有灾咎。心怀诚信，行中正之道，可以持圭禀告公侯。'),
    YaoText(position: '六四', text: '中行，告公从，利用为依迁国。', translation: '行中正之道，禀告公侯而得到听从，利于作为依靠来迁移国都。'),
    YaoText(position: '九五', text: '有孚惠心，勿问元吉。有孚惠我德。', translation: '心怀诚信有施惠之心，不用占问就知道大吉。他人也以诚信和恩惠回报我的德行。'),
    YaoText(position: '上九', text: '莫益之，或击之。立心勿恒，凶。', translation: '没有人增益他，甚至有人攻击他。立心不恒久，凶险。'),
  ],
  // 43. 夬
  [
    YaoText(position: '初九', text: '壮于前趾，往不胜为咎。', translation: '刚壮表现在前脚趾，前往不能取胜就会有灾咎。'),
    YaoText(position: '九二', text: '惕号，莫夜有戎，勿恤。', translation: '惊恐呼号，夜晚有敌人来犯，不必忧虑。'),
    YaoText(position: '九三', text: '壮于頄，有凶。君子夬夬，独行遇雨，若濡有愠，无咎。', translation: '刚壮表现在颧骨上，有凶险。君子决断再决断，独行时遇到雨淋，像被淋湿而让人不快，但没有灾咎。'),
    YaoText(position: '九四', text: '臀无肤，其行次且。牵羊悔亡，闻言不信。', translation: '臀部没有皮肤，行走艰难。牵着羊走悔恨会消失，但听到这话却不相信。'),
    YaoText(position: '九五', text: '苋陆夬夬，中行无咎。', translation: '像拔除苋陆草一样果断决断，保持中正之道就没有灾咎。'),
    YaoText(position: '上六', text: '无号，终有凶。', translation: '没有号令，最终会有凶险。'),
  ],
  // 44. 姤
  [
    YaoText(position: '初六', text: '系于金柅，贞吉。有攸往，见凶。羸豕孚蹢躅。', translation: '系缚在金属制的车闸上，守正则吉。若有所前往则遇凶险。瘦弱的猪躁动不安地来回走动。'),
    YaoText(position: '九二', text: '包有鱼，无咎，不利宾。', translation: '厨房中有鱼，无过咎，但不宜用来招待宾客。'),
    YaoText(position: '九三', text: '臀无肤，其行次且，厉，无大咎。', translation: '臀部没有皮肤，行走艰难，有危险，但无大的过咎。'),
    YaoText(position: '九四', text: '包无鱼，起凶。', translation: '厨房中没有鱼，由此引发凶险。'),
    YaoText(position: '九五', text: '以杞包瓜，含章，有陨自天。', translation: '用杞树叶包裹瓜果，内含美好的文采，有美好之物从天而降。'),
    YaoText(position: '上九', text: '姤其角，吝，无咎。', translation: '在角落相遇，有憾惜，但无过咎。'),
  ],
  // 45. 萃
  [
    YaoText(position: '初六', text: '有孚不终，乃乱乃萃，若号，一握为笑，勿恤，往无咎。', translation: '有诚信但不能坚持到底，于是混乱聚合，如果呼号，一把握手就转为欢笑，不必忧虑，前往无灾咎。'),
    YaoText(position: '六二', text: '引吉，无咎。孚乃利用禴。', translation: '被引导前往则吉，无灾咎。心存诚信则利于举行简约的祭祀。'),
    YaoText(position: '六三', text: '萃如嗟如，无攸利。往无咎，小吝。', translation: '聚合而叹息，没有什么利益。前往没有灾咎，稍有遗憾。'),
    YaoText(position: '九四', text: '大吉，无咎。', translation: '大吉，没有灾咎。'),
    YaoText(position: '九五', text: '萃有位，无咎。匪孚，元永贞，悔亡。', translation: '聚合而居尊位，无灾咎。如果没有诚信，就要保持恒久守正，悔恨才能消失。'),
    YaoText(position: '上六', text: '赍咨涕洟，无咎。', translation: '嗟叹涕泣，无灾咎。'),
  ],
  // 46. 升
  [
    YaoText(position: '初六', text: '允升，大吉。', translation: '诚信而上升，大吉。'),
    YaoText(position: '九二', text: '孚乃利用禴，无咎。', translation: '心怀诚信则利于举行禴祭，没有灾咎。'),
    YaoText(position: '九三', text: '升虚邑。', translation: '上升进入空虚之城，畅通无阻。'),
    YaoText(position: '六四', text: '王用亨于岐山，吉，无咎。', translation: '君王在岐山祭祀，吉祥，没有灾咎。'),
    YaoText(position: '六五', text: '贞吉，升阶。', translation: '守正则吉，循阶而上升。'),
    YaoText(position: '上六', text: '冥升，利于不息之贞。', translation: '昏暗中仍在上升，利于坚持不懈地守正。'),
  ],
  // 47. 困
  [
    YaoText(position: '初六', text: '臀困于株木，入于幽谷，三岁不觌。', translation: '臀部被困在树桩上，陷入幽暗的山谷，三年不能出头露面。'),
    YaoText(position: '九二', text: '困于酒食，朱绂方来，利用享祀。征凶，无咎。', translation: '在酒食中受困，朱色蔽膝的贵人正要来到，利于祭祀。出征则凶，但无灾咎。'),
    YaoText(position: '六三', text: '困于石，据于蒺藜，入于其宫，不见其妻，凶。', translation: '被石头困阻，又靠在蒺藜上，回到家中，看不见妻子，凶险。'),
    YaoText(position: '九四', text: '来徐徐，困于金车，吝，有终。', translation: '慢慢前来，被困在华贵的车上，有困难，但终有结果。'),
    YaoText(position: '九五', text: '劓刖，困于赤绂，乃徐有说，利用祭祀。', translation: '受割鼻断足之刑，被朱红蔽膝之人所困，慢慢才能解脱，利于祭祀。'),
    YaoText(position: '上六', text: '困于葛藟，于臲卼，曰动悔有悔，征吉。', translation: '被葛藤缠绕所困，处于不安之中，如果说行动有悔恨就会真的有悔恨，出征则吉。'),
  ],
  // 48. 井
  [
    YaoText(position: '初六', text: '井泥不食，旧井无禽。', translation: '井底淤泥使井水不可饮用，破旧的井连禽鸟都不来光顾。'),
    YaoText(position: '九二', text: '井谷射鲋，瓮敝漏。', translation: '井底的溪谷只能射到小鱼，水瓮也已破漏。'),
    YaoText(position: '九三', text: '井渫不食，为我心恻。可用汲，王明，并受其福。', translation: '井已淘洗干净却无人饮用，使我心中悲伤。可以汲取饮用，如果君王贤明，大家都能蒙受其福泽。'),
    YaoText(position: '六四', text: '井甃，无咎。', translation: '用砖石修砌井壁，没有灾咎。'),
    YaoText(position: '九五', text: '井冽，寒泉食。', translation: '井水清冽，寒泉可供饮用。'),
    YaoText(position: '上六', text: '井收勿幕，有孚元吉。', translation: '井水已汲上来不要遮盖，有诚信则大吉。'),
  ],
  // 49. 革
  [
    YaoText(position: '初九', text: '巩用黄牛之革。', translation: '用黄牛皮革加固束缚。'),
    YaoText(position: '六二', text: '巳日乃革之，征吉，无咎。', translation: '到了巳日就进行变革，前进则吉祥，没有灾咎。'),
    YaoText(position: '九三', text: '征凶，贞厉。革言三就，有孚。', translation: '前进有凶险，守正也有危险。变革的议论反复三次确认后，人们就会相信。'),
    YaoText(position: '九四', text: '悔亡，有孚改命，吉。', translation: '悔恨消亡，以诚信变革天命，吉祥。'),
    YaoText(position: '九五', text: '大人虎变，未占有孚。', translation: '大人像猛虎一样威严地变革，不用占卜人们就会信服。'),
    YaoText(position: '上六', text: '君子豹变，小人革面，征凶，居贞吉。', translation: '君子像豹子一样从容地变革，小人只是表面改变。前进有凶险，安居守正则吉祥。'),
  ],
  // 50. 鼎
  [
    YaoText(position: '初六', text: '鼎颠趾，利出否。得妾以其子，无咎。', translation: '鼎翻倒倾斜，利于倒出渣滓。纳妾是因为她能生子，没有灾咎。'),
    YaoText(position: '九二', text: '鼎有实，我仇有疾，不我能即，吉。', translation: '鼎中有食物，我的对手有病，不能接近我，吉祥。'),
    YaoText(position: '九三', text: '鼎耳革，其行塞，雉膏不食。方雨亏悔，终吉。', translation: '鼎耳脱落变形，无法搬动，鼎中的肥美野鸡肉吃不到。待到下雨时悔恨减少，最终吉祥。'),
    YaoText(position: '九四', text: '鼎折足，覆公餗，其形渥，凶。', translation: '鼎折断了足，倾覆了王公的食物，鼎身被弄脏，凶险。'),
    YaoText(position: '六五', text: '鼎黄耳金铉，利贞。', translation: '鼎配上黄色的鼎耳和金属的横杠，利于守正。'),
    YaoText(position: '上九', text: '鼎玉铉，大吉，无不利。', translation: '鼎配上玉制的横杠，大吉，无所不利。'),
  ],
  // 51. 震
  [
    YaoText(position: '初九', text: '震来虩虩，后笑言哑哑，吉。', translation: '雷声到来令人恐惧战栗，之后谈笑自若，吉祥。'),
    YaoText(position: '六二', text: '震来厉，亿丧贝，跻于九陵，勿逐，七日得。', translation: '雷声到来有危险，估计会丧失钱财，应登上高陵避难，不必追寻，七天后自会失而复得。'),
    YaoText(position: '六三', text: '震苏苏，震行无眚。', translation: '雷声使人惊恐不安，但因震惧而谨慎行事就不会有灾祸。'),
    YaoText(position: '九四', text: '震遂泥。', translation: '雷声震动，陷入泥泞之中。'),
    YaoText(position: '六五', text: '震往来厉，亿无丧，有事。', translation: '雷声往来都有危险，但估计不会有所丧失，有祭祀之事。'),
    YaoText(position: '上六', text: '震索索，视矍矍，征凶。震不于其躬，于其邻，无咎。婚媾有言。', translation: '雷声使人颤抖不已，目光惊恐不定，前往则凶。雷未击中自身而击中邻人，没有灾咎。但婚嫁之事会有口舌之争。'),
  ],
  // 52. 艮
  [
    YaoText(position: '初六', text: '艮其趾，无咎，利永贞。', translation: '抑止于脚趾，没有灾咎，利于长久守正。'),
    YaoText(position: '六二', text: '艮其腓，不拯其随，其心不快。', translation: '抑止于小腿，不能拯救所追随的人，心中不快。'),
    YaoText(position: '九三', text: '艮其限，列其夤，厉薰心。', translation: '抑止于腰部，撕裂其脊肉，危险如火烧心。'),
    YaoText(position: '六四', text: '艮其身，无咎。', translation: '抑止于躯干，没有灾咎。'),
    YaoText(position: '六五', text: '艮其辅，言有序，悔亡。', translation: '抑止于面颊，说话有条理，悔恨消失。'),
    YaoText(position: '上九', text: '敦艮，吉。', translation: '敦厚地抑止，吉祥。'),
  ],
  // 53. 渐
  [
    YaoText(position: '初六', text: '鸿渐于干，小子厉，有言，无咎。', translation: '鸿雁渐进到水边，小人有危险，有议论之言，但没有灾咎。'),
    YaoText(position: '六二', text: '鸿渐于磐，饮食衎衎，吉。', translation: '鸿雁渐进到磐石上，饮食安乐和美，吉祥。'),
    YaoText(position: '九三', text: '鸿渐于陆，夫征不复，妇孕不育，凶。利御寇。', translation: '鸿雁渐进到高地，丈夫出征不再回来，妇人怀孕不能生育，凶险。但利于抵御盗寇。'),
    YaoText(position: '六四', text: '鸿渐于木，或得其桷，无咎。', translation: '鸿雁渐进到树木上，或许栖息在平坦的树枝上，没有灾咎。'),
    YaoText(position: '九五', text: '鸿渐于陵，妇三岁不孕，终莫之胜，吉。', translation: '鸿雁渐进到丘陵上，妇人三年不孕，最终没有什么能阻止（和合），吉祥。'),
    YaoText(position: '上九', text: '鸿渐于陆，其羽可用为仪，吉。', translation: '鸿雁渐进到云路高处，它的羽毛可以用来作为仪饰，吉祥。'),
  ],
  // 54. 归妹
  [
    YaoText(position: '初九', text: '归妹以娣，跛能履，征吉。', translation: '嫁妹以侧室身份，犹如跛脚之人尚能行走，前进吉祥。'),
    YaoText(position: '九二', text: '眇能视，利幽人之贞。', translation: '独眼尚能看见，利于幽隐之人守正。'),
    YaoText(position: '六三', text: '归妹以须，反归以娣。', translation: '嫁妹以等待，回来后以侧室身份出嫁。'),
    YaoText(position: '九四', text: '归妹愆期，迟归有时。', translation: '嫁妹延误了婚期，推迟出嫁终会等到时机。'),
    YaoText(position: '六五', text: '帝乙归妹，其君之袂，不如其娣之袂良。月几望，吉。', translation: '帝乙嫁妹，正妻的衣袖不如侧室的衣袖华美。月亮将近圆满，吉祥。'),
    YaoText(position: '上六', text: '女承筐无实，士刲羊无血，无攸利。', translation: '女子举着空筐没有果实，男子宰羊却无血流出，没有什么利益。'),
  ],
  // 55. 丰
  [
    YaoText(position: '初九', text: '遇其配主，虽旬无咎，往有尚。', translation: '遇到匹配的主人，虽经旬日也没有灾咎，前往会受到嘉奖。'),
    YaoText(position: '六二', text: '丰其蔀，日中见斗，往得疑疾，有孚发若，吉。', translation: '丰盛的帷幕遮蔽，正午时看见北斗星，前往会招致猜疑，以诚信启发他人，吉祥。'),
    YaoText(position: '九三', text: '丰其沛，日中见沫，折其右肱，无咎。', translation: '丰盛的旗帜遮蔽，正午时看见小星星，折断了右臂，没有灾咎。'),
    YaoText(position: '九四', text: '丰其蔀，日中见斗，遇其夷主，吉。', translation: '丰盛的帷幕遮蔽，正午时看见北斗星，遇到平等的主人，吉祥。'),
    YaoText(position: '六五', text: '来章，有庆誉，吉。', translation: '招来有文采的人，会有喜庆和荣誉，吉祥。'),
    YaoText(position: '上六', text: '丰其屋，蔀其家，窥其户，阒其无人，三岁不觌，凶。', translation: '房屋很大，用帷幕遮蔽家门，窥视门户，寂静无人，三年都看不到人，凶险。'),
  ],
  // 56. 旅
  [
    YaoText(position: '初六', text: '旅琐琐，斯其所取灾。', translation: '旅途中琐碎卑微，这是自取灾祸。'),
    YaoText(position: '六二', text: '旅即次，怀其资，得童仆贞。', translation: '旅途中到了旅舍，怀揣旅资，得到童仆的忠心。'),
    YaoText(position: '九三', text: '旅焚其次，丧其童仆，贞厉。', translation: '旅舍被火焚烧，失去了童仆，守正也有危险。'),
    YaoText(position: '九四', text: '旅于处，得其资斧，我心不快。', translation: '旅居一处，得到旅资和斧头，但心中不快。'),
    YaoText(position: '六五', text: '射雉一矢亡，终以誉命。', translation: '射野鸡一箭射中，最终得到荣誉和爵命。'),
    YaoText(position: '上九', text: '鸟焚其巢，旅人先笑后号啕。丧牛于易，凶。', translation: '鸟巢被火焚烧，旅人先笑后痛哭。在边境丧失了牛，凶险。'),
  ],
  // 57. 巽
  [
    YaoText(position: '初六', text: '进退，利武人之贞。', translation: '进退犹豫不决，利于武人坚守正道。'),
    YaoText(position: '九二', text: '巽在床下，用史巫纷若，吉，无咎。', translation: '谦卑伏于床下，借用众多史巫祝祷，吉祥，没有灾咎。'),
    YaoText(position: '九三', text: '频巽，吝。', translation: '频频谦卑顺从，有憾惜。'),
    YaoText(position: '六四', text: '悔亡，田获三品。', translation: '悔恨消失，田猎获得三种猎物。'),
    YaoText(position: '九五', text: '贞吉，悔亡，无不利。无初有终。先庚三日，后庚三日，吉。', translation: '守正则吉祥，悔恨消失，无所不利。虽无好的开始但有好的结局。在庚日前三天和庚日后三天行事，吉祥。'),
    YaoText(position: '上九', text: '巽在床下，丧其资斧，贞凶。', translation: '谦卑伏于床下，丧失了钱财和斧头，守正也凶险。'),
  ],
  // 58. 兑
  [
    YaoText(position: '初九', text: '和兑，吉。', translation: '和悦地交往，吉祥。'),
    YaoText(position: '九二', text: '孚兑，吉，悔亡。', translation: '以诚信交往而喜悦，吉祥，悔恨消失。'),
    YaoText(position: '六三', text: '来兑，凶。', translation: '前来取悦于人，凶险。'),
    YaoText(position: '九四', text: '商兑未宁，介疾有喜。', translation: '商量交往之事尚未安宁，隔绝邪恶则有喜庆。'),
    YaoText(position: '九五', text: '孚于剥，有厉。', translation: '信任于小人的剥蚀，有危险。'),
    YaoText(position: '上六', text: '引兑。', translation: '引诱他人来取悦自己。'),
  ],
  // 59. 涣
  [
    YaoText(position: '初六', text: '用拯马壮，吉。', translation: '用壮马来拯救，吉祥。'),
    YaoText(position: '九二', text: '涣奔其机，悔亡。', translation: '涣散时奔向凭依之处，悔恨消失。'),
    YaoText(position: '六三', text: '涣其躬，无悔。', translation: '涣散自身的私欲，没有悔恨。'),
    YaoText(position: '六四', text: '涣其群，元吉。涣有丘，匪夷所思。', translation: '涣散朋党，大吉。涣散之后聚成山丘，这不是常人所能想到的。'),
    YaoText(position: '九五', text: '涣汗其大号，涣王居，无咎。', translation: '如汗水般发布重大号令，疏散王室的积蓄赈济民众，没有灾咎。'),
    YaoText(position: '上九', text: '涣其血去逖出，无咎。', translation: '涣散其血光之灾，远离忧患，没有灾咎。'),
  ],
  // 60. 节
  [
    YaoText(position: '初九', text: '不出户庭，无咎。', translation: '不走出门庭，没有灾咎。'),
    YaoText(position: '九二', text: '不出门庭，凶。', translation: '不走出门庭，凶险。'),
    YaoText(position: '六三', text: '不节若，则嗟若，无咎。', translation: '不知节制，则有叹息，但没有灾咎。'),
    YaoText(position: '六四', text: '安节，亨。', translation: '安于节制，通达。'),
    YaoText(position: '九五', text: '甘节，吉，往有尚。', translation: '甘于节制，吉祥，前往会受到嘉奖。'),
    YaoText(position: '上六', text: '苦节，贞凶，悔亡。', translation: '苦于节制，守正有凶险，悔恨消亡。'),
  ],
  // 61. 中孚
  [
    YaoText(position: '初九', text: '虞吉，有他不燕。', translation: '预备妥当则吉祥，有其他变故则不安宁。'),
    YaoText(position: '九二', text: '鹤鸣在阴，其子和之。我有好爵，吾与尔靡之。', translation: '鹤在树荫中鸣叫，小鹤应和它。我有美酒，我与你共享。'),
    YaoText(position: '六三', text: '得敌，或鼓或罢，或泣或歌。', translation: '遇到对手，时而击鼓进攻时而疲惫停止，时而哭泣时而高歌。'),
    YaoText(position: '六四', text: '月几望，马匹亡，无咎。', translation: '月亮将近满月之时，一匹马走失了，没有灾咎。'),
    YaoText(position: '九五', text: '有孚挛如，无咎。', translation: '有诚信维系牵连，没有灾咎。'),
    YaoText(position: '上九', text: '翰音登于天，贞凶。', translation: '鸡鸣之声传上天空（虚声而无实德），守正也有凶险。'),
  ],
  // 62. 小过
  [
    YaoText(position: '初六', text: '飞鸟以凶。', translation: '飞鸟飞得过高而遭凶险。'),
    YaoText(position: '六二', text: '过其祖，遇其妣；不及其君，遇其臣，无咎。', translation: '越过祖父而遇到祖母；没有达到君主而遇到臣子，没有灾咎。'),
    YaoText(position: '九三', text: '弗过防之，从或戕之，凶。', translation: '不能超越而防备它，可能有人跟从而伤害他，凶险。'),
    YaoText(position: '九四', text: '无咎，弗过遇之。往厉必戒，勿用永贞。', translation: '没有灾咎，不要超越而去迎合它。前往有危险必须警戒，不可永久守正不变。'),
    YaoText(position: '六五', text: '密云不雨，自我西郊。公弋取彼在穴。', translation: '乌云密布但不下雨，来自我的西郊。王公射取那躲在洞穴中的猎物。'),
    YaoText(position: '上六', text: '弗遇过之，飞鸟离之，凶，是谓灾眚。', translation: '没有遇合却超越了，飞鸟远离而去，凶险，这就是灾祸。'),
  ],
  // 63. 既济
  [
    YaoText(position: '初九', text: '曳其轮，濡其尾，无咎。', translation: '拉住车轮使其减速，沾湿了尾巴，没有灾咎。'),
    YaoText(position: '六二', text: '妇丧其茀，勿逐，七日得。', translation: '妇人丢失了车帷，不用追寻，七天后会失而复得。'),
    YaoText(position: '九三', text: '高宗伐鬼方，三年克之，小人勿用。', translation: '高宗讨伐鬼方，三年才攻克，不可任用小人。'),
    YaoText(position: '六四', text: '繻有衣袽，终日戒。', translation: '华丽的衣服下面垫着破布，要整天保持警戒。'),
    YaoText(position: '九五', text: '东邻杀牛，不如西邻之禴祭，实受其福。', translation: '东边邻国杀牛盛祭，不如西边邻国简薄的祭祀，实际得到的福分更多。'),
    YaoText(position: '上六', text: '濡其首，厉。', translation: '水没过了头顶，有危险。'),
  ],
  // 64. 未济
  [
    YaoText(position: '初六', text: '濡其尾，吝。', translation: '沾湿了尾巴，有憾惜。'),
    YaoText(position: '九二', text: '曳其轮，贞吉。', translation: '拖住车轮不前进，守正则吉祥。'),
    YaoText(position: '六三', text: '未济，征凶，利涉大川。', translation: '尚未成功，出征有凶险，但利于渡过大河。'),
    YaoText(position: '九四', text: '贞吉，悔亡。震用伐鬼方，三年有赏于大国。', translation: '守正则吉祥，悔恨消失。振奋精神讨伐鬼方，三年后受到大国的赏赐。'),
    YaoText(position: '六五', text: '贞吉，无悔。君子之光，有孚，吉。', translation: '守正则吉祥，没有悔恨。君子的光辉，心怀诚信，吉祥。'),
    YaoText(position: '上九', text: '有孚于饮酒，无咎。濡其首，有孚失是。', translation: '怀着诚信饮酒庆贺，没有灾咎。若沾湿了头，即使有诚信也会失去正道。'),
  ],
];
