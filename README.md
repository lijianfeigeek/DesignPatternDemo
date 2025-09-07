# DesignPatternDemo

一个使用 SwiftUI 构建的 iOS 应用，展示和讲解 23 种经典设计模式。

## 🎯 项目特性

- **📱 现代化界面**：使用 SwiftUI 构建的响应式用户界面
- **🎨 视觉化分类**：按创建型、结构型、行为型三大类分组展示
- **💻 完整代码示例**：每个模式都提供完整的 Swift 实现
- **🔍 详细说明**：包含每个设计模式的描述和应用场景
- **📋 一键复制**：支持直接复制代码示例到剪贴板
- **🔄 流畅导航**：优雅的页面切换和交互体验

## 🏗️ 设计模式分类

### 创建型模式（5种）
- **单例模式** (Singleton)：确保一个类只有一个实例，并提供一个全局访问点
- **工厂方法模式** (Factory Method)：定义一个创建对象的接口，让子类决定实例化哪个类
- **抽象工厂模式** (Abstract Factory)：提供一个接口，用于创建相关或依赖对象的家族
- **建造者模式** (Builder)：将一个复杂对象的构建与其表示分离
- **原型模式** (Prototype)：通过复制原型来创建新的对象

### 结构型模式（7种）
- **适配器模式** (Adapter)：将一个类的接口转换成客户端期望的另一个接口
- **桥接模式** (Bridge)：将抽象部分与实现部分分离，使它们都可以独立变化
- **组合模式** (Composite)：将对象组合成树形结构以表示'部分-整体'的层次结构
- **装饰器模式** (Decorator)：动态地给一个对象添加一些额外的职责
- **外观模式** (Facade)：为子系统中的一组接口提供一个一致的界面
- **享元模式** (Flyweight)：运用共享技术来有效地支持大量细粒度的对象
- **代理模式** (Proxy)：为其他对象提供一种代理以控制对这个对象的访问

### 行为型模式（11种）
- **责任链模式** (Chain of Responsibility)：使多个对象都有机会处理请求
- **命令模式** (Command)：将一个请求封装为一个对象
- **解释器模式** (Interpreter)：给定一种语言，定义它的文法的一种表示
- **迭代器模式** (Iterator)：提供一种方法顺序访问一个聚合对象中的各个元素
- **中介者模式** (Mediator)：用一个中介对象来封装一系列的对象交互
- **备忘录模式** (Memento)：在不破坏封装性的前提下，捕获一个对象的内部状态
- **观察者模式** (Observer)：定义对象间的一种一对多的依赖关系
- **状态模式** (State)：允许一个对象在其内部状态改变时改变它的行为
- **策略模式** (Strategy)：定义一系列的算法，把它们一个个封装起来
- **模板方法模式** (Template Method)：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中
- **访问者模式** (Visitor)：表示一个作用于某对象结构中的各元素的操作

## 🛠️ 技术栈

- **SwiftUI**：苹果的现代声明式UI框架
- **Swift 5**：最新的 Swift 编程语言
- **iOS 18.5+**：目标部署版本
- **Xcode 16.4+**：开发工具

## 📱 界面展示

### 主页面
- 按类型分组的列表视图
- 颜色编码的模式类型标识
- 卡片式布局展示模式信息
- 搜索友好的分组结构

### 详情页面
- 模式名称和类型标识
- 详细的功能描述
- 完整的 Swift 代码示例
- 可展开/收起的代码区域
- 一键复制代码功能

## 🚀 构建和运行

### 环境要求
- Xcode 16.4 或更高版本
- iOS 18.5 或更高版本
- Swift 5.9 或更高版本

### 构建命令
```bash
# 构建项目（iPhone 16 模拟器）
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo -destination 'platform=iOS Simulator,name=iPhone 16' build

# 构建项目（iPhone 16 Pro 模拟器）
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo -destination 'platform=iOS Simulator,name=iPhone 16 Pro' build

# 运行测试
xcodebuild -project DesignPatternDemo.xcodeproj -scheme DesignPatternDemo test
```

### 在 Xcode 中运行
1. 打开 `DesignPatternDemo.xcodeproj`
2. 选择目标设备（模拟器或真机）
3. 点击运行按钮（▶️）或使用 `Cmd+R`

## 📁 项目结构

```
DesignPatternDemo/
├── Models/
│   └── DesignPattern.swift      # 设计模式数据模型
├── Views/
│   └── PatternDetailView.swift  # 详情页面视图
├── DesignPatternDemoApp.swift   # 应用入口
├── ContentView.swift           # 主页面视图
├── Assets.xcassets/           # 应用资源
├── CLAUDE.md                  # Claude Code 开发指南
└── README.md                  # 项目说明文档
```

## 🎨 设计亮点

### 视觉设计
- **颜色编码**：创建型（橙色）、结构型（蓝色）、行为型（绿色）
- **卡片布局**：清晰的信息层次和视觉分组
- **响应式设计**：适配不同屏幕尺寸
- **现代风格**：遵循 iOS 设计规范

### 用户体验
- **流畅导航**：使用 NavigationStack 实现页面切换
- **交互反馈**：按钮点击和状态变化的视觉反馈
- **代码展示**：等宽字体和语法高亮风格
- **便捷操作**：一键复制代码，支持展开/收起

## 📖 使用说明

1. **浏览模式**：在主页面按类型浏览所有设计模式
2. **查看详情**：点击任意模式进入详情页面
3. **学习代码**：查看完整的 Swift 实现代码
4. **复制使用**：点击"复制代码"按钮将代码复制到剪贴板
5. **展开查看**：点击"展开"按钮查看完整的代码示例

## 🔧 开发指南

### 添加新的设计模式
1. 在 `Models/DesignPattern.swift` 中添加新的枚举 case
2. 更新 `type` 属性以正确分类新模式
3. 在 `description` 和 `codeExample` 中添加对应的实现
4. 界面会自动更新显示新模式

### 代码示例规范
- 提供完整、可运行的 Swift 代码
- 包含适当的注释说明
- 遵循 Swift 编码规范
- 展示实际的使用场景

## 📄 许可证

本项目仅供学习和参考使用。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目。

---

*本项目使用 SwiftUI 构建，旨在帮助开发者学习和理解经典设计模式在现代 iOS 开发中的应用。*
