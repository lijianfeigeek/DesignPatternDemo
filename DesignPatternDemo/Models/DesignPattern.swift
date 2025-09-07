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