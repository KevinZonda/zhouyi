#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
验证 Flutter 版本与 Node.js 版本的卦辞数据一致性
"""

import re

def verify_data():
    print("=" * 70)
    print("验证山雷颐（第27卦）数据一致性")
    print("=" * 70)
    
    # 1. 检查 hexagrams_data.dart
    with open('lib/data/hexagrams_data.dart', 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 提取卦辞列表 - 第27个元素（索引26）
    guaci_pattern = r"_guaCiList = \[(.*?)\];"
    guaci_match = re.search(guaci_pattern, content, re.DOTALL)
    if guaci_match:
        guaci_items = [x.strip().strip("'\"") for x in guaci_match.group(1).split(',') if x.strip() and not x.strip().startswith('//')]
        print(f"\n1. 卦辞检查（hexagrams_data.dart）:")
        print(f"   第27卦卦辞 (索引26): {guaci_items[26] if len(guaci_items) > 26 else 'NOT FOUND'}")
    
    # 提取大象传列表
    daxiang_pattern = r"_daXiangList = \[(.*?)\];"
    daxiang_match = re.search(daxiang_pattern, content, re.DOTALL)
    if daxiang_match:
        daxiang_items = [x.strip().strip("'\"") for x in daxiang_match.group(1).split(',') if x.strip() and not x.strip().startswith('//')]
        print(f"\n2. 大象传检查（hexagrams_data.dart）:")
        print(f"   第27卦大象: {daxiang_items[26] if len(daxiang_items) > 26 else 'NOT FOUND'}")
    
    # 2. 检查 yao_texts.dart 中的爻辞
    with open('lib/data/yao_texts.dart', 'r', encoding='utf-8') as f:
        yao_content = f.read()
    
    print(f"\n3. 爻辞检查（yao_texts.dart）:")
    yao_pattern = r"// 27\. 颐\s*\[(.*?)\],\s*// 28"
    yao_match = re.search(yao_pattern, yao_content, re.DOTALL)
    if yao_match:
        yao_section = yao_match.group(1)
        yao_texts = re.findall(r"YaoText\(position: '([^']+)', text: '([^']+)', translation: '([^']+)'\)", yao_section)
        for pos, text, trans in yao_texts:
            print(f"   {pos}: {text}")
    else:
        print("   未找到第27卦爻辞")
    
    # 3. 对比 Node.js 版本
    print("\n" + "=" * 70)
    print("Node.js 版本数据（palace-xun.ts 第27卦）:")
    print("=" * 70)
    
    with open('../zhouyi_node/src/data/palace-xun.ts', 'r', encoding='utf-8') as f:
        node_content = f.read()
    
    # 提取颐卦数据
    yi_pattern = r"number: 27,\s*name: '颐',\s*fullName: '山雷颐'.*?yaoTexts: \[(.*?)\],"
    yi_match = re.search(yi_pattern, node_content, re.DOTALL)
    if yi_match:
        yao_texts_node = re.findall(r"\{ position: '([^']+)', text: '([^']+)', translation: '([^']+)' \}", yi_match.group(1))
        print(f"\n爻辞 ({len(yao_texts_node)}条):")
        for pos, text, trans in yao_texts_node:
            print(f"   {pos}: {text}")
    
    print("\n" + "=" * 70)
    print("对比结果:")
    print("=" * 70)
    
    # 比较爻辞
    if yao_match and yi_match:
        flutter_yaos = re.findall(r"YaoText\(position: '([^']+)', text: '([^']+)', translation: '([^']+)'\)", yao_match.group(1))
        node_yaos = re.findall(r"\{ position: '([^']+)', text: '([^']+)', translation: '([^']+)' \}", yi_match.group(1))
        
        match_count = 0
        for i, (f, n) in enumerate(zip(flutter_yaos, node_yaos)):
            if f[1] == n[1]:  # 比较 text
                match_count += 1
            else:
                print(f"   差异 @ {f[0]}:")
                print(f"     Flutter: {f[1]}")
                print(f"     Node.js: {n[1]}")
        
        print(f"\n✓ 爻辞匹配: {match_count}/{len(flutter_yaos)} 条")

if __name__ == '__main__':
    verify_data()
