import 'package:flutter/material.dart';
import '../models/types.dart';
import '../core/divination.dart';
import '../core/calendar.dart';
import '../core/analysis.dart';
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
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('起卦'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '您的问题',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _questionController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '请静心思考您所问之事...',
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildQuestionTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '问事类型',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: QuestionType.values.map((type) {
            final isSelected = _selectedType == type;
            return ChoiceChip(
              label: Text(type.displayName),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) setState(() => _selectedType = type);
              },
              selectedColor: const Color(0xFFe94560),
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '起卦方式',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...DivinationMethod.values.map((method) {
          final isSelected = _selectedMethod == method;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            color: isSelected 
                ? const Color(0xFFe94560).withValues(alpha: 0.2) 
                : Colors.white.withValues(alpha: 0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isSelected ? const Color(0xFFe94560) : Colors.transparent,
                width: 2,
              ),
            ),
            child: ListTile(
              title: Text(
                method.displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                method.description,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: Color(0xFFe94560))
                  : null,
              onTap: () => setState(() => _selectedMethod = method),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildNumberInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '输入数字',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _num1Controller,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '第一个数字',
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _num2Controller,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '第二个数字',
                  hintStyle: const TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _startDivination,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFe94560),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(
              '开始起卦',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
    );
  }

  void _startDivination() {
    if (_questionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入您的问题')),
      );
      return;
    }

    setState(() => _isLoading = true);

    Future.delayed(const Duration(milliseconds: 800), () {
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
