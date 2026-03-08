import 'package:flutter/material.dart';
import 'divination_screen.dart';
import '../widgets/tao_decorations.dart';
import '../utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    return Scaffold(
      body: MysticBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: Responsive.horizontalPadding(context),
              child: ConstrainedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: isMobile ? 16 : 24),
                    // 太极图 - 响应式大小
                    Center(
                      child: TaijiSymbol(
                        size: isMobile ? 80 : (isTablet ? 90 : 100),
                        yangColor: const Color(0xFFD4AF37),
                        yinColor: const Color(0xFF1a1a1a),
                        rotating: true,
                      ),
                    ),
                    SizedBox(height: isMobile ? 20 : 32),
                    // 标题 - 响应式字体
                    Text(
                      '周 易',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ResponsiveFontSize.display(context),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD4AF37),
                        letterSpacing: isMobile ? 12 : 16,
                        shadows: const [
                          Shadow(
                            color: Color(0xFFD4AF37),
                            blurRadius: 20,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 6 : 8),
                    // 八卦符号行 - 响应式大小
                    BaguaSymbols(
                      size: isMobile ? 14 : 18,
                      color: const Color(0xFFD4AF37),
                    ),
                    SizedBox(height: isMobile ? 16 : 24),
                    // 副标题 - 响应式字体
                    Text(
                      '参天地，洞玄机',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: const Color(0xFFAAAAAA),
                        fontWeight: FontWeight.w300,
                        letterSpacing: isMobile ? 4 : 6,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Yi Jing Divination System',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 12,
                        color: const Color(0xFF666666),
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
                    // 古训 - 响应式内边距
                    CloudBorder(
                      padding: EdgeInsets.all(isMobile ? 16 : 24),
                      color: const Color(0xFFD4AF37),
                      child: Column(
                        children: [
                          Text(
                            '易有太极，是生两仪',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFD4AF37),
                              fontSize: isMobile ? 14 : 16,
                              letterSpacing: isMobile ? 2 : 4,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 60,
                            height: 1,
                            color: const Color(0x33D4AF37),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '两仪生四象，四象生八卦',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF888888),
                              fontSize: isMobile ? 12 : 14,
                              letterSpacing: isMobile ? 1 : 2,
                            ),
                          ),
                          SizedBox(height: isMobile ? 12 : 16),
                          Text(
                            '《周易·系辞上》',
                            style: TextStyle(
                              color: const Color(0xFF666666),
                              fontSize: isMobile ? 10 : 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 20 : 32),
                    // 占卜箴言 - 响应式内边距
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1a1a1a),
                        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                        border: Border.all(
                          color: const Color(0x33C9372C),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '不诚不占，不义不占，不疑不占',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFAAAAAA),
                              fontSize: isMobile ? 12 : 14,
                              letterSpacing: isMobile ? 1 : 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '《易学启蒙》',
                            style: TextStyle(
                              color: const Color(0xFF666666),
                              fontSize: isMobile ? 10 : 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
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
                    SizedBox(height: isMobile ? 16 : 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF0D0D0D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
          side: const BorderSide(
            color: Color(0x33D4AF37),
            width: 1,
          ),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.menu_book,
              color: Color(0xFFD4AF37),
            ),
            const SizedBox(width: 8),
            Text(
              '关于周易',
              style: TextStyle(
                color: const Color(0xFFD4AF37),
                letterSpacing: 2,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ],
        ),
        content: Text(
          '周易是中国古代最重要的经典之一，被誉为群经之首，大道之源。'
          '其内容涵盖哲学、宇宙观、人生观等诸多方面。\n\n'
          '本应用基于传统易学规则，提供：\n'
          '• 大衍筮法 - 五十蓍草，揲之以四\n'
          '• 铜钱法 - 三枚铜钱，定阴阳之变\n'
          '• 梅花易数 - 以数起卦，心诚则灵\n\n'
          '占卜之道，在于知天命而尽人事，明吉凶而趋利避害。',
          style: TextStyle(
            color: const Color(0xFFAAAAAA),
            height: 1.6,
            fontSize: isMobile ? 13 : 14,
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
