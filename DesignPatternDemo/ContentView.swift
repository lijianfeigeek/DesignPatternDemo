//
//  ContentView.swift
//  DesignPatternDemo
//
//  Created by LIJIANFEI on 7/9/25.
//

import SwiftUI

struct ContentView: View {
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(pattern.rawValue)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(pattern.type.rawValue)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(typeColor.opacity(0.15))
                    .foregroundColor(typeColor)
                    .cornerRadius(12)
            }
            
            Text(pattern.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .lineSpacing(1)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(Color.gray.opacity(0.03))
        .cornerRadius(8)
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
}

#Preview {
    ContentView()
}
