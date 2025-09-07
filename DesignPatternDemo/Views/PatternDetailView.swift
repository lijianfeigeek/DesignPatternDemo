import SwiftUI
import UIKit

struct PatternDetailView: View {
    let pattern: DesignPattern
    @State private var isCodeExpanded = false
    @State private var isIOSUsageExpanded = false
    @State private var isCopied = false
    @State private var isDescriptionHovered = false
    @State private var isCodeHovered = false
    
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
                    
                    Text(pattern.description)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(2)
                        .padding(.leading, 4)
                }
                .padding(20)
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
                        .buttonStyle(ScaleButtonStyle())
                    }
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(pattern.iOSUsage)
                                .font(.body)
                                .foregroundColor(.primary)
                                .lineSpacing(3)
                        }
                        .padding(.top, 8)
                    }
                    .frame(maxHeight: isIOSUsageExpanded ? nil : 250)
                    .clipped()
                }
                .padding(20)
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
                        .buttonStyle(ScaleButtonStyle())
                    }
                    
                    ScrollView {
                        Text(pattern.codeExample)
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

// 自定义按钮样式
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.8), value: configuration.isPressed)
    }
}

#Preview {
    NavigationStack {
        PatternDetailView(pattern: .singleton)
    }
}