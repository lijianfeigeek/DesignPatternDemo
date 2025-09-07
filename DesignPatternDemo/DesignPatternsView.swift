//
//  DesignPatternsView.swift
//  DesignPatternDemo
//
//  Created by LIJIANFEI on 7/9/25.
//

import SwiftUI

struct DesignPatternsView: View {
    private let patterns = DesignPattern.allCases
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(PatternType.allCases, id: \.self) { type in
                    Section(header: Text(type.rawValue)) {
                        ForEach(patterns.filter { $0.type == type }) { pattern in
                            NavigationLink(destination: PatternDetailView(pattern: pattern)) {
                                PatternRow(pattern: pattern)
                            }
                        }
                    }
                }
            }
            .navigationTitle("设计模式")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct PatternRow: View {
    let pattern: DesignPattern
    @State private var isHovered = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(pattern.rawValue)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: typeIcon)
                                .font(.caption)
                                .foregroundColor(typeColor)
                            Text(pattern.type.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(typeColor.opacity(0.15))
                                .foregroundColor(typeColor)
                                .cornerRadius(12)
                        }
                    }
                    
                    Text(pattern.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .lineSpacing(1)
                        .padding(.leading, 4)
                }
            }
        }
        .padding(16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    typeColor.opacity(0.05),
                    Color.white.opacity(0.9)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(typeColor.opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(12)
        .shadow(
            color: typeColor.opacity(isHovered ? 0.3 : 0.1),
            radius: isHovered ? 8 : 4,
            x: 0,
            y: isHovered ? 2 : 1
        )
        .scaleEffect(isHovered ? 1.02 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isHovered)
        .onHover { hovering in
            isHovered = hovering
        }
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
    
    private var typeIcon: String {
        switch pattern.type {
        case .creational:
            return "hammer.fill"
        case .structural:
            return "building.columns"
        case .behavioral:
            return "brain.head.profile"
        }
    }
}

#Preview {
    DesignPatternsView()
}
