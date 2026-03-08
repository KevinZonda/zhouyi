import 'package:flutter/material.dart';
import '../models/types.dart';
import '../core/divination.dart';
import '../core/calendar.dart';
import '../core/analysis.dart';
import '../widgets/tao_decorations.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: const Text('起卦'),
      ),
      body: MysticBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 24),
              _buildQuestionSection(),
              const SizedBox(height: 24),
              _buildQuestionTypeSection(),
              const SizedBox(height: 24),
              _buildMethodSection(),
              const SizedBox(height: 24),
              if (_selectedMethod == DivinationMethod.meihuaNumber)
                _buildNumberInputSection(),
              const SizedBox(height: 40),
              _buildStartButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD4AF37).withValues(alpha: 0.1),
            const Color(0xFFC9372C).withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0x33D4AF37),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37).withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x33D4AF37),
              ),
            ),
            child: const Icon(
              Icons.auto_fix_high,
              color: Color(0xFFD4AF37),
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '诚心正意',
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '心诚则灵，静心思虑你所问之事',
                  style: TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 12,
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
    return CloudBorder(
      color: const Color(0xFFD4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.edit_note,
                color: Color(0xFFD4AF37),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                '您的问题',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _questionController,
            style: const TextStyle(
              color: Color(0xFFFFF8DC),
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintText: '静心思考，将你所问之事写在心中...',
              hintStyle: TextStyle(
                color: const Color(0xFF666666),
                fontStyle: FontStyle.italic,
              ),
              filled: true,
              fillColor: const Color(0xFF1a1a1a),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0x33D4AF37)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0x33D4AF37)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFD4AF37),
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionTypeSection() {
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.category,
                color: Color(0xFFD4AF37),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                '问事类型',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: QuestionType.values.map((type) {
              final isSelected = _selectedType == type;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedType = type);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
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
                      fontSize: 13,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.settings,
              color: Color(0xFFD4AF37),
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              '起卦方式',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...DivinationMethod.values.map((method) {
          final isSelected = _selectedMethod == method;
          return GestureDetector(
            onTap: () => setState(() => _selectedMethod = method),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
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
                borderRadius: BorderRadius.circular(12),
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
                    width: 24,
                    height: 24,
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
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Color(0xFFFFF8DC),
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
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
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          method.description,
                          style: const TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.auto_fix_high,
                      color: Color(0xFFD4AF37),
                      size: 20,
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
    return CloudBorder(
      color: const Color(0x33D4AF37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.format_list_numbered,
                color: Color(0xFFD4AF37),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                '输入数字',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            '心中默想两数，以此起卦',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  controller: _num1Controller,
                  hint: '第一数',
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                '与',
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 16),
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
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Color(0xFFFFF8DC),
        fontSize: 16,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF666666)),
        filled: true,
        fillColor: const Color(0xFF1a1a1a),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0x33D4AF37)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0x33D4AF37)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD4AF37),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildStartButton() {
    return Center(
      child: _isLoading
          ? Column(
              children: [
                const TianJiIndicator(size: 80),
                const SizedBox(height: 16),
                Text(
                  '天机运转中...',
                  style: TextStyle(
                    color: const Color(0xFFD4AF37).withValues(alpha: 0.8),
                    fontSize: 14,
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
