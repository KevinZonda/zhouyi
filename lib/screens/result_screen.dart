import 'package:flutter/material.dart';
import '../models/types.dart';
import '../core/calendar.dart';

class ResultScreen extends StatelessWidget {
  final HexagramAnalysis analysis;

  const ResultScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('卦象解析'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildHexagramDisplay(),
            const SizedBox(height: 24),
            _buildAnalysisTable(),
            const SizedBox(height: 24),
            _buildInterpretation(),
            const SizedBox(height: 24),
            _buildGuaCiSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFe94560).withValues(alpha: 0.3), 
            const Color(0xFF0f3460).withValues(alpha: 0.3)
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            analysis.question ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            analysis.method.displayName,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            '${analysis.dayGan.displayName}${analysis.dayZhi.displayName}日 ${analysis.monthZhi.displayName}月',
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildHexagramDisplay() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleHexagram(
              '本卦',
              analysis.originalHexagram.fullName,
              analysis.originalHexagram.unicode,
              analysis.originalHexagram.binary,
              true,
            ),
            if (analysis.changedHexagram != null) ...[
              const SizedBox(width: 20),
              const Icon(Icons.arrow_forward, color: Colors.white54),
              const SizedBox(width: 20),
              _buildSingleHexagram(
                '之卦',
                analysis.changedHexagram!.fullName,
                analysis.changedHexagram!.unicode,
                analysis.changedHexagram!.binary,
                false,
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '变爻: ${analysis.changingCount}个',
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleHexagram(
    String label,
    String name,
    String unicode,
    String binary,
    bool showChanging,
  ) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 8),
        Text(
          unicode,
          style: const TextStyle(fontSize: 48, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Column(
          children: List.generate(6, (i) {
            final pos = 5 - i;
            final isYang = binary[pos] == '1';
            final yaoInfo = analysis.yaoInfos[pos];
            final isChanging = showChanging && yaoInfo.changing;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: isYang
                  ? Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isChanging ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 25,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isChanging ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 25,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isChanging ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAnalysisTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Row(
              children: [
                Expanded(flex: 2, child: Text('爻位', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('干支', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 2, child: Text('五行', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('六亲', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('六神', style: TextStyle(color: Colors.white54))),
              ],
            ),
          ),
          ...List.generate(6, (i) {
            final yao = analysis.yaoInfos[5 - i];
            final posNames = ['初', '二', '三', '四', '五', '上'];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text(
                          '${posNames[5 - i]}爻',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        if (yao.isWorld)
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('世', style: TextStyle(fontSize: 10, color: Colors.orange)),
                          ),
                        if (yao.isResponse)
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('应', style: TextStyle(fontSize: 10, color: Colors.blue)),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${yao.tianGan.displayName}${yao.diZhi.displayName}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      yao.element.displayName,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      yao.liuQin.displayName,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      yao.liuShen.displayName,
                      style: TextStyle(
                        color: yao.liuShen.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInterpretation() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFe94560).withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '断卦规则',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            analysis.interpretationRule,
            style: const TextStyle(color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildGuaCiSection() {
    final hex = analysis.originalHexagram;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${hex.fullName}（第${hex.number}卦）',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          if (hex.guaCi.isNotEmpty) ...[
            const Text(
              '卦辞',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              hex.guaCi,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              hex.guaCiTranslation,
              style: const TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 16),
          ],
          if (hex.daXiang.isNotEmpty) ...[
            const Text(
              '大象传',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Text(
              hex.daXiang,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
