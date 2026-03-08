import 'package:flutter/material.dart';
import 'divination_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'ZHOUYI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFe94560),
                    letterSpacing: 8,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _trigramSymbol('乾', '☰'),
                    _trigramSymbol('兑', '☱'),
                    _trigramSymbol('离', '☲'),
                    _trigramSymbol('震', '☳'),
                    _trigramSymbol('巽', '☴'),
                    _trigramSymbol('坎', '☵'),
                    _trigramSymbol('艮', '☶'),
                    _trigramSymbol('坤', '☷'),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  '周易占卜系统',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Yi Jing Divination System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white38,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        '不诚不占，不义不占，不疑不占',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '《易学启蒙》',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DivinationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFe94560),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '开始占卜',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    _showAboutDialog(context);
                  },
                  child: const Text(
                    '关于周易',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _trigramSymbol(String name, String symbol) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Text(symbol, style: const TextStyle(fontSize: 20, color: Colors.white54)),
          const SizedBox(height: 2),
          Text(name, style: const TextStyle(fontSize: 10, color: Colors.white38)),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        title: const Text('关于周易', style: TextStyle(color: Colors.white)),
        content: const Text(
          '周易是中国古代最重要的经典之一，被誉为群经之首。'
          '本应用基于传统易学规则，提供大衍筮法、铜钱法、梅花易数三种起卦方式。',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭', style: TextStyle(color: Color(0xFFe94560))),
          ),
        ],
      ),
    );
  }
}
