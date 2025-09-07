//
//  DataStructuresView.swift
//  DesignPatternDemo
//
//  Created by Claude on 2025-01-01.
//

import SwiftUI

struct DataStructuresView: View {
    private let dataStructures = DataStructure.allCases
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(DataStructureType.allCases, id: \.self) { type in
                    Section(header: Text(type.rawValue)) {
                        ForEach(dataStructures.filter { $0.type == type }) { dataStructure in
                            NavigationLink(destination: DataStructureDetailView(dataStructure: dataStructure)) {
                                DataStructureRow(dataStructure: dataStructure)
                            }
                        }
                    }
                }
            }
            .navigationTitle("数据结构")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct DataStructureRow: View {
    let dataStructure: DataStructure
    @State private var isHovered = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(dataStructure.rawValue)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: typeIcon)
                                .font(.caption)
                                .foregroundColor(typeColor)
                            Text(dataStructure.type.rawValue)
                                .font(.caption)
                                .fontWeight(.medium)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(typeColor.opacity(0.15))
                                .foregroundColor(typeColor)
                                .cornerRadius(12)
                        }
                    }
                    
                    Text(dataStructure.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .lineSpacing(1)
                        .padding(.leading, 4)
                    
                    HStack {
                        Text("时间复杂度: \(dataStructure.timeComplexity)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("空间复杂度: \(dataStructure.spaceComplexity)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
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
    
    private var typeIcon: String {
        switch dataStructure.type {
        case .linear:
            return "list.bullet.below.rectangle"
        case .tree:
            return "tree.fill"
        case .graph:
            return "network"
        case .hash:
            return "number.square.fill"
        case .other:
            return "cube.box.fill"
        }
    }
}

#Preview {
    DataStructuresView()
}