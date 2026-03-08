import 'package:flutter/material.dart';
import '../models/types.dart';

import '../widgets/tao_decorations.dart';

class ResultScreen extends StatelessWidget {
  final HexagramAnalysis analysis;

  const ResultScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('卦象解析'),
      ),
      body: MysticBackground(
        child: SingleChildScrollView(
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
              const SizedBox(height: 24),
              _buildYaoCiSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CloudBorder(
      color: const Color(0xFFD4AF37),
      child: Column(
        children: [
          // 问题
          Text(
            analysis.question ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFFF8DC),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 60,
            height: 1,
            color: const Color(0x33D4AF37),
          ),
          const SizedBox(height: 16),
          // 起卦方式
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_fix_high,
                color: Color(0xFFD4AF37),
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                analysis.method.displayName,
                style: const TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 时间
          Text(
            '${analysis.dayGan.displayName}${analysis.dayZhi.displayName}日 ${analysis.monthZhi.displayName}月',
            style: const TextStyle(
              color: Color(0xFF888888),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHexagramDisplay() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFD4AF37).withValues(alpha: 0.1),
            const Color(0xFF1a1a1a),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0x33D4AF37),
        ),
      ),
      child: Column(
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
                const SizedBox(width: 24),
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFD4AF37),
                      size: 28,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${analysis.changingCount}变',
                      style: const TextStyle(
                        color: Color(0xFFC9372C),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
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
        ],
      ),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0x33D4AF37),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          unicode,
          style: const TextStyle(
            fontSize: 56,
            color: Color(0xFFFFF8DC),
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
        Text(
          name,
          style: const TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(6, (i) {
            final pos = 5 - i;
            final isYang = binary[pos] == '1';
            final yaoInfo = analysis.yaoInfos[pos];
            final isChanging = showChanging && yaoInfo.changing;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isChanging)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x33C9372C),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '变',
                        style: TextStyle(
                          color: Color(0xFFC9372C),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  YaoLine(
                    isYang: isYang,
                    isChanging: isChanging,
                    width: 50,
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
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 表头
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0x33D4AF37),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '爻位',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '干支',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '五行',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '六亲',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '六神',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // 表格内容
          ...List.generate(6, (i) {
            final yao = analysis.yaoInfos[5 - i];
            final posNames = ['初', '二', '三', '四', '五', '上'];
            final isLast = i == 5;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: isLast
                      ? BorderSide.none
                      : const BorderSide(color: Color(0x1FFFFFFF)),
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
                          style: const TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 13,
                          ),
                        ),
                        if (yao.isWorld)
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x33D4AF37),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '世',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFFD4AF37),
                              ),
                            ),
                          ),
                        if (yao.isResponse)
                          Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x33888888),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '应',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${yao.tianGan.displayName}${yao.diZhi.displayName}',
                      style: const TextStyle(
                        color: Color(0xFFFFF8DC),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      yao.element.displayName,
                      style: TextStyle(
                        color: yao.element.color,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      yao.liuQin.displayName,
                      style: const TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      yao.liuShen.displayName,
                      style: TextStyle(
                        color: yao.liuShen.color,
                        fontSize: 13,
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
    return CloudBorder(
      color: const Color(0x33C9372C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0x33C9372C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.visibility,
                  color: Color(0xFFC9372C),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '断卦天机',
                style: TextStyle(
                  color: Color(0xFFC9372C),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1a1a1a),
              borderRadius: BorderRadius.circular(8),
              border: const Border(
                left: BorderSide(
                  color: Color(0xFFC9372C),
                  width: 3,
                ),
              ),
            ),
            child: Text(
              analysis.interpretationRule,
              style: const TextStyle(
                color: Color(0xFFCCCCCC),
                height: 1.8,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuaCiSection() {
    final hex = analysis.originalHexagram;
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_book,
                color: Color(0xFFD4AF37),
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${hex.fullName}（第${hex.number}卦）',
                  style: const TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (hex.guaCi.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '卦辞',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hex.guaCi,
                    style: const TextStyle(
                      color: Color(0xFFFFF8DC),
                      fontSize: 16,
                      height: 1.6,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hex.guaCiTranslation,
                    style: const TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (hex.daXiang.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '大象传',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hex.daXiang,
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildYaoCiSection() {
    // 获取变爻的爻辞
    final changingYaoIndices = <int>[];
    for (int i = 0; i < 6; i++) {
      if (analysis.yaoInfos[i].changing) {
        changingYaoIndices.add(i);
      }
    }

    if (changingYaoIndices.isEmpty) {
      return const SizedBox.shrink();
    }

    return CloudBorder(
      color: const Color(0x33C9372C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.change_circle,
                color: Color(0xFFC9372C),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                '变爻爻辞',
                style: TextStyle(
                  color: Color(0xFFC9372C),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...changingYaoIndices.map((index) {
            final yaoNames = ['初爻', '二爻', '三爻', '四爻', '五爻', '上爻'];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(8),
                border: const Border(
                  left: BorderSide(
                    color: Color(0xFFC9372C),
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x33C9372C),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      yaoNames[index],
                      style: const TextStyle(
                        color: Color(0xFFC9372C),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 获取对应位置的爻辞
                  Builder(
                    builder: (context) {
                      final yaoText = analysis.originalHexagram.yaoTexts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            yaoText.text,
                            style: const TextStyle(
                              color: Color(0xFFFFF8DC),
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            yaoText.translation,
                            style: const TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
