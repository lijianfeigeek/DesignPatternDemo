import Foundation

enum PatternType: String, CaseIterable {
    case creational = "创建型"
    case structural = "结构型"
    case behavioral = "行为型"
}

enum DesignPattern: String, CaseIterable, Identifiable {
    // 创建型模式
    case singleton = "单例模式"
    case factoryMethod = "工厂方法模式"
    case abstractFactory = "抽象工厂模式"
    case builder = "建造者模式"
    case prototype = "原型模式"
    
    // 结构型模式
    case adapter = "适配器模式"
    case bridge = "桥接模式"
    case composite = "组合模式"
    case decorator = "装饰器模式"
    case facade = "外观模式"
    case flyweight = "享元模式"
    case proxy = "代理模式"
    
    // 行为型模式
    case chainOfResponsibility = "责任链模式"
    case command = "命令模式"
    case interpreter = "解释器模式"
    case iterator = "迭代器模式"
    case mediator = "中介者模式"
    case memento = "备忘录模式"
    case observer = "观察者模式"
    case state = "状态模式"
    case strategy = "策略模式"
    case templateMethod = "模板方法模式"
    case visitor = "访问者模式"
    
    var id: String { rawValue }
    
    var type: PatternType {
        switch self {
        case .singleton, .factoryMethod, .abstractFactory, .builder, .prototype:
            return .creational
        case .adapter, .bridge, .composite, .decorator, .facade, .flyweight, .proxy:
            return .structural
        case .chainOfResponsibility, .command, .interpreter, .iterator, .mediator, .memento, .observer, .state, .strategy, .templateMethod, .visitor:
            return .behavioral
        }
    }
    
    var description: String {
        switch self {
        case .singleton:
            return "确保一个类只有一个实例，并提供一个全局访问点"
        case .factoryMethod:
            return "定义一个创建对象的接口，让子类决定实例化哪个类"
        case .abstractFactory:
            return "提供一个接口，用于创建相关或依赖对象的家族"
        case .builder:
            return "将一个复杂对象的构建与其表示分离"
        case .prototype:
            return "通过复制原型来创建新的对象"
        case .adapter:
            return "将一个类的接口转换成客户端期望的另一个接口"
        case .bridge:
            return "将抽象部分与实现部分分离，使它们都可以独立变化"
        case .composite:
            return "将对象组合成树形结构以表示'部分-整体'的层次结构"
        case .decorator:
            return "动态地给一个对象添加一些额外的职责"
        case .facade:
            return "为子系统中的一组接口提供一个一致的界面"
        case .flyweight:
            return "运用共享技术来有效地支持大量细粒度的对象"
        case .proxy:
            return "为其他对象提供一种代理以控制对这个对象的访问"
        case .chainOfResponsibility:
            return "使多个对象都有机会处理请求"
        case .command:
            return "将一个请求封装为一个对象"
        case .interpreter:
            return "给定一种语言，定义它的文法的一种表示"
        case .iterator:
            return "提供一种方法顺序访问一个聚合对象中的各个元素"
        case .mediator:
            return "用一个中介对象来封装一系列的对象交互"
        case .memento:
            return "在不破坏封装性的前提下，捕获一个对象的内部状态"
        case .observer:
            return "定义对象间的一种一对多的依赖关系"
        case .state:
            return "允许一个对象在其内部状态改变时改变它的行为"
        case .strategy:
            return "定义一系列的算法，把它们一个个封装起来"
        case .templateMethod:
            return "定义一个操作中的算法的骨架，而将一些步骤延迟到子类中"
        case .visitor:
            return "表示一个作用于某对象结构中的各元素的操作"
        }
    }
    
    var iOSUsage: String {
        switch self {
        case .singleton:
            return """
            ### iOS应用场景：
            - UserDefaults.standard - 应用配置管理
            - FileManager.default - 文件系统操作
            - UIScreen.main - 屏幕信息获取
            - UIApplication.shared - 应用全局访问
            
            #### 实际应用：
            - 网络管理器单例，统一管理所有网络请求
            - 数据库管理器单例，提供数据库操作接口
            - 用户会话管理器，管理用户登录状态
            - 缓存管理器，统一管理应用缓存
            
            #### 最佳实践：
            - 使用静态常量而非可选类型确保线程安全
            - 避免在单例中保存过多状态，防止内存泄漏
            - 考虑使用依赖注入替代单例，提高可测试性
            """
        case .factoryMethod:
            return """
            ### iOS应用场景：
            - UIViewController 实例化 - UIStoryboard.instantiateViewController
            - UIView 创建 - 自定义视图工厂方法
            - UITableViewCell 创建 - 基于重用标识符的工厂方法
            
            #### 实际应用：
            - 不同类型的TableViewCell工厂创建
            - 基于API响应的模型对象创建
            - 不同主题的UI组件工厂创建
            - 网络请求响应的数据解析器工厂
            
            #### 最佳实践：
            - 结合协议定义产品接口，提高扩展性
            - 使用泛型工厂方法减少重复代码
            - 考虑使用依赖注入容器管理工厂
            """
        case .abstractFactory:
            return """
            ### iOS应用场景：
            - 不同平台UI组件工厂 - iOS/iPad/Mac Catalyst
            - 主题系统 - 明暗主题UI组件创建
            - 数据持久化工厂 - Core Data/Realm/SQLite
            
            #### 实际应用：
            - 创建支持多种主题的UI组件工厂
            - 构建跨平台的视图组件创建系统
            - 不同数据源的统一访问接口
            - 多种支付方式的抽象工厂
            
            #### 最佳实践：
            - 确保产品族的一致性，避免混合使用不同工厂的产品
            - 使用依赖注入注入具体的工厂实现
            - 考虑使用协议组合定义复杂的工厂接口
            """
        case .builder:
            return """
            ### iOS应用场景：
            - NSAttributedString 构建复杂富文本
            - UIBezierPath 构建复杂图形路径
            - URLComponents 构建URL
            - NSLayoutConstraint 构建约束
            
            #### 实际应用：
            - 复杂表单验证器的构建
            - 网络请求配置的构建
            - 动画配置参数的构建
            - 自定义视图属性的构建
            
            #### 最佳实践：
            - 提供合理的默认值，简化构建过程
            - 支持链式调用，提高代码可读性
            - 在build()方法中进行参数验证
            - 考虑使用函数式构建器（Function Builder）
            """
        case .prototype:
            return """
            ### iOS应用场景：
            - NSCopying 协议实现对象复制
            - UIView 复制用于相似界面
            - 模型对象复制用于数据编辑
            
            #### 实际应用：
            - 产品配置的模板复制和修改
            - 游戏中敌人或道具的复制
            - 表单数据的草稿保存和恢复
            - 视图控制器的快速复制创建
            
            #### 最佳实践：
            - 深拷贝 vs 浅拷贝的选择要明确
            - 使用NSCopying或NSCoding协议
            - 考虑使用归档/解档实现复杂对象复制
            - 注意循环引用问题
            """
        case .adapter:
            return """
            ### iOS应用场景：
            - 第三方SDK适配 - 适配不同版本API
            - 旧代码适配 - 适配新的架构模式
            - 数据格式适配 - JSON/XML数据转换
            
            #### 实际应用：
            - 适配不同版本的iOS API
            - 适配第三方SDK的接口变化
            - 将Legacy代码适配到新的架构
            - 不同数据模型之间的转换
            
            #### 最佳实践：
            - 使用协议定义目标接口
            - 保持适配器的单一职责
            - 考虑使用组合而非继承
            - 为复杂的适配场景创建专门的适配器类
            """
        case .bridge:
            return """
            ### iOS应用场景：
            - 绘图系统 - Core Graphics/Metal/OpenGL实现
            - 主题系统 - 不同主题的UI实现
            - 网络层 - URLSession/Alamofire实现
            
            #### 实际应用：
            - 跨平台绘图系统的抽象
            - 支持多种网络库的网络层抽象
            - 不同主题系统的UI实现
            - 多种存储方式的数据访问层
            
            #### 最佳实践：
            - 使用协议定义抽象接口
            - 避免在抽象层中包含实现细节
            - 使用依赖注入注入具体实现
            - 考虑使用工厂模式管理实现类
            """
        case .composite:
            return """
            ### iOS应用场景：
            - UIView 层级结构 - 视图树管理
            - CALayer 层级结构 - 图层树管理
            - 响应者链 - 事件处理链
            
            #### 实际应用：
            - 复杂的UI组件树结构
            - 文档结构的树形表示
            - 菜单系统的层级管理
            - 文件系统的树形结构
            
            #### 最佳实践：
            - 定义统一的组件接口
            - 支持递归操作，简化复杂结构处理
            - 考虑性能问题，避免过度嵌套
            - 使用访问者模式处理复杂结构
            """
        case .decorator:
            return """
            ### iOS应用场景：
            - UIView 动画装饰 - 为视图添加动画效果
            - 文本样式装饰 - 为文本添加样式效果
            - 网络请求装饰 - 为请求添加日志、缓存等功能
            
            #### 实际应用：
            - 为视图添加边框、阴影、圆角等装饰
            - 为网络请求添加重试、缓存、日志功能
            - 为文本添加点击事件、高亮效果
            - 为图片添加滤镜、水印效果
            
            #### 最佳实践：
            - 保持装饰器的透明性
            - 支持装饰器的嵌套组合
            - 使用协议定义装饰器接口
            - 避免过度装饰，保持代码简洁
            """
        case .facade:
            return """
            ### iOS应用场景：
            - UIImagePickerController - 简化图片选择流程
            - UIAlertController - 简化弹窗显示
            - Core Data Stack - 简化数据库操作
            
            #### 实际应用：
            - 简化复杂的API调用流程
            - 封装第三方SDK的复杂接口
            - 提供统一的数据访问接口
            - 简化复杂的业务逻辑
            
            #### 最佳实践：
            - 保持Facade的简洁性
            - 提供合理默认值，简化使用
            - 避免过度封装，保持灵活性
            - 考虑使用Builder模式配置复杂参数
            """
        case .flyweight:
            return """
            ### iOS应用场景：
            - UITableViewCell 重用 - 节省内存
            - UICollectionViewCell 重用 - 节省内存
            - 图片缓存 - 避免重复加载
            
            #### 实际应用：
            - 大量相似UI组件的重用
            - 字符串常量的缓存
            - 图片资源的缓存管理
            - 网络请求结果的缓存
            
            #### 最佳实践：
            - 正确区分内部状态和外部状态
            - 使用合适的缓存策略
            - 注意内存管理，避免内存泄漏
            - 考虑使用NSCache进行缓存管理
            """
        case .proxy:
            return """
            ### iOS应用场景：
            - UITableViewDelegate - 代理UITableView操作
            - UITableViewDataSource - 代理数据源操作
            - 网络请求代理 - 管理网络请求
            
            #### 实际应用：
            - 图片加载的懒加载代理
            - 权限检查的安全代理
            - 网络请求的缓存代理
            - 数据访问的权限控制代理
            
            #### 最佳实践：
            - 保持代理接口的简洁性
            - 正确处理代理的生命周期
            - 避免循环引用问题
            - 考虑使用weak引用修饰代理属性
            """
        case .chainOfResponsibility:
            return """
            ### iOS应用场景：
            - UIResponder 响应者链 - 事件处理
            - 手势识别器链 - 手势识别
            - 网络请求拦截器链 - 请求处理
            
            #### 实际应用：
            - 用户输入事件的层层处理
            - 网络请求的认证、日志、缓存处理
            - 数据验证的链式处理
            - 错误处理的链式传播
            
            #### 最佳实践：
            - 明确每个处理器的职责边界
            - 提供默认的处理器实现
            - 支持动态添加和移除处理器
            - 考虑使用组合模式构建复杂处理链
            """
        case .command:
            return """
            ### iOS应用场景：
            - UndoManager - 撤销/重做操作
            - 用户操作记录 - 操作历史管理
            - 远程控制 - 远程命令执行
            
            #### 实际应用：
            - 文本编辑器的撤销/重做功能
            - 游戏中的操作回放功能
            - 批量操作的队列管理
            - 定时任务的调度管理
            
            #### 最佳实践：
            - 使用不可变对象封装命令状态
            - 支持命令的序列化和反序列化
            - 提供命令的撤销和重做能力
            - 考虑使用命令队列管理批量操作
            """
        case .interpreter:
            return """
            ### iOS应用场景：
            - 表达式解析 - 数学表达式计算
            - 配置文件解析 - 属性列表解析
            - 查询语言解析 - 数据库查询
            
            #### 实际应用：
            - 简单的数学表达式解析器
            - 配置文件的解析和验证
            - 搜索条件的解析和执行
            - 模板语言的解析和渲染
            
            #### 最佳实践：
            - 定义清晰的语法规则
            - 使用递归下降解析器
            - 提供良好的错误处理机制
            - 考虑使用现有的解析库
            """
        case .iterator:
            return """
            ### iOS应用场景：
            - Array/Dictionary 遍历 - 集合遍历
            - Core Data 结果集遍历 - 数据查询
            - 文件系统遍历 - 文件操作
            
            #### 实际应用：
            - 自定义数据结构的遍历
            - 分页数据加载的迭代器
            - 树形结构的遍历
            - 网络请求结果的流式处理
            
            #### 最佳实践：
            - 使用Sequence协议简化迭代器实现
            - 支持多种遍历方式（正向、反向）
            - 处理迭代过程中的状态变化
            - 考虑使用lazy加载提高性能
            """
        case .mediator:
            return """
            ### iOS应用场景：
            - NotificationCenter - 观察者模式中介
            - 组件间通信 - 模块间解耦
            - 聊天应用 - 消息路由
            
            #### 实际应用：
            - 复杂UI组件间的通信
            - 模块间的解耦通信
            - 多人协作的数据同步
            - 事件总线系统
            
            #### 最佳实践：
            - 避免中介者成为"上帝对象"
            - 使用协议定义通信接口
            - 支持异步通信
            - 考虑使用Combine框架替代传统中介者
            """
        case .memento:
            return """
            ### iOS应用场景：
            - 应用状态保存 - 应用后台恢复
            - 游戏进度保存 - 游戏状态管理
            - 文档编辑保存 - 文档版本管理
            
            #### 实际应用：
            - 表单数据的草稿保存
            - 游戏进度的检查点系统
            - 文档编辑的版本历史
            - 用户界面状态的保存和恢复
            
            #### 最佳实践：
            - 使用NSCoding或Codable实现序列化
            - 注意保存数据的大小和安全性
            - 提供合理的默认恢复策略
            - 考虑使用增量保存减少内存使用
            """
        case .observer:
            return """
            ### iOS应用场景：
            - NotificationCenter - 事件通知
            - KVO (Key-Value Observing) - 属性监听
            - Combine - 响应式编程
            
            #### 实际应用：
            - 用户登录状态变化通知
            - 数据变化时UI更新
            - 网络状态变化监听
            - 设备方向变化处理
            
            #### 最佳实践：
            - 使用弱引用避免循环引用
            - 及时移除不再需要的观察者
            - 考虑使用Combine框架的现代化实现
            - 注意线程安全问题
            """
        case .state:
            return """
            ### iOS应用场景：
            - UIViewController 生命周期 - 状态管理
            - 网络连接状态 - 连接管理
            - 用户认证状态 - 登录管理
            
            #### 实际应用：
            - 网络请求的加载、成功、失败状态
            - 用户界面的加载、内容、错误状态
            - 音频播放的播放、暂停、停止状态
            - 文件上传的上传中、完成、失败状态
            
            #### 最佳实践：
            - 使用枚举定义状态类型
            - 确保状态转换的合法性
            - 提供状态变化的通知机制
            - 考虑使用状态机库管理复杂状态
            """
        case .strategy:
            return """
            ### iOS应用场景：
            - 图片加载策略 - 缓存策略
            - 数据验证策略 - 输入验证
            - 动画策略 - 动画效果
            
            #### 实际应用：
            - 不同网络环境的图片加载策略
            - 多种支付方式的选择策略
            - 不同数据格式的解析策略
            - 多种导航方式的切换策略
            
            #### 最佳实践：
            - 使用协议定义策略接口
            - 支持策略的动态切换
            - 提供默认策略实现
            - 考虑使用依赖注入管理策略
            """
        case .templateMethod:
            return """
            ### iOS应用场景：
            - UIViewController 生命周期 - 视图生命周期
            - UIView 动画 - 动画模板
            - 网络请求 - 请求流程
            
            #### 实际应用：
            - 标准的网络请求流程模板
            - 统一的表单验证流程
            - 标准的数据加载和显示流程
            - 通用的用户操作处理流程
            
            #### 最佳实践：
            - 将可变步骤定义为抽象方法
            - 提供合理的默认实现
            - 使用协议定义模板方法
            - 考虑使用闭包简化模板方法
            """
        case .visitor:
            return """
            ### iOS应用场景：
            - UIView 层级遍历 - 视图树操作
            - Core Data 对象图遍历 - 数据处理
            - 文件系统遍历 - 文件操作
            
            #### 实际应用：
            - 复杂UI结构的分析和处理
            - 数据模型的批量操作
            - 文件系统的递归操作
            - 对象结构的序列化和反序列化
            
            #### 最佳实践：
            - 使用协议定义访问者接口
            - 支持多重分派
            - 考虑使用泛型简化访问者实现
            - 注意访问者模式的复杂性和适用场景
            """
        }
    }
    
    var codeExample: String {
        switch self {
        case .singleton:
            return """
            class Singleton {
                static let shared = Singleton()
                private init() {}
                
                func doSomething() {
                    print("Singleton is working")
                }
            }
            
            // 使用
            let singleton = Singleton.shared
            singleton.doSomething()
            """
        case .factoryMethod:
            return """
            protocol Animal {
                func speak()
            }
            
            class Dog: Animal {
                func speak() { print("Woof!") }
            }
            
            class Cat: Animal {
                func speak() { print("Meow!") }
            }
            
            class AnimalFactory {
                static func createAnimal(type: String) -> Animal? {
                    switch type {
                    case "dog": return Dog()
                    case "cat": return Cat()
                    default: return nil
                    }
                }
            }
            
            // 使用
            let dog = AnimalFactory.createAnimal(type: "dog")
            dog?.speak()
            """
        case .abstractFactory:
            return """
            protocol Button {
                func render()
            }
            
            protocol Checkbox {
                func render()
            }
            
            class WindowsButton: Button {
                func render() { print("Windows Button") }
            }
            
            class WindowsCheckbox: Checkbox {
                func render() { print("Windows Checkbox") }
            }
            
            class MacButton: Button {
                func render() { print("Mac Button") }
            }
            
            class MacCheckbox: Checkbox {
                func render() { print("Mac Checkbox") }
            }
            
            protocol GUIFactory {
                func createButton() -> Button
                func createCheckbox() -> Checkbox
            }
            
            class WindowsFactory: GUIFactory {
                func createButton() -> Button { return WindowsButton() }
                func createCheckbox() -> Checkbox { return WindowsCheckbox() }
            }
            
            class MacFactory: GUIFactory {
                func createButton() -> Button { return MacButton() }
                func createCheckbox() -> Checkbox { return MacCheckbox() }
            }
            
            // 使用
            let factory: GUIFactory = WindowsFactory()
            let button = factory.createButton()
            let checkbox = factory.createCheckbox()
            button.render()
            checkbox.render()
            """
        case .builder:
            return """
            class Computer {
                var cpu: String = ""
                var ram: String = ""
                var storage: String = ""
                
                func description() -> String {
                    return "CPU: \\(cpu), RAM: \\(ram), Storage: \\(storage)"
                }
            }
            
            class ComputerBuilder {
                private var computer = Computer()
                
                func addCPU(_ cpu: String) -> ComputerBuilder {
                    computer.cpu = cpu
                    return self
                }
                
                func addRAM(_ ram: String) -> ComputerBuilder {
                    computer.ram = ram
                    return self
                }
                
                func addStorage(_ storage: String) -> ComputerBuilder {
                    computer.storage = storage
                    return self
                }
                
                func build() -> Computer {
                    return computer
                }
            }
            
            // 使用
            let computer = ComputerBuilder()
                .addCPU("Intel i7")
                .addRAM("16GB")
                .addStorage("512GB SSD")
                .build()
            
            print(computer.description())
            """
        case .prototype:
            return """
            class Prototype {
                var value: String
                
                init(value: String) {
                    self.value = value
                }
                
                func clone() -> Prototype {
                    return Prototype(value: self.value)
                }
            }
            
            // 使用
            let original = Prototype(value: "Original")
            let copy = original.clone()
            
            copy.value = "Copy"
            
            print(original.value) // Original
            print(copy.value)     // Copy
            """
        case .adapter:
            return """
            // 目标接口
            protocol Target {
                func request()
            }
            
            // 适配者类
            class Adaptee {
                func specificRequest() {
                    print("Adaptee's specific request")
                }
            }
            
            // 适配器类
            class Adapter: Target {
                private let adaptee: Adaptee
                
                init(adaptee: Adaptee) {
                    self.adaptee = adaptee
                }
                
                func request() {
                    adaptee.specificRequest()
                }
            }
            
            // 使用
            let adaptee = Adaptee()
            let adapter = Adapter(adaptee: adaptee)
            adapter.request()
            """
        case .bridge:
            return """
            // 实现接口
            protocol DrawingAPI {
                func drawCircle(x: Double, y: Double, radius: Double)
            }
            
            class DrawingAPI1: DrawingAPI {
                func drawCircle(x: Double, y: Double, radius: Double) {
                    print("API1.circle at \\(x):\\(y) radius \\(radius)")
                }
            }
            
            class DrawingAPI2: DrawingAPI {
                func drawCircle(x: Double, y: Double, radius: Double) {
                    print("API2.circle at \\(x):\\(y) radius \\(radius)")
                }
            }
            
            // 抽象类
            class Shape {
                private let drawingAPI: DrawingAPI
                
                init(drawingAPI: DrawingAPI) {
                    self.drawingAPI = drawingAPI
                }
                
                func draw() {
                    // 抽象方法，由子类实现
                }
                
                func resize(byPercentage percentage: Double) {
                    // 抽象方法，由子类实现
                }
            }
            
            class CircleShape: Shape {
                private var x: Double
                private var y: Double
                private var radius: Double
                
                init(x: Double, y: Double, radius: Double, drawingAPI: DrawingAPI) {
                    self.x = x
                    self.y = y
                    self.radius = radius
                    super.init(drawingAPI: drawingAPI)
                }
                
                override func draw() {
                    drawingAPI.drawCircle(x: x, y: y, radius: radius)
                }
            }
            
            // 使用
            let circle = CircleShape(x: 1, y: 2, radius: 3, drawingAPI: DrawingAPI1())
            circle.draw()
            """
        case .composite:
            return """
            protocol Component {
                var name: String { get }
                func display(depth: Int)
            }
            
            class Leaf: Component {
                let name: String
                
                init(name: String) {
                    self.name = name
                }
                
                func display(depth: Int) {
                    print(String(repeating: "-", count: depth) + name)
                }
            }
            
            class Composite: Component {
                let name: String
                private var children: [Component] = []
                
                init(name: String) {
                    self.name = name
                }
                
                func add(_ component: Component) {
                    children.append(component)
                }
                
                func remove(_ component: Component) {
                    children.removeAll { $0.name == component.name }
                }
                
                func display(depth: Int) {
                    print(String(repeating: "-", count: depth) + name)
                    children.forEach { $0.display(depth: depth + 2) }
                }
            }
            
            // 使用
            let root = Composite(name: "Root")
            let branch1 = Composite(name: "Branch 1")
            let branch2 = Composite(name: "Branch 2")
            let leaf1 = Leaf(name: "Leaf 1")
            let leaf2 = Leaf(name: "Leaf 2")
            
            root.add(branch1)
            root.add(branch2)
            branch1.add(leaf1)
            branch2.add(leaf2)
            
            root.display(depth: 0)
            """
        case .decorator:
            return """
            protocol Component {
                func operation() -> String
            }
            
            class ConcreteComponent: Component {
                func operation() -> String {
                    return "ConcreteComponent"
                }
            }
            
            class Decorator: Component {
                private let component: Component
                
                init(component: Component) {
                    self.component = component
                }
                
                func operation() -> String {
                    return component.operation()
                }
            }
            
            class ConcreteDecoratorA: Decorator {
                override func operation() -> String {
                    return "ConcreteDecoratorA(" + super.operation() + ")"
                }
            }
            
            class ConcreteDecoratorB: Decorator {
                override func operation() -> String {
                    return "ConcreteDecoratorB(" + super.operation() + ")"
                }
            }
            
            // 使用
            let component = ConcreteComponent()
            let decoratorA = ConcreteDecoratorA(component: component)
            let decoratorB = ConcreteDecoratorB(component: decoratorA)
            
            print(decoratorB.operation())
            """
        case .facade:
            return """
            class SubsystemA {
                func operationA() {
                    print("Subsystem A operation")
                }
            }
            
            class SubsystemB {
                func operationB() {
                    print("Subsystem B operation")
                }
            }
            
            class SubsystemC {
                func operationC() {
                    print("Subsystem C operation")
                }
            }
            
            class Facade {
                private let subsystemA = SubsystemA()
                private let subsystemB = SubsystemB()
                private let subsystemC = SubsystemC()
                
                func operation() {
                    print("Facade coordinates subsystems:")
                    subsystemA.operationA()
                    subsystemB.operationB()
                    subsystemC.operationC()
                }
            }
            
            // 使用
            let facade = Facade()
            facade.operation()
            """
        case .flyweight:
            return """
            class Flyweight {
                private let intrinsicState: String
                
                init(intrinsicState: String) {
                    self.intrinsicState = intrinsicState
                }
                
                func operation(extrinsicState: String) {
                    print("Flyweight: \\(intrinsicState) with \\(extrinsicState)")
                }
            }
            
            class FlyweightFactory {
                private var flyweights: [String: Flyweight] = [:]
                
                func getFlyweight(key: String) -> Flyweight {
                    if let flyweight = flyweights[key] {
                        return flyweight
                    } else {
                        let flyweight = Flyweight(intrinsicState: key)
                        flyweights[key] = flyweight
                        return flyweight
                    }
                }
            }
            
            // 使用
            let factory = FlyweightFactory()
            
            let flyweight1 = factory.getFlyweight(key: "Shared")
            let flyweight2 = factory.getFlyweight(key: "Shared")
            
            flyweight1.operation(extrinsicState: "First")
            flyweight2.operation(extrinsicState: "Second")
            """
        case .proxy:
            return """
            protocol Subject {
                func request()
            }
            
            class RealSubject: Subject {
                func request() {
                    print("RealSubject: Handling request")
                }
            }
            
            class Proxy: Subject {
                private var realSubject: RealSubject?
                
                func request() {
                    if realSubject == nil {
                        realSubject = RealSubject()
                    }
                    print("Proxy: Pre-processing")
                    realSubject?.request()
                    print("Proxy: Post-processing")
                }
            }
            
            // 使用
            let proxy = Proxy()
            proxy.request()
            """
        case .chainOfResponsibility:
            return """
            protocol Handler {
                var next: Handler? { get set }
                func handleRequest(request: String)
            }
            
            class ConcreteHandlerA: Handler {
                var next: Handler?
                
                func handleRequest(request: String) {
                    if request == "A" {
                        print("Handler A handled request \\(request)")
                    } else {
                        next?.handleRequest(request: request)
                    }
                }
            }
            
            class ConcreteHandlerB: Handler {
                var next: Handler?
                
                func handleRequest(request: String) {
                    if request == "B" {
                        print("Handler B handled request \\(request)")
                    } else {
                        next?.handleRequest(request: request)
                    }
                }
            }
            
            class ConcreteHandlerC: Handler {
                var next: Handler?
                
                func handleRequest(request: String) {
                    if request == "C" {
                        print("Handler C handled request \\(request)")
                    } else {
                        print("No handler found for request \\(request)")
                    }
                }
            }
            
            // 使用
            let handlerA = ConcreteHandlerA()
            let handlerB = ConcreteHandlerB()
            let handlerC = ConcreteHandlerC()
            
            handlerA.next = handlerB
            handlerB.next = handlerC
            
            handlerA.handleRequest(request: "B")
            """
        case .command:
            return """
            protocol Command {
                func execute()
            }
            
            class Light {
                func turnOn() {
                    print("Light is on")
                }
                
                func turnOff() {
                    print("Light is off")
                }
            }
            
            class LightOnCommand: Command {
                private let light: Light
                
                init(light: Light) {
                    self.light = light
                }
                
                func execute() {
                    light.turnOn()
                }
            }
            
            class LightOffCommand: Command {
                private let light: Light
                
                init(light: Light) {
                    self.light = light
                }
                
                func execute() {
                    light.turnOff()
                }
            }
            
            class RemoteControl {
                private var command: Command?
                
                func setCommand(_ command: Command) {
                    self.command = command
                }
                
                func pressButton() {
                    command?.execute()
                }
            }
            
            // 使用
            let light = Light()
            let lightOn = LightOnCommand(light: light)
            let lightOff = LightOffCommand(light: light)
            
            let remote = RemoteControl()
            remote.setCommand(lightOn)
            remote.pressButton()
            
            remote.setCommand(lightOff)
            remote.pressButton()
            """
        case .interpreter:
            return """
            protocol Expression {
                func interpret(context: String) -> Bool
            }
            
            class TerminalExpression: Expression {
                private let data: String
                
                init(data: String) {
                    self.data = data
                }
                
                func interpret(context: String) -> Bool {
                    return context.contains(data)
                }
            }
            
            class OrExpression: Expression {
                private let expr1: Expression
                private let expr2: Expression
                
                init(expr1: Expression, expr2: Expression) {
                    self.expr1 = expr1
                    self.expr2 = expr2
                }
                
                func interpret(context: String) -> Bool {
                    return expr1.interpret(context: context) || expr2.interpret(context: context)
                }
            }
            
            class AndExpression: Expression {
                private let expr1: Expression
                private let expr2: Expression
                
                init(expr1: Expression, expr2: Expression) {
                    self.expr1 = expr1
                    self.expr2 = expr2
                }
                
                func interpret(context: String) -> Bool {
                    return expr1.interpret(context: context) && expr2.interpret(context: context)
                }
            }
            
            // 使用
            let swift = TerminalExpression(data: "Swift")
            let ios = TerminalExpression(data: "iOS")
            
            let isSwiftIOS = OrExpression(expr1: swift, expr2: ios)
            let isSwiftAndIOS = AndExpression(expr1: swift, expr2: ios)
            
            print(isSwiftIOS.interpret(context: "Swift Programming")) // true
            print(isSwiftAndIOS.interpret(context: "Swift iOS Development")) // true
            """
        case .iterator:
            return """
            protocol Iterator {
                func hasNext() -> Bool
                func next() -> String?
            }
            
            protocol Aggregate {
                func createIterator() -> Iterator
            }
            
            class ConcreteIterator: Iterator {
                private var collection: [String]
                private var index = 0
                
                init(collection: [String]) {
                    self.collection = collection
                }
                
                func hasNext() -> Bool {
                    return index < collection.count
                }
                
                func next() -> String? {
                    if hasNext() {
                        let item = collection[index]
                        index += 1
                        return item
                    }
                    return nil
                }
            }
            
            class ConcreteAggregate: Aggregate {
                private var items: [String] = []
                
                func addItem(_ item: String) {
                    items.append(item)
                }
                
                func createIterator() -> Iterator {
                    return ConcreteIterator(collection: items)
                }
            }
            
            // 使用
            let aggregate = ConcreteAggregate()
            aggregate.addItem("Item 1")
            aggregate.addItem("Item 2")
            aggregate.addItem("Item 3")
            
            let iterator = aggregate.createIterator()
            while iterator.hasNext() {
                if let item = iterator.next() {
                    print(item)
                }
            }
            """
        case .mediator:
            return """
            protocol Mediator {
                func send(message: String, colleague: Colleague)
            }
            
            class Colleague {
                private let mediator: Mediator
                let name: String
                
                init(mediator: Mediator, name: String) {
                    self.mediator = mediator
                    self.name = name
                }
                
                func send(message: String) {
                    mediator.send(message: message, colleague: self)
                }
                
                func receive(message: String) {
                    print("\\(name) received: \\(message)")
                }
            }
            
            class ConcreteMediator: Mediator {
                private var colleagues: [Colleague] = []
                
                func addColleague(_ colleague: Colleague) {
                    colleagues.append(colleague)
                }
                
                func send(message: String, colleague: Colleague) {
                    for c in colleagues {
                        if c !== colleague {
                            c.receive(message: message)
                        }
                    }
                }
            }
            
            // 使用
            let mediator = ConcreteMediator()
            
            let alice = Colleague(mediator: mediator, name: "Alice")
            let bob = Colleague(mediator: mediator, name: "Bob")
            let charlie = Colleague(mediator: mediator, name: "Charlie")
            
            mediator.addColleague(alice)
            mediator.addColleague(bob)
            mediator.addColleague(charlie)
            
            alice.send(message: "Hello everyone!")
            """
        case .memento:
            return """
            class Memento {
                private let state: String
                
                init(state: String) {
                    self.state = state
                }
                
                func getState() -> String {
                    return state
                }
            }
            
            class Originator {
                private var state: String
                
                func setState(_ state: String) {
                    self.state = state
                    print("State set to: \\(state)")
                }
                
                func saveState() -> Memento {
                    return Memento(state: state)
                }
                
                func restoreState(_ memento: Memento) {
                    state = memento.getState()
                    print("State restored to: \\(state)")
                }
            }
            
            class Caretaker {
                private var mementos: [Memento] = []
                
                func saveMemento(_ memento: Memento) {
                    mementos.append(memento)
                }
                
                func getMemento(at index: Int) -> Memento? {
                    guard index < mementos.count else { return nil }
                    return mementos[index]
                }
            }
            
            // 使用
            let originator = Originator()
            let caretaker = Caretaker()
            
            originator.setState(state: "State 1")
            caretaker.saveMemento(originator.saveState())
            
            originator.setState(state: "State 2")
            caretaker.saveMemento(originator.saveState())
            
            originator.setState(state: "State 3")
            
            originator.restoreState(caretaker.getMemento(at: 0)!)
            """
        case .observer:
            return """
            protocol Observer {
                func update(weather: String)
            }
            
            class WeatherStation {
                private var observers: [Observer] = []
                private var weather: String = ""
                
                func addObserver(_ observer: Observer) {
                    observers.append(observer)
                }
                
                func setWeather(_ weather: String) {
                    self.weather = weather
                    notifyObservers()
                }
                
                private func notifyObservers() {
                    observers.forEach { $0.update(weather: weather) }
                }
            }
            
            class User: Observer {
                func update(weather: String) {
                    print("Weather updated: \\(weather)")
                }
            }
            
            // 使用
            let station = WeatherStation()
            let user = User()
            station.addObserver(user)
            station.setWeather("Sunny")
            """
        case .state:
            return """
            protocol State {
                func handle(context: Context)
            }
            
            class Context {
                private var state: State
                
                init(state: State) {
                    self.state = state
                }
                
                func setState(_ state: State) {
                    self.state = state
                }
                
                func request() {
                    state.handle(context: self)
                }
            }
            
            class ConcreteStateA: State {
                func handle(context: Context) {
                    print("State A handling request")
                    context.setState(ConcreteStateB())
                }
            }
            
            class ConcreteStateB: State {
                func handle(context: Context) {
                    print("State B handling request")
                    context.setState(ConcreteStateA())
                }
            }
            
            // 使用
            let context = Context(state: ConcreteStateA())
            
            context.request() // State A
            context.request() // State B
            context.request() // State A
            """
        case .strategy:
            return """
            protocol Strategy {
                func execute(a: Int, b: Int) -> Int
            }
            
            class AddStrategy: Strategy {
                func execute(a: Int, b: Int) -> Int {
                    return a + b
                }
            }
            
            class SubtractStrategy: Strategy {
                func execute(a: Int, b: Int) -> Int {
                    return a - b
                }
            }
            
            class MultiplyStrategy: Strategy {
                func execute(a: Int, b: Int) -> Int {
                    return a * b
                }
            }
            
            class Context {
                private var strategy: Strategy
                
                init(strategy: Strategy) {
                    self.strategy = strategy
                }
                
                func setStrategy(_ strategy: Strategy) {
                    self.strategy = strategy
                }
                
                func executeStrategy(a: Int, b: Int) -> Int {
                    return strategy.execute(a: a, b: b)
                }
            }
            
            // 使用
            let context = Context(strategy: AddStrategy())
            print(context.executeStrategy(a: 5, b: 3)) // 8
            
            context.setStrategy(SubtractStrategy())
            print(context.executeStrategy(a: 5, b: 3)) // 2
            
            context.setStrategy(MultiplyStrategy())
            print(context.executeStrategy(a: 5, b: 3)) // 15
            """
        case .templateMethod:
            return """
            class AbstractClass {
                func templateMethod() {
                    step1()
                    step2()
                    step3()
                }
                
                private func step1() {
                    print("Step 1: Base implementation")
                }
                
                private func step2() {
                    print("Step 2: Base implementation")
                }
                
                func step3() {
                    // 抽象方法，由子类实现
                    fatalError("Subclasses must implement step3()")
                }
            }
            
            class ConcreteClassA: AbstractClass {
                override func step3() {
                    print("Step 3: ConcreteClassA implementation")
                }
            }
            
            class ConcreteClassB: AbstractClass {
                override func step3() {
                    print("Step 3: ConcreteClassB implementation")
                }
            }
            
            // 使用
            let classA = ConcreteClassA()
            classA.templateMethod()
            
            let classB = ConcreteClassB()
            classB.templateMethod()
            """
        case .visitor:
            return """
            protocol Visitor {
                func visit(_ element: ConcreteElementA)
                func visit(_ element: ConcreteElementB)
            }
            
            protocol Element {
                func accept(_ visitor: Visitor)
            }
            
            class ConcreteElementA: Element {
                func accept(_ visitor: Visitor) {
                    visitor.visit(self)
                }
                
                func operationA() {
                    print("ConcreteElementA operation")
                }
            }
            
            class ConcreteElementB: Element {
                func accept(_ visitor: Visitor) {
                    visitor.visit(self)
                }
                
                func operationB() {
                    print("ConcreteElementB operation")
                }
            }
            
            class ConcreteVisitor: Visitor {
                func visit(_ element: ConcreteElementA) {
                    print("Visitor visiting ConcreteElementA")
                    element.operationA()
                }
                
                func visit(_ element: ConcreteElementB) {
                    print("Visitor visiting ConcreteElementB")
                    element.operationB()
                }
            }
            
            class ObjectStructure {
                private var elements: [Element] = []
                
                func attach(_ element: Element) {
                    elements.append(element)
                }
                
                func detach(_ element: Element) {
                    elements.removeAll { $0 === element }
                }
                
                func accept(_ visitor: Visitor) {
                    elements.forEach { $0.accept(visitor) }
                }
            }
            
            // 使用
            let objectStructure = ObjectStructure()
            objectStructure.attach(ConcreteElementA())
            objectStructure.attach(ConcreteElementB())
            
            let visitor = ConcreteVisitor()
            objectStructure.accept(visitor)
            """
        default:
            return "// 代码示例正在开发中..."
        }
    }
}