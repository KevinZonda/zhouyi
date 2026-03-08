import 'package:flutter/material.dart';
import '../models/types.dart';
import '../core/calendar.dart';

class ResultScreen extends StatelessWidget {
  final HexagramAnalysis analysis;

  const ResultScreen({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('????'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildHexagramDisplay(),
            SizedBox(height: 24),
            _buildAnalysisTable(),
            SizedBox(height: 24),
            _buildInterpretation(),
            SizedBox(height: 24),
            _buildGuaCiSection(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe94560).withOpacity(0.3), Color(0xFF0f3460).withOpacity(0.3)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text(
            analysis.question ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            analysis.method.displayName,
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            getDivinationTime().display,
            style: TextStyle(color: Colors.white38, fontSize: 12),
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
              '??',
              analysis.originalHexagram.fullName,
              analysis.originalHexagram.unicode,
              analysis.originalHexagram.binary,
              true,
            ),
            if (analysis.changedHexagram != null) ...[
              SizedBox(width: 20),
              Icon(Icons.arrow_forward, color: Colors.white54),
              SizedBox(width: 20),
              _buildSingleHexagram(
                '??',
                analysis.changedHexagram!.fullName,
                analysis.changedHexagram!.unicode,
                analysis.changedHexagram!.binary,
                false,
              ),
            ],
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '??: \${analysis.changingCount}?',
            style: TextStyle(color: Colors.white70),
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
        Text(label, style: TextStyle(color: Colors.white54, fontSize: 12)),
        SizedBox(height: 8),
        Text(
          unicode,
          style: TextStyle(fontSize: 48, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        SizedBox(height: 12),
        Column(
          children: List.generate(6, (i) {
            final pos = 5 - i;
            final isYang = binary[pos] == '1';
            final yaoInfo = analysis.yaoInfos[pos];
            final isChanging = showChanging && yaoInfo.changing;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2),
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
                        SizedBox(width: 10),
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
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Expanded(flex: 2, child: Text('??', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('??', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 2, child: Text('??', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('??', style: TextStyle(color: Colors.white54))),
                Expanded(flex: 3, child: Text('??', style: TextStyle(color: Colors.white54))),
              ],
            ),
          ),
          ...List.generate(6, (i) {
            final yao = analysis.yaoInfos[5 - i];
            final posNames = ['?', '?', '?', '?', '?', '?'];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white.withOpacity(0.05)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text(
                          '\${posNames[5 - i]}?',
                          style: TextStyle(color: Colors.white70),
                        ),
                        if (yao.isWorld)
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text('?', style: TextStyle(fontSize: 10, color: Colors.orange)),
                          ),
                        if (yao.isResponse)
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text('?', style: TextStyle(fontSize: 10, color: Colors.blue)),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '\${yao.tianGan.displayName}\${yao.diZhi.displayName}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      yao.element.displayName,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      yao.liuQin.displayName,
                      style: TextStyle(color: Colors.white70),
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFe94560).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '????',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            analysis.interpretationRule,
            style: TextStyle(color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildGuaCiSection() {
    final hex = analysis.originalHexagram;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\${hex.fullName}??\${hex.number}??',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          if (hex.guaCi.isNotEmpty) ...[
            Text(
              '??',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            SizedBox(height: 4),
            Text(
              hex.guaCi,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              hex.guaCiTranslation,
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
            SizedBox(height: 16),
          ],
          if (hex.daXiang.isNotEmpty) ...[
            Text(
              '???',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            SizedBox(height: 4),
            Text(
              hex.daXiang,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
