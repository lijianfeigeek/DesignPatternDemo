# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a SwiftUI iOS application that demonstrates 23 GoF (Gang of Four) design patterns with complete Swift implementations. The app provides an educational interface for exploring and understanding design patterns through interactive examples.

## Build Commands

### Building the Project
```bash
# Build for iOS Simulator (iPhone 16)
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo -destination 'platform=iOS Simulator,name=iPhone 16' build

# Build for specific simulator (check available devices with xcodebuild -showdestinations)
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo -destination 'platform=iOS Simulator,name=iPhone 16 Pro' build
```

### Running Tests
```bash
# Run tests (if tests are added)
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo test
```

## Architecture

### Core Data Model
The application uses a centralized data model defined in `Models/DesignPattern.swift`:

- **DesignPattern enum**: Contains all 23 design patterns with properties:
  - `type`: Categorizes patterns as creational, structural, or behavioral
  - `description`: Provides concise explanations of each pattern
  - `codeExample`: Contains complete Swift implementation examples

- **PatternType enum**: Defines the three pattern categories (创建型/creational, 结构型/structural, 行为型/behavioral)

### View Architecture
The app follows SwiftUI's declarative pattern with two main views:

1. **ContentView.swift**: Main list view that:
   - Groups patterns by type using `ForEach` and `Section`
   - Displays patterns in a card-based layout with color coding
   - Uses `NavigationStack` for navigation
   - Implements `PatternRow` sub-view for consistent item display

2. **PatternDetailView.swift**: Detail view that:
   - Shows comprehensive information about each pattern
   - Features expandable code examples with syntax highlighting
   - Includes copy-to-clipboard functionality
   - Uses card-based layout for better information hierarchy

### Color Coding System
Pattern types are visually distinguished by colors:
- **Creational patterns**: Orange (`Color.orange`)
- **Structural patterns**: Blue (`Color.blue`)  
- **Behavioral patterns**: Green (`Color.green`)

### Key Features
- **Interactive Navigation**: Seamless navigation between list and detail views
- **Code Examples**: Complete, runnable Swift code for each pattern
- **Copy Functionality**: One-click code copying with visual feedback
- **Responsive Design**: Adapts to different screen sizes
- **Expandable Content**: Code sections can be expanded/collapsed

## File Structure
```
DesignPatternDemo/
├── Models/
│   └── DesignPattern.swift      # Core data model with all patterns
├── Views/
│   └── PatternDetailView.swift  # Detail view for individual patterns
├── DesignPatternDemoApp.swift   # App entry point
├── ContentView.swift           # Main list view
└── Assets.xcassets/           # App assets and icons
```

## Development Notes

### Adding New Patterns
To add a new design pattern:
1. Add a new case to the `DesignPattern` enum
2. Update the `type` computed property to categorize it
3. Add description and code example in the respective switch statements
4. The UI will automatically reflect the new pattern

### Code Example Standards
All code examples should:
- Be complete and runnable Swift code
- Include proper comments explaining the pattern
- Follow Swift naming conventions
- Demonstrate practical usage scenarios
- Use protocol-oriented design where appropriate

### UI Consistency
- Maintain consistent color coding for pattern types
- Use the `typeColor` computed property in both views
- Follow the established card-based layout pattern
- Preserve the expandable code section behavior