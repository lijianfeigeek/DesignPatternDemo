//
//  DataStructureDetailView.swift
//  DesignPatternDemo
//
//  Created by Claude on 2025-01-01.
//

import SwiftUI
import UIKit

struct DataStructureDetailView: View {
    let dataStructure: DataStructure
    @State private var isCodeExpanded = false
    @State private var isIOSUsageExpanded = false
    @State private var isCopied = false
    @State private var isDescriptionHovered = false
    @State private var isCodeHovered = false
    @State private var isComplexityHovered = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // 标题和类型
                VStack(alignment: .leading, spacing: 12) {
                    Text(dataStructure.rawValue)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text(dataStructure.type.rawValue)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(typeColor.opacity(0.15))
                            .foregroundColor(typeColor)
                            .cornerRadius(20)
                        
                        Spacer()
                        
                        Button(action: {
                            copyCodeToClipboard()
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: isCopied ? "checkmark" : "doc.on.doc")
                                    .font(.caption)
                                Text(isCopied ? "已复制" : "复制代码")
                                    .font(.caption)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(isCopied ? Color.green : Color.blue)
                            .cornerRadius(8)
                        }
                        .animation(.easeInOut(duration: 0.3), value: isCopied)
                    }
                }
                
                // 描述卡片 - 增强版
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(typeColor)
                            .font(.title2)
                            .scaleEffect(isDescriptionHovered ? 1.1 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isDescriptionHovered)
                        Text("描述")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                    }
                    
                    DataStructureMarkdownText(dataStructure.description)
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            typeColor.opacity(0.1),
                            typeColor.opacity(0.05),
                            Color.white.opacity(0.9)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(typeColor.opacity(0.3), lineWidth: 1)
                )
                .cornerRadius(16)
                .shadow(
                    color: typeColor.opacity(0.2),
                    radius: isDescriptionHovered ? 12 : 8,
                    x: 0,
                    y: isDescriptionHovered ? 4 : 2
                )
                .scaleEffect(isDescriptionHovered ? 1.02 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isDescriptionHovered)
                .onHover { hovering in
                    isDescriptionHovered = hovering
                }
                
                // 复杂度分析卡片
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        HStack(spacing: 12) {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .font(.title2)
                                .foregroundColor(.indigo)
                                .scaleEffect(isComplexityHovered ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isComplexityHovered)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("复杂度分析")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                Text("时间复杂度和空间复杂度")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("时间复杂度")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                            Spacer()
                            Text(dataStructure.timeComplexity)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("空间复杂度")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                            Spacer()
                            Text(dataStructure.spaceComplexity)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.05))
                    )
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.indigo.opacity(0.08),
                            Color.indigo.opacity(0.03)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.indigo.opacity(0.2), lineWidth: 1)
                )
                .cornerRadius(16)
                .shadow(color: Color.indigo.opacity(0.1), radius: 8, x: 0, y: 2)
                .scaleEffect(isComplexityHovered ? 1.02 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isComplexityHovered)
                .onHover { hovering in
                    isComplexityHovered = hovering
                }
                
                // iOS使用场景卡片
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        HStack(spacing: 12) {
                            Image(systemName: "iosapp")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .symbolEffect(.bounce, value: isIOSUsageExpanded)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("iOS开发场景")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                Text("实际应用案例与最佳实践")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                isIOSUsageExpanded.toggle()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Text(isIOSUsageExpanded ? "收起" : "展开")
                                Image(systemName: isIOSUsageExpanded ? "chevron.up" : "chevron.down")
                                    .font(.caption)
                                    .rotationEffect(.degrees(isIOSUsageExpanded ? 180 : 0))
                            }
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(6)
                        }
                        .buttonStyle(DataStructureScaleButtonStyle())
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            DataStructureMarkdownText(dataStructure.iOSUsage, lineSpacing: 3)
                        }
                        .padding(.top, 8)
                    }
                    .frame(maxHeight: isIOSUsageExpanded ? nil : 250)
                    .clipped()
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.blue.opacity(0.08),
                            Color.blue.opacity(0.03)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                )
                .cornerRadius(16)
                .shadow(color: Color.blue.opacity(0.1), radius: 8, x: 0, y: 2)
                
                // 代码示例卡片 - 增强版
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        HStack {
                            Image(systemName: "curlybraces")
                                .foregroundColor(.purple)
                                .font(.title2)
                                .scaleEffect(isCodeHovered ? 1.1 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isCodeHovered)
                            Text("代码示例")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isCodeExpanded.toggle()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Text(isCodeExpanded ? "收起" : "展开")
                                Image(systemName: isCodeExpanded ? "chevron.up" : "chevron.down")
                                    .font(.caption)
                                    .rotationEffect(.degrees(isCodeExpanded ? 180 : 0))
                            }
                            .font(.caption)
                            .foregroundColor(.purple)
                        }
                        .buttonStyle(DataStructureScaleButtonStyle())
                    }
                    
                    ScrollView {
                        Text(dataStructure.codeExample)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.primary)
                            .lineSpacing(1)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.gray.opacity(0.05))
                            )
                    }
                    .frame(maxHeight: isCodeExpanded ? nil : 300)
                    .clipped()
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.purple.opacity(0.08),
                            Color.purple.opacity(0.03),
                            Color.white.opacity(0.9)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.purple.opacity(0.3), lineWidth: 1)
                )
                .cornerRadius(16)
                .shadow(
                    color: Color.purple.opacity(0.2),
                    radius: isCodeHovered ? 12 : 8,
                    x: 0,
                    y: isCodeHovered ? 4 : 2
                )
                .scaleEffect(isCodeHovered ? 1.02 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isCodeHovered)
                .onHover { hovering in
                    isCodeHovered = hovering
                }
                
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
        .navigationTitle(dataStructure.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var typeColor: Color {
        switch dataStructure.type {
        case .linear:
            return .purple
        case .tree:
            return .green
        case .graph:
            return .orange
        case .hash:
            return .blue
        case .other:
            return .red
        }
    }
    
    private func copyCodeToClipboard() {
        UIPasteboard.general.string = dataStructure.codeExample
        isCopied = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isCopied = false
        }
    }
}

// 自定义按钮样式
struct DataStructureScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.8), value: configuration.isPressed)
    }
}

// 增强版Markdown文本渲染组件
struct DataStructureMarkdownText: View {
    let markdown: String
    let font: Font
    let foregroundColor: Color
    let lineSpacing: CGFloat
    
    init(_ markdown: String, font: Font = .body, foregroundColor: Color = .primary, lineSpacing: CGFloat = 2) {
        self.markdown = markdown
        self.font = font
        self.foregroundColor = foregroundColor
        self.lineSpacing = lineSpacing
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: lineSpacing) {
            ForEach(parseMarkdownBlocks(), id: \.id) { block in
                DataStructureMarkdownBlockView(block: block, font: font, foregroundColor: foregroundColor)
            }
        }
    }
    
    private func parseMarkdownBlocks() -> [DataStructureMarkdownBlock] {
        var blocks: [DataStructureMarkdownBlock] = []
        let lines = markdown.components(separatedBy: .newlines)
        var currentBlock = ""
        var inCodeBlock = false
        
        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if trimmedLine.hasPrefix("```") {
                if inCodeBlock {
                    // 结束代码块
                    currentBlock += line
                    blocks.append(DataStructureMarkdownBlock(id: UUID().uuidString, content: currentBlock))
                    currentBlock = ""
                    inCodeBlock = false
                } else {
                    // 开始代码块
                    if !currentBlock.isEmpty {
                        blocks.append(DataStructureMarkdownBlock(id: UUID().uuidString, content: currentBlock))
                    }
                    currentBlock = line
                    inCodeBlock = true
                }
            } else if inCodeBlock {
                // 代码块内的行
                currentBlock += "\n" + line
            } else if trimmedLine.isEmpty {
                // 空行
                if !currentBlock.isEmpty {
                    blocks.append(DataStructureMarkdownBlock(id: UUID().uuidString, content: currentBlock))
                    currentBlock = ""
                }
            } else {
                // 普通行
                if !currentBlock.isEmpty {
                    currentBlock += "\n" + line
                } else {
                    currentBlock = line
                }
            }
        }
        
        // 添加最后一个块
        if !currentBlock.isEmpty {
            blocks.append(DataStructureMarkdownBlock(id: UUID().uuidString, content: currentBlock))
        }
        
        return blocks
    }
}

struct DataStructureMarkdownBlock: Identifiable {
    let id: String
    let content: String
}

struct DataStructureMarkdownBlockView: View {
    let block: DataStructureMarkdownBlock
    let font: Font
    let foregroundColor: Color
    
    var body: some View {
        Group {
            if block.content.hasPrefix("```") {
                // 代码块
                DataStructureCodeBlockView(code: extractCodeBlock(block.content))
            } else if block.content.hasPrefix("#") {
                // 标题
                DataStructureHeaderView(text: extractHeaderText(block.content), level: extractHeaderLevel(block.content))
            } else if block.content.trimmingCharacters(in: .whitespaces).hasPrefix("•") || block.content.trimmingCharacters(in: .whitespaces).hasPrefix("-") {
                // 项目符号
                DataStructureBulletPointView(text: extractBulletText(block.content))
            } else if block.content.contains("|") && block.content.trimmingCharacters(in: .whitespaces).hasPrefix("|") {
                // 表格
                DataStructureTableView(markdown: block.content)
            } else if block.content.trimmingCharacters(in: .whitespaces).isEmpty {
                // 空行
                EmptyView()
            } else {
                // 普通段落
                DataStructureParagraphView(text: block.content, font: font, foregroundColor: foregroundColor)
            }
        }
    }
    
    private func extractCodeBlock(_ content: String) -> String {
        let lines = content.components(separatedBy: .newlines)
        if lines.count > 1 {
            return lines.dropFirst().dropLast().joined(separator: "\n")
        }
        return content.replacingOccurrences(of: "```", with: "")
    }
    
    private func extractHeaderText(_ content: String) -> String {
        return content.trimmingPrefix { $0 == "#" }.trimmingCharacters(in: .whitespaces)
    }
    
    private func extractHeaderLevel(_ content: String) -> Int {
        let level = content.prefix { $0 == "#" }.count
        return min(level, 6)
    }
    
    private func extractBulletText(_ content: String) -> String {
        let trimmed = content.trimmingCharacters(in: .whitespaces)
        if trimmed.hasPrefix("-") || trimmed.hasPrefix("•") {
            return trimmed.dropFirst().trimmingCharacters(in: .whitespaces)
        }
        return trimmed
    }
}

struct DataStructureParagraphView: View {
    let text: String
    let font: Font
    let foregroundColor: Color
    
    var body: some View {
        Group {
            if let attributedString = try? AttributedString(
                markdown: text,
                options: AttributedString.MarkdownParsingOptions(
                    allowsExtendedAttributes: true,
                    interpretedSyntax: .full
                )
            ) {
                Text(attributedString)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .lineSpacing(2)
            } else {
                // 降级到普通文本
                Text(text)
                    .font(font)
                    .foregroundColor(foregroundColor)
                    .lineSpacing(2)
            }
        }
    }
}

struct DataStructureCodeBlockView: View {
    let code: String
    @State private var isCopied = false
    @State private var language: String = "swift"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "curlybraces")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("代码")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                
                if !language.isEmpty {
                    Text(language.uppercased())
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(4)
                }
                
                Spacer()
                
                Button(action: copyCode) {
                    HStack(spacing: 4) {
                        Image(systemName: isCopied ? "checkmark" : "doc.on.doc")
                            .font(.caption)
                        Text(isCopied ? "已复制" : "复制")
                            .font(.caption)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(isCopied ? Color.green : Color.blue)
                    .cornerRadius(6)
                }
                .buttonStyle(DataStructureScaleButtonStyle())
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(Array(highlightedCode.enumerated()), id: \.offset) { index, line in
                        HStack(alignment: .top, spacing: 0) {
                            // 行号
                            Text("\(index + 1)")
                                .font(.system(.caption, design: .monospaced))
                                .foregroundColor(.secondary)
                                .frame(width: 30, alignment: .trailing)
                                .padding(.trailing, 8)
                            
                            // 代码内容
                            Text(line)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                        }
                        .padding(.vertical, 1)
                    }
                }
                .padding(12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.05))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
    
    private var highlightedCode: [AttributedString] {
        let lines = code.components(separatedBy: .newlines)
        return lines.map { line in
            highlightSyntax(line)
        }
    }
    
    private func highlightSyntax(_ line: String) -> AttributedString {
        var attributedString = AttributedString(line)
        
        // Swift 关键字高亮
        let swiftKeywords = [
            "class", "struct", "enum", "protocol", "extension", "func", "var", "let", "const",
            "if", "else", "for", "while", "repeat", "switch", "case", "default", "break",
            "continue", "return", "throw", "try", "catch", "guard", "defer", "in",
            "private", "fileprivate", "internal", "public", "open", "static", "final",
            "import", "typealias", "associatedtype", "precedencegroup", "operator",
            "subscript", "init", "deinit", "get", "set", "willSet", "didSet", "inout",
            "override", "required", "convenience", "lazy", "weak", "unowned", "strong"
        ]
        
        // 数据类型高亮
        let dataTypes = [
            "String", "Int", "Double", "Float", "Bool", "Array", "Dictionary", "Set",
            "Optional", "URL", "Data", "Date", "UUID", "CGFloat", "CGPoint", "CGSize",
            "CGRect", "UIView", "UIViewController", "UIColor", "UIFont", "UIImage",
            "UILabel", "UIButton", "UITableView", "UICollectionView", "UIScrollView"
        ]
        
        // 高亮关键字
        for keyword in swiftKeywords {
            let pattern = "\\b\(keyword)\\b"
            if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
                let matches = regex.matches(in: line, options: [], range: NSRange(line.startIndex..., in: line))
                for match in matches.reversed() {
                    if let range = Range(match.range, in: attributedString) {
                        attributedString[range].foregroundColor = .purple
                        attributedString[range].font = .systemFont(ofSize: 16, weight: .semibold)
                    }
                }
            }
        }
        
        // 高亮数据类型
        for dataType in dataTypes {
            let pattern = "\\b\(dataType)\\b"
            if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
                let matches = regex.matches(in: line, options: [], range: NSRange(line.startIndex..., in: line))
                for match in matches.reversed() {
                    if let range = Range(match.range, in: attributedString) {
                        attributedString[range].foregroundColor = .blue
                    }
                }
            }
        }
        
        // 高亮字符串
        let stringPattern = "\"[^\"]*\""
        if let regex = try? NSRegularExpression(pattern: stringPattern, options: []) {
            let matches = regex.matches(in: line, options: [], range: NSRange(line.startIndex..., in: line))
            for match in matches.reversed() {
                if let range = Range(match.range, in: attributedString) {
                    attributedString[range].foregroundColor = .green
                }
            }
        }
        
        // 高亮数字
        let numberPattern = "\\b\\d+\\.?\\d*\\b"
        if let regex = try? NSRegularExpression(pattern: numberPattern, options: []) {
            let matches = regex.matches(in: line, options: [], range: NSRange(line.startIndex..., in: line))
            for match in matches.reversed() {
                if let range = Range(match.range, in: attributedString) {
                    attributedString[range].foregroundColor = .orange
                }
            }
        }
        
        // 高亮注释
        let commentPattern = "//.*"
        if let regex = try? NSRegularExpression(pattern: commentPattern, options: []) {
            let matches = regex.matches(in: line, options: [], range: NSRange(line.startIndex..., in: line))
            for match in matches.reversed() {
                if let range = Range(match.range, in: attributedString) {
                    attributedString[range].foregroundColor = .secondary
                    attributedString[range].font = .monospacedSystemFont(ofSize: 16, weight: .regular)
                    attributedString[range].inlinePresentationIntent = .emphasized
                }
            }
        }
        
        return attributedString
    }
    
    private func copyCode() {
        UIPasteboard.general.string = code
        isCopied = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isCopied = false
        }
    }
}

struct DataStructureHeaderView: View {
    let text: String
    let level: Int
    
    var body: some View {
        let font: Font = {
            switch level {
            case 1: return .largeTitle
            case 2: return .title
            case 3: return .title2
            case 4: return .title3
            case 5: return .headline
            case 6: return .subheadline
            default: return .body
            }
        }()
        
        Text(text)
            .font(font)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.vertical, 4)
    }
}

struct DataStructureBulletPointView: View {
    let text: String
    
    var body: some View {
        if let attributedString = try? AttributedString(
            markdown: text,
            options: AttributedString.MarkdownParsingOptions(
                allowsExtendedAttributes: true,
                interpretedSyntax: .full
            )
        ) {
            HStack(alignment: .top, spacing: 8) {
                Text("•")
                    .font(.body)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                
                Text(attributedString)
                    .lineSpacing(2)
                
                Spacer()
            }
        } else {
            HStack(alignment: .top, spacing: 8) {
                Text("•")
                    .font(.body)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
                
                Text(text)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineSpacing(2)
                
                Spacer()
            }
        }
    }
}

struct DataStructureTableView: View {
    let markdown: String
    
    var body: some View {
        let rows = parseTableRows(markdown)
        
        VStack(spacing: 0) {
            ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                HStack(spacing: 0) {
                    ForEach(Array(row.enumerated()), id: \.offset) { cellIndex, cell in
                        Text(cell)
                            .font(index == 0 ? .headline : .body)
                            .fontWeight(index == 0 ? .semibold : .regular)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .background(
                                Rectangle()
                                    .fill(Color.gray.opacity(0.05))
                            )
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                }
                
                if index < rows.count - 1 {
                    Divider()
                        .background(Color.gray.opacity(0.3))
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.02))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    private func parseTableRows(_ markdown: String) -> [[String]] {
        let lines = markdown.components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty && !$0.hasPrefix("|-") }
        
        return lines.map { line in
            let cells = line.components(separatedBy: "|")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }
            return cells
        }
    }
}

#Preview {
    NavigationStack {
        DataStructureDetailView(dataStructure: .array)
    }
}