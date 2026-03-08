import 'package:flutter/material.dart';
import '../models/types.dart';
import '../core/divination.dart';
import '../core/calendar.dart';
import '../core/analysis.dart';
import '../widgets/tao_decorations.dart';
import '../utils/responsive.dart';
import 'result_screen.dart';

class DivinationScreen extends StatefulWidget {
  const DivinationScreen({super.key});

  @override
  State<DivinationScreen> createState() => _DivinationScreenState();
}

class _DivinationScreenState extends State<DivinationScreen> {
  final _questionController = TextEditingController();
  QuestionType _selectedType = QuestionType.other;
  DivinationMethod _selectedMethod = DivinationMethod.coin;
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _questionController.dispose();
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('起卦'),
      ),
      body: MysticBackground(
        child: SingleChildScrollView(
          padding: Responsive.horizontalPadding(context).copyWith(
            top: isMobile ? 16 : 20,
            bottom: isMobile ? 16 : 20,
          ),
          child: ConstrainedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderSection(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildQuestionSection(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildQuestionTypeSection(),
                SizedBox(height: isMobile ? 16 : 24),
                _buildMethodSection(),
                SizedBox(height: isMobile ? 16 : 24),
                if (_selectedMethod == DivinationMethod.meihuaNumber)
                  _buildNumberInputSection(),
                if (_selectedMethod == DivinationMethod.meihuaNumber)
                  SizedBox(height: isMobile ? 24 : 40),
                _buildStartButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    final isMobile = Responsive.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD4AF37).withValues(alpha: 0.1),
            const Color(0xFFC9372C).withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
        border: Border.all(
          color: const Color(0x33D4AF37),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 10 : 12),
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37).withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x33D4AF37),
              ),
            ),
            child: Icon(
              Icons.auto_fix_high,
              color: const Color(0xFFD4AF37),
              size: isMobile ? 24 : 28,
            ),
          ),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '诚心正意',
                  style: TextStyle(
                    color: const Color(0xFFD4AF37),
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Text(
                  '心诚则灵，静心思虑你所问之事',
                  style: TextStyle(
                    color: const Color(0xFF888888),
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection() {
    final isMobile = Responsive.isMobile(context);
    
    return CloudBorder(
      color: const Color(0xFFD4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_note,
                color: const Color(0xFFD4AF37),
                size: isMobile ? 18 : 20,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                '您的问题',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 10 : 12),
          TextField(
            controller: _questionController,
            style: TextStyle(
              color: const Color(0xFFFFF8DC),
              fontSize: isMobile ? 14 : 15,
            ),
            decoration: InputDecoration(
              hintText: '静心思考，将你所问之事写在心中...',
              hintStyle: TextStyle(
                color: const Color(0xFF666666),
                fontStyle: FontStyle.italic,
                fontSize: isMobile ? 13 : 14,
              ),
              filled: true,
              fillColor: const Color(0xFF1a1a1a),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                borderSide: const BorderSide(color: Color(0x33D4AF37)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                borderSide: const BorderSide(color: Color(0x33D4AF37)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                borderSide: const BorderSide(
                  color: Color(0xFFD4AF37),
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(isMobile ? 12 : 16),
            ),
            maxLines: isMobile ? 2 : 3,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionTypeSection() {
    final isMobile = Responsive.isMobile(context);
    
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.category,
                color: const Color(0xFFD4AF37),
                size: isMobile ? 18 : 20,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                '问事类型',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Wrap(
            spacing: isMobile ? 8 : 10,
            runSpacing: isMobile ? 8 : 10,
            children: QuestionType.values.map((type) {
              final isSelected = _selectedType == type;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedType = type);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 16,
                    vertical: isMobile ? 6 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFC9372C)
                        : const Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFC9372C)
                          : const Color(0x33D4AF37),
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: const Color(0xFFC9372C).withValues(alpha: 0.3),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    type.displayName,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFFFFF8DC)
                          : const Color(0xFFAAAAAA),
                      fontSize: isMobile ? 12 : 13,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodSection() {
    final isMobile = Responsive.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.settings,
              color: const Color(0xFFD4AF37),
              size: isMobile ? 18 : 20,
            ),
            SizedBox(width: isMobile ? 6 : 8),
            Text(
              '起卦方式',
              style: TextStyle(
                color: const Color(0xFFD4AF37),
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: isMobile ? 12 : 16),
        ...DivinationMethod.values.map((method) {
          final isSelected = _selectedMethod == method;
          return GestureDetector(
            onTap: () => setState(() => _selectedMethod = method),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: isMobile ? 10 : 12),
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isSelected
                      ? [
                          const Color(0xFFC9372C).withValues(alpha: 0.2),
                          const Color(0xFFC9372C).withValues(alpha: 0.05),
                        ]
                      : [
                          const Color(0xFF1a1a1a),
                          const Color(0xFF0D0D0D),
                        ],
                ),
                borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFC9372C)
                      : const Color(0x33D4AF37),
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFC9372C).withValues(alpha: 0.2),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: isMobile ? 20 : 24,
                    height: isMobile ? 20 : 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? const Color(0xFFC9372C)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFC9372C)
                            : const Color(0x33D4AF37),
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            size: isMobile ? 14 : 16,
                            color: const Color(0xFFFFF8DC),
                          )
                        : null,
                  ),
                  SizedBox(width: isMobile ? 12 : 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          method.displayName,
                          style: TextStyle(
                            color: const Color(0xFFFFF8DC),
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            fontSize: isMobile ? 14 : 15,
                          ),
                        ),
                        SizedBox(height: isMobile ? 2 : 4),
                        Text(
                          method.description,
                          style: TextStyle(
                            color: const Color(0xFF888888),
                            fontSize: isMobile ? 11 : 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.auto_fix_high,
                      color: const Color(0xFFD4AF37),
                      size: isMobile ? 18 : 20,
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildNumberInputSection() {
    final isMobile = Responsive.isMobile(context);
    
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.format_list_numbered,
                color: const Color(0xFFD4AF37),
                size: isMobile ? 18 : 20,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Text(
                '输入数字',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            '心中默想两数，以此起卦',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: isMobile ? 11 : 12,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  controller: _num1Controller,
                  hint: '第一数',
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Text(
                '与',
                style: TextStyle(
                  color: const Color(0xFFD4AF37),
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: _buildNumberField(
                  controller: _num2Controller,
                  hint: '第二数',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberField({
    required TextEditingController controller,
    required String hint,
  }) {
    final isMobile = Responsive.isMobile(context);
    
    return TextField(
      controller: controller,
      style: TextStyle(
        color: const Color(0xFFFFF8DC),
        fontSize: isMobile ? 14 : 16,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF666666)),
        filled: true,
        fillColor: const Color(0xFF1a1a1a),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          borderSide: const BorderSide(color: Color(0x33D4AF37)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          borderSide: const BorderSide(color: Color(0x33D4AF37)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          borderSide: const BorderSide(
            color: Color(0xFFD4AF37),
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: isMobile ? 10 : 12),
      ),
    );
  }

  Widget _buildStartButton() {
    final isMobile = Responsive.isMobile(context);
    
    return Center(
      child: _isLoading
          ? Column(
              children: [
                TianJiIndicator(size: isMobile ? 60 : 80),
                const SizedBox(height: 16),
                Text(
                  '天机运转中...',
                  style: TextStyle(
                    color: const Color(0xFFD4AF37).withValues(alpha: 0.8),
                    fontSize: isMobile ? 12 : 14,
                    letterSpacing: 2,
                  ),
                ),
              ],
            )
          : RuneButton(
              text: '开始起卦',
              icon: Icons.wb_incandescent,
              onPressed: _startDivination,
            ),
    );
  }

  void _startDivination() {
    if (_questionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '请输入您的问题',
            style: TextStyle(color: Color(0xFFFFF8DC)),
          ),
          backgroundColor: Color(0xFFC9372C),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    Future.delayed(const Duration(milliseconds: 1500), () {
      late DivinationResult result;
      switch (_selectedMethod) {
        case DivinationMethod.dayan:
          result = dayanMethod();
          break;
        case DivinationMethod.meihuaNumber:
          final n1 = int.tryParse(_num1Controller.text) ?? 1;
          final n2 = int.tryParse(_num2Controller.text) ?? 1;
          result = meihuaNumberMethod(n1, n2);
          break;
        default:
          result = coinMethod();
      }

      final timeInfo = getDivinationTime();
      final preYinYangs = result.yaoValues.map(yaoToYinYang).toList();
      final preHexInfo = identifyHexagram(preYinYangs);
      final analysis = analyzeHexagram(
        result: result,
        dayGan: timeInfo.dayGan,
        dayZhi: timeInfo.dayZhi,
        monthZhi: timeInfo.monthZhi,
        worldLine: 6,
        responseLine: 3,
        questionType: _selectedType,
        question: _questionController.text,
        palace: preHexInfo.upper,
      );

      setState(() => _isLoading = false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(analysis: analysis),
        ),
      );
    });
  }
}
