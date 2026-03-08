import 'package:flutter/material.dart';
import '../models/types.dart';
import '../widgets/tao_decorations.dart';
import '../utils/responsive.dart';

class ResultScreen extends StatelessWidget {
  final HexagramAnalysis analysis;

  const ResultScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('卦象解析'),
      ),
      body: MysticBackground(
        child: SingleChildScrollView(
          padding: Responsive.horizontalPadding(context).copyWith(
            top: isMobile ? 12 : 16,
            bottom: isMobile ? 20 : 40,
          ),
          child: ConstrainedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(isMobile: isMobile),
                SizedBox(height: isMobile ? 16 : 24),
                _buildHexagramDisplay(isMobile: isMobile, isTablet: isTablet),
                SizedBox(height: isMobile ? 16 : 24),
                _buildAnalysisTable(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildInterpretation(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildGuaCiSection(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildYaoCiSection(),
                SizedBox(height: isMobile ? 20 : 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({required bool isMobile}) {
    return CloudBorder(
      color: const Color(0xFFD4AF37),
      child: Column(
        children: [
          // 问题
          Text(
            analysis.question ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFFF8DC),
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              letterSpacing: isMobile ? 1 : 2,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Container(
            width: 60,
            height: 1,
            color: const Color(0x33D4AF37),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          // 起卦方式
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_fix_high,
                color: const Color(0xFFD4AF37),
                size: isMobile ? 14 : 16,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                analysis.method.displayName,
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: isMobile ? 13 : 14,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 8),
          // 时间
          Text(
            '${analysis.dayGan.displayName}${analysis.dayZhi.displayName}日 ${analysis.monthZhi.displayName}月',
            style: TextStyle(
              color: const Color(0xFF888888),
              fontSize: isMobile ? 11 : 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHexagramDisplay({required bool isMobile, required bool isTablet}) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFD4AF37).withValues(alpha: 0.1),
            const Color(0xFF1a1a1a),
          ],
        ),
        borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
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
                isMobile: isMobile,
              ),
              if (analysis.changedHexagram != null) ...[
                SizedBox(width: isMobile ? 12 : (isTablet ? 18 : 24)),
                Column(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: const Color(0xFFD4AF37),
                      size: isMobile ? 20 : 28,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${analysis.changingCount}变',
                      style: TextStyle(
                        color: const Color(0xFFC9372C),
                        fontSize: isMobile ? 10 : 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: isMobile ? 12 : (isTablet ? 18 : 24)),
                _buildSingleHexagram(
                  '之卦',
                  analysis.changedHexagram!.fullName,
                  analysis.changedHexagram!.unicode,
                  analysis.changedHexagram!.binary,
                  false,
                  isMobile: isMobile,
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
    bool showChanging, {
    required bool isMobile,
  }) {
    final yaoWidth = isMobile ? 36.0 : 50.0;
    
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 12, 
            vertical: isMobile ? 2 : 4,
          ),
          decoration: BoxDecoration(
            color: const Color(0x33D4AF37),
            borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFFD4AF37),
              fontSize: isMobile ? 10 : 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 8 : 12),
        Text(
          unicode,
          style: TextStyle(
            fontSize: isMobile ? 36 : 56,
            color: const Color(0xFFFFF8DC),
            shadows: const [
              Shadow(
                color: Color(0xFFD4AF37),
                blurRadius: 20,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 4 : 8),
        Text(
          name,
          style: TextStyle(
            color: const Color(0xFFD4AF37),
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 13 : 16,
            letterSpacing: isMobile ? 1 : 2,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 16),
        Column(
          children: List.generate(6, (i) {
            final pos = 5 - i;
            final isYang = binary[pos] == '1';
            final yaoInfo = analysis.yaoInfos[pos];
            final isChanging = showChanging && yaoInfo.changing;
            return Container(
              margin: EdgeInsets.symmetric(vertical: isMobile ? 2 : 3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isChanging)
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x33C9372C),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '变',
                        style: TextStyle(
                          color: const Color(0xFFC9372C),
                          fontSize: isMobile ? 9 : 10,
                        ),
                      ),
                    ),
                  YaoLine(
                    isYang: isYang,
                    isChanging: isChanging,
                    width: yaoWidth,
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
    // 获取应参考的文本指引
    final relevantTexts = _getRelevantTextGuide();
    
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
          // 断卦规则
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 规则说明
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0x33C9372C),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '断卦规则',
                        style: TextStyle(
                          color: Color(0xFFC9372C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        analysis.interpretationRule,
                        style: const TextStyle(
                          color: Color(0xFFFFF8DC),
                          height: 1.6,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(color: Color(0x33C9372C)),
                const SizedBox(height: 12),
                // 应参考内容
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0x33D4AF37),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '应参考',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: relevantTexts.map((text) {
                          final isMain = text.contains('为主') || text.contains('乾坤看用');
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isMain 
                                  ? const Color(0x33D4AF37) 
                                  : const Color(0xFF1a1a1a),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isMain 
                                    ? const Color(0xFFD4AF37) 
                                    : const Color(0x33D4AF37),
                              ),
                            ),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: isMain 
                                    ? const Color(0xFFD4AF37) 
                                    : const Color(0xFFAAAAAA),
                                fontSize: 13,
                                fontWeight: isMain ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                // 变爻数显示
                if (analysis.changingCount > 0) ...[
                  const SizedBox(height: 12),
                  const Divider(color: Color(0x33C9372C)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC9372C).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '变爻数: ${analysis.changingCount}',
                          style: const TextStyle(
                            color: Color(0xFFC9372C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '位置: ${_getChangingLinesText()}',
                        style: const TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 获取应参考的文本指引（对应 Node.js 的 getRelevantTextGuide）
  List<String> _getRelevantTextGuide() {
    final changingCount = analysis.changingCount;
    final changingLines = analysis.changingLines;
    
    switch (changingCount) {
      case 0:
        return ['本卦卦辞'];
      case 1:
        return ['本卦第${changingLines[0]}爻爻辞'];
      case 2:
        return [
          '本卦第${changingLines[0]}爻爻辞',
          '本卦第${changingLines[1]}爻爻辞',
          '(以上爻为主)',
        ];
      case 3:
        return ['本卦卦辞', '之卦卦辞', '(以本卦为主)'];
      case 4:
        final allLines = [1, 2, 3, 4, 5, 6];
        final unchanging = allLines.where((l) => !changingLines.contains(l)).toList();
        return [
          ...unchanging.map((l) => '之卦第$l爻爻辞'),
          '(以下爻为主)',
        ];
      case 5:
        final allLines = [1, 2, 3, 4, 5, 6];
        final unchanging = allLines.where((l) => !changingLines.contains(l)).toList();
        return ['之卦第${unchanging[0]}爻爻辞'];
      case 6:
        return ['乾坤看用九/用六', '其他卦看之卦卦辞'];
      default:
        return [];
    }
  }

  /// 获取变爻位置文字
  String _getChangingLinesText() {
    if (analysis.changingLines.isEmpty) return '无';
    final posNames = ['初', '二', '三', '四', '五', '上'];
    return analysis.changingLines.map((l) => '${posNames[l - 1]}爻').join('、');
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
