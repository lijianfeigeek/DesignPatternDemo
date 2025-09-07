import SwiftUI
import UIKit

struct PatternDetailView: View {
    let pattern: DesignPattern
    @State private var isCodeExpanded = false
    @State private var isCopied = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // 标题和类型
                VStack(alignment: .leading, spacing: 12) {
                    Text(pattern.rawValue)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text(pattern.type.rawValue)
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
                
                // 描述卡片
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.secondary)
                        Text("描述")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text(pattern.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(2)
                }
                .padding(16)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(12)
                
                // 代码示例卡片
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        HStack {
                            Image(systemName: "curlybraces")
                                .foregroundColor(.secondary)
                            Text("代码示例")
                                .font(.headline)
                                .foregroundColor(.secondary)
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
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                    }
                    
                    ScrollView {
                        Text(pattern.codeExample)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.primary)
                            .lineSpacing(1)
                    }
                    .frame(maxHeight: isCodeExpanded ? nil : 300)
                    .clipped()
                }
                .padding(16)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(12)
                
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
        .navigationTitle(pattern.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var typeColor: Color {
        switch pattern.type {
        case .creational:
            return .orange
        case .structural:
            return .blue
        case .behavioral:
            return .green
        }
    }
    
    private func copyCodeToClipboard() {
        UIPasteboard.general.string = pattern.codeExample
        isCopied = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isCopied = false
        }
    }
}

#Preview {
    NavigationStack {
        PatternDetailView(pattern: .singleton)
    }
}