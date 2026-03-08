import 'package:flutter/material.dart';
import 'divination_screen.dart';
import '../widgets/tao_decorations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MysticBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                const SizedBox(height: 20),
                // 太极图
                Center(
                  child: TaijiSymbol(
                    size: 100,
                    yangColor: const Color(0xFFD4AF37),
                    yinColor: const Color(0xFF1a1a1a),
                    rotating: true,
                  ),
                ),
                const SizedBox(height: 32),
                // 标题
                const Text(
                  '周 易',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4AF37),
                    letterSpacing: 16,
                    shadows: [
                      Shadow(
                        color: Color(0xFFD4AF37),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // 八卦符号行
                const BaguaSymbols(
                  size: 18,
                  color: Color(0xFFD4AF37),
                ),
                const SizedBox(height: 24),
                // 副标题
                const Text(
                  '参天地，洞玄机',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Yi Jing Divination System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),
                // 古训
                CloudBorder(
                  padding: const EdgeInsets.all(24),
                  color: const Color(0xFFD4AF37),
                  child: Column(
                    children: [
                      const Text(
                        '易有太极，是生两仪',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 16,
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 1,
                        color: const Color(0x33D4AF37),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '两仪生四象，四象生八卦',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '《周易·系辞上》',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // 占卜箴言
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0x33C9372C),
                      width: 1,
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        '不诚不占，不义不占，不疑不占',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '《易学启蒙》',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // 开始按钮
                Center(
                  child: RuneButton(
                    text: '开始占卜',
                    icon: Icons.auto_fix_high,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DivinationScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // 关于按钮
                TextButton(
                  onPressed: () {
                    _showAboutDialog(context);
                  },
                  child: const Text(
                    '关于周易',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF0D0D0D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Color(0x33D4AF37),
            width: 1,
          ),
        ),
        title: const Row(
          children: [
            Icon(
              Icons.menu_book,
              color: Color(0xFFD4AF37),
            ),
            SizedBox(width: 8),
            Text(
              '关于周易',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        content: const Text(
          '周易是中国古代最重要的经典之一，被誉为群经之首，大道之源。'
          '其内容涵盖哲学、宇宙观、人生观等诸多方面。\n\n'
          '本应用基于传统易学规则，提供：\n'
          '• 大衍筮法 - 五十蓍草，揲之以四\n'
          '• 铜钱法 - 三枚铜钱，定阴阳之变\n'
          '• 梅花易数 - 以数起卦，心诚则灵\n\n'
          '占卜之道，在于知天命而尽人事，明吉凶而趋利避害。',
          style: TextStyle(
            color: Color(0xFFAAAAAA),
            height: 1.6,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '关闭',
              style: TextStyle(
                color: Color(0xFFD4AF37),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
