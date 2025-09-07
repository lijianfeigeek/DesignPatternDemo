import Foundation

enum DataStructureType: String, CaseIterable {
    case linear = "线性结构"
    case tree = "树形结构"
    case graph = "图结构"
    case hash = "哈希结构"
    case other = "其他结构"
}

enum DataStructure: String, CaseIterable, Identifiable {
    // 线性结构
    case array = "数组"
    case stack = "栈"
    case queue = "队列"
    case linkedList = "链表"
    case deque = "双端队列"
    
    // 树形结构
    case binaryTree = "二叉树"
    case binarySearchTree = "二叉搜索树"
    case avlTree = "AVL树"
    case bTree = "B树"
    case heap = "堆"
    
    // 图结构
    case graph = "图"
    case directedGraph = "有向图"
    case weightedGraph = "加权图"
    
    // 哈希结构
    case hashTable = "哈希表"
    case hashSet = "哈希集合"
    case hashMap = "哈希映射"
    
    // 其他结构
    case string = "字符串"
    case set = "集合"
    case dictionary = "字典"
    
    var id: String { rawValue }
    
    var type: DataStructureType {
        switch self {
        case .array, .stack, .queue, .linkedList, .deque:
            return .linear
        case .binaryTree, .binarySearchTree, .avlTree, .bTree, .heap:
            return .tree
        case .graph, .directedGraph, .weightedGraph:
            return .graph
        case .hashTable, .hashSet, .hashMap:
            return .hash
        case .string, .set, .dictionary:
            return .other
        }
    }
    
    var description: String {
        switch self {
        case .array:
            return "数组是一种线性数据结构，在内存中连续存储相同类型的元素。它支持通过索引快速访问元素，时间复杂度为O(1)。"
        case .stack:
            return "栈是一种后进先出(LIFO)的线性数据结构。只允许在栈顶进行插入和删除操作，常用于函数调用、表达式求值等场景。"
        case .queue:
            return "队列是一种先进先出(FIFO)的线性数据结构。在队尾插入元素，在队头删除元素，常用于任务调度、消息处理等场景。"
        case .linkedList:
            return "链表是一种线性数据结构，由节点组成，每个节点包含数据和指向下一个节点的指针。插入和删除操作的时间复杂度为O(1)。"
        case .deque:
            return "双端队列是一种可以在两端进行插入和删除操作的线性数据结构。它结合了栈和队列的特点，提供了更灵活的操作。"
        case .binaryTree:
            return "二叉树是一种树形数据结构，每个节点最多有两个子节点。二叉树广泛应用于搜索、排序、表达式解析等领域。"
        case .binarySearchTree:
            return "二叉搜索树是一种特殊的二叉树，左子树的值小于根节点，右子树的值大于根节点。支持快速搜索、插入和删除操作。"
        case .avlTree:
            return "AVL树是一种自平衡二叉搜索树，任何节点的两个子树高度差不超过1。保证了最坏情况下O(log n)的时间复杂度。"
        case .bTree:
            return "B树是一种自平衡的搜索树，设计用于磁盘等外部存储设备。每个节点可以有多个子节点，减少了I/O操作次数。"
        case .heap:
            return "堆是一种特殊的树形数据结构，分为最大堆和最小堆。常用于优先队列、堆排序等场景，支持快速获取最大/最小值。"
        case .graph:
            return "图是由顶点和边组成的数据结构，用于表示对象之间的关系。图分为有向图和无向图，广泛应用于网络分析、路径查找等。"
        case .directedGraph:
            return "有向图是图的一种，边具有方向性。有向图用于表示单向关系，如网页链接、流程图等。"
        case .weightedGraph:
            return "加权图是图的边的权重值，用于表示距离、成本等。加权图广泛应用于最短路径算法、网络优化等场景。"
        case .hashTable:
            return "哈希表通过哈希函数将键映射到数组索引，实现快速的数据存取。理想情况下，插入、删除和查找操作的时间复杂度为O(1)。"
        case .hashSet:
            return "哈希集合是基于哈希表实现的集合数据结构，只存储唯一的元素。支持快速的插入、删除和查找操作，时间复杂度为O(1)。"
        case .hashMap:
            return "哈希映射是基于哈希表实现的键值对存储结构。通过键快速访问对应的值，支持高效的插入、删除和查找操作。"
        case .string:
            return "字符串是由字符组成的序列，是文本处理的基础数据结构。Swift中的字符串是Unicode兼容的，支持多种字符编码。"
        case .set:
            return "集合是无序的、不重复元素的集合。支持快速的成员检查、并集、交集、差集等操作，时间复杂度为O(1)。"
        case .dictionary:
            return "字典是键值对的集合，通过键快速访问对应的值。Swift中的字典基于哈希表实现，提供了高效的查找和插入操作。"
        }
    }
    
    var timeComplexity: String {
        switch self {
        case .array:
            return "访问: O(1), 搜索: O(n), 插入: O(n), 删除: O(n)"
        case .stack:
            return "访问: O(n), 搜索: O(n), 插入: O(1), 删除: O(1)"
        case .queue:
            return "访问: O(n), 搜索: O(n), 插入: O(1), 删除: O(1)"
        case .linkedList:
            return "访问: O(n), 搜索: O(n), 插入: O(1), 删除: O(1)"
        case .deque:
            return "访问: O(n), 搜索: O(n), 插入: O(1), 删除: O(1)"
        case .binaryTree:
            return "访问: O(n), 搜索: O(n), 插入: O(n), 删除: O(n)"
        case .binarySearchTree:
            return "访问: O(log n), 搜索: O(log n), 插入: O(log n), 删除: O(log n)"
        case .avlTree:
            return "访问: O(log n), 搜索: O(log n), 插入: O(log n), 删除: O(log n)"
        case .bTree:
            return "访问: O(log n), 搜索: O(log n), 插入: O(log n), 删除: O(log n)"
        case .heap:
            return "访问: O(1), 搜索: O(n), 插入: O(log n), 删除: O(log n)"
        case .graph:
            return "访问: O(V+E), 搜索: O(V+E), 插入: O(1), 删除: O(V+E)"
        case .directedGraph:
            return "访问: O(V+E), 搜索: O(V+E), 插入: O(1), 删除: O(V+E)"
        case .weightedGraph:
            return "访问: O(V+E), 搜索: O(V+E), 插入: O(1), 删除: O(V+E)"
        case .hashTable:
            return "访问: O(1), 搜索: O(1), 插入: O(1), 删除: O(1)"
        case .hashSet:
            return "访问: O(1), 搜索: O(1), 插入: O(1), 删除: O(1)"
        case .hashMap:
            return "访问: O(1), 搜索: O(1), 插入: O(1), 删除: O(1)"
        case .string:
            return "访问: O(1), 搜索: O(n), 插入: O(n), 删除: O(n)"
        case .set:
            return "访问: O(1), 搜索: O(1), 插入: O(1), 删除: O(1)"
        case .dictionary:
            return "访问: O(1), 搜索: O(1), 插入: O(1), 删除: O(1)"
        }
    }
    
    var spaceComplexity: String {
        switch self {
        case .array, .stack, .queue, .string:
            return "O(n)"
        case .linkedList, .deque:
            return "O(n)"
        case .binaryTree, .binarySearchTree, .avlTree, .bTree, .heap:
            return "O(n)"
        case .graph, .directedGraph, .weightedGraph:
            return "O(V+E)"
        case .hashTable, .hashSet, .hashMap, .set, .dictionary:
            return "O(n)"
        }
    }
    
    var codeExample: String {
        switch self {
        case .array:
            return """
// Swift 数组实现
struct ArrayExample {
    var elements: [Int] = []
    
    // 访问元素
    func access(index: Int) -> Int? {
        guard index >= 0 && index < elements.count else { return nil }
        return elements[index]
    }
    
    // 插入元素
    mutating func insert(element: Int, at index: Int) {
        elements.insert(element, at: index)
    }
    
    // 删除元素
    mutating func remove(at index: Int) {
        elements.remove(at: index)
    }
    
    // 搜索元素
    func search(element: Int) -> Int? {
        return elements.firstIndex(of: element)
    }
}

// 使用示例
var arrayExample = ArrayExample()
arrayExample.elements = [1, 2, 3, 4, 5]
print(arrayExample.access(index: 2)!) // 输出: 3
"""
        case .stack:
            return """
// Swift 栈实现
struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: T? {
        return elements.last
    }
    
    // 压栈
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // 出栈
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    // 栈大小
    var size: Int {
        return elements.count
    }
}

// 使用示例
var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.pop()!) // 输出: 3
print(stack.peek!) // 输出: 2
"""
        case .queue:
            return """
// Swift 队列实现
struct Queue<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var front: T? {
        return elements.first
    }
    
    // 入队
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    // 出队
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    // 队列大小
    var size: Int {
        return elements.count
    }
}

// 使用示例
var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
print(queue.dequeue()!) // 输出: 1
print(queue.front!)    // 输出: 2
"""
        case .linkedList:
            return """
// Swift 链表实现
class ListNode<T> {
    var value: T
    var next: ListNode<T>?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

struct LinkedList<T> {
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // 在链表尾部添加节点
    mutating func append(value: T) {
        let newNode = ListNode(value: value)
        
        if tail == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    // 在链表头部添加节点
    mutating func prepend(value: T) {
        let newNode = ListNode(value: value)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    // 删除指定值的节点
    mutating func remove(value: T) {
        if head?.value == value {
            head = head?.next
            if head == nil {
                tail = nil
            }
            return
        }
        
        var current = head
        while current?.next != nil {
            if current?.next?.value == value {
                current?.next = current?.next?.next
                if current?.next == nil {
                    tail = current
                }
                return
            }
            current = current?.next
        }
    }
    
    // 搜索节点
    func search(value: T) -> Bool {
        var current = head
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
}

// 使用示例
var linkedList = LinkedList<Int>()
linkedList.append(value: 1)
linkedList.append(value: 2)
linkedList.append(value: 3)
print(linkedList.search(value: 2)) // 输出: true
linkedList.remove(value: 2)
print(linkedList.search(value: 2)) // 输出: false
"""
        case .binarySearchTree:
            return """
// Swift 二叉搜索树实现
class TreeNode<T: Comparable> {
    var value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class BinarySearchTree<T: Comparable> {
    private var root: TreeNode<T>?
    
    // 插入节点
    func insert(value: T) {
        root = insertNode(root, value: value)
    }
    
    private func insertNode(_ node: TreeNode<T>?, value: T) -> TreeNode<T> {
        if node == nil {
            return TreeNode(value: value)
        }
        
        if value < node!.value {
            node?.left = insertNode(node?.left, value: value)
        } else if value > node!.value {
            node?.right = insertNode(node?.right, value: value)
        }
        
        return node!
    }
    
    // 搜索节点
    func search(value: T) -> Bool {
        return searchNode(root, value: value)
    }
    
    private func searchNode(_ node: TreeNode<T>?, value: T) -> Bool {
        if node == nil {
            return false
        }
        
        if value == node!.value {
            return true
        } else if value < node!.value {
            return searchNode(node?.left, value: value)
        } else {
            return searchNode(node?.right, value: value)
        }
    }
    
    // 中序遍历
    func inOrderTraversal() -> [T] {
        var result: [T] = []
        inOrderTraversalHelper(root, &result)
        return result
    }
    
    private func inOrderTraversalHelper(_ node: TreeNode<T>?, _ result: inout [T]) {
        guard let node = node else { return }
        
        inOrderTraversalHelper(node.left, &result)
        result.append(node.value)
        inOrderTraversalHelper(node.right, &result)
    }
}

// 使用示例
let bst = BinarySearchTree<Int>()
bst.insert(value: 5)
bst.insert(value: 3)
bst.insert(value: 7)
bst.insert(value: 1)
bst.insert(value: 9)

print(bst.search(value: 7)) // 输出: true
print(bst.inOrderTraversal()) // 输出: [1, 3, 5, 7, 9]
"""
        case .hashMap:
            return """
// Swift 哈希映射实现
struct HashMap<K: Hashable, V> {
    private var storage: [[(key: K, value: V)]] = []
    private let capacity: Int
    private var size: Int = 0
    
    init(capacity: Int = 16) {
        self.capacity = capacity
        self.storage = Array(repeating: [], count: capacity)
    }
    
    // 哈希函数
    private func hash(_ key: K) -> Int {
        return abs(key.hashValue) % capacity
    }
    
    // 插入键值对
    mutating func insert(key: K, value: V) {
        let index = hash(key)
        
        // 检查是否已存在该键
        for i in 0..<storage[index].count {
            if storage[index][i].key == key {
                storage[index][i].value = value
                return
            }
        }
        
        storage[index].append((key: key, value: value))
        size += 1
    }
    
    // 获取值
    func get(key: K) -> V? {
        let index = hash(key)
        
        for (k, v) in storage[index] {
            if k == key {
                return v
            }
        }
        
        return nil
    }
    
    // 删除键值对
    mutating func remove(key: K) {
        let index = hash(key)
        
        for i in 0..<storage[index].count {
            if storage[index][i].key == key {
                storage[index].remove(at: i)
                size -= 1
                return
            }
        }
    }
    
    // 检查是否包含键
    func contains(key: K) -> Bool {
        return get(key) != nil
    }
    
    // 获取所有键
    func keys() -> [K] {
        var allKeys: [K] = []
        for bucket in storage {
            for (key, _) in bucket {
                allKeys.append(key)
            }
        }
        return allKeys
    }
    
    // 获取大小
    var count: Int {
        return size
    }
}

// 使用示例
var hashMap = HashMap<String, Int>()
hashMap.insert(key: "apple", value: 1)
hashMap.insert(key: "banana", value: 2)
hashMap.insert(key: "orange", value: 3)

print(hashMap.get(key: "banana")!) // 输出: 2
print(hashMap.contains(key: "apple")) // 输出: true
hashMap.remove(key: "apple")
print(hashMap.contains(key: "apple")) // 输出: false
"""
        default:
            return """
// \(rawValue) 实现示例
// 这是 \(rawValue) 的基本实现框架
struct \(rawValue.replacingOccurrences(of: " ", with: ""))<T> {
    private var storage: [T] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var count: Int {
        return storage.count
    }
    
    mutating func add(_ element: T) {
        storage.append(element)
    }
    
    mutating func remove(_ element: T) {
        if let index = storage.firstIndex(of: element as! Equatable) {
            storage.remove(at: index)
        }
    }
    
    func contains(_ element: T) -> Bool {
        return storage.contains(where: { $0 as! Equatable == element as! Equatable })
    }
}

// 使用示例
var dataStructure = \(rawValue.replacingOccurrences(of: " ", with: ""))<Int>()
dataStructure.add(1)
dataStructure.add(2)
print(dataStructure.contains(2)) // true
"""
        }
    }
    
    var iOSUsage: String {
        switch self {
        case .array:
            return """
## 在 iOS 开发中的应用

### 1. 数据存储
- **TableView/CollectionView 数据源**: 数组是最常用的数据源类型
- **配置数组**: 存储单元格配置信息、图片等
- **本地缓存**: 临时存储从网络获取的数据

### 2. 实际应用场景
```swift
// TableView 数据源
class ViewController: UIViewController, UITableViewDataSource {
    var items: [String] = ["Item 1", "Item 2", "Item 3"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
```

### 3. 优势
- **内存连续**: 访问速度快，时间复杂度 O(1)
- **类型安全**: Swift 数组是类型安全的
- **易于使用**: 提供丰富的 API

### 4. 注意事项
- 插入和删除操作较慢 O(n)
- 大数组可能影响性能
- 考虑使用懒加载优化内存使用
"""
        case .stack:
            return """
## 在 iOS 开发中的应用

### 1. 导航控制器
- **UINavigationController**: 使用栈管理视图控制器
- **pushViewController**: 压栈操作
- **popViewController**: 出栈操作

### 2. 实际应用场景
```swift
// 导航栈示例
let navigationController = UINavigationController()
let viewController1 = UIViewController()
let viewController2 = UIViewController()

// 压栈
navigationController.pushViewController(viewController1, animated: true)
navigationController.pushViewController(viewController2, animated: true)

// 出栈
navigationController.popViewControllerAnimated(true)

// 查看栈内容
print(navigationController.viewControllers.count)
```

### 3. 其他应用
- **撤销操作**: 记录操作历史
- **表达式求值**: 数学表达式的计算
- **深度优先搜索**: 图和树的遍历算法

### 4. 优势
- **LIFO 特性**: 后进先出的特性适合特定场景
- **操作简单**: 只在栈顶进行操作
- **内存效率**: 不需要频繁的内存分配
"""
        case .queue:
            return """
## 在 iOS 开发中的应用

### 1. 操作队列
- **OperationQueue**: 管理异步操作的队列
- **DispatchQueue**: GCD 中的队列概念
- **任务调度**: 按顺序执行任务

### 2. 实际应用场景
```swift
// DispatchQueue 示例
let queue = DispatchQueue(label: "com.example.queue")

// 异步执行任务
queue.async {
    print("Task 1")
}

queue.async {
    print("Task 2")
}

// 主队列执行
DispatchQueue.main.async {
    print("Main queue task")
}
```

### 3. 其他应用
- **消息处理**: 消息队列的处理
- **广度优先搜索**: 图和树的遍历算法
- **缓冲区管理**: 生产者-消费者模式

### 4. 优势
- **FIFO 特性**: 先进先出的特性保证公平性
- **任务管理**: 很好的任务调度机制
- **线程安全**: 提供线程安全的操作
"""
        case .dictionary:
            return """
## 在 iOS 开发中的应用

### 1. 数据存储
- **UserDefaults**: 使用字典存储用户偏好设置
- **JSON 解析**: JSON 数据通常解析为字典
- **API 响应**: 网络请求的响应数据

### 2. 实际应用场景
\\`\\`\\`swift
// UserDefaults 示例
let defaults = UserDefaults.standard
defaults.set("John", forKey: "name")
defaults.set(25, forKey: "age")

let name = defaults.string(forKey: "name")
let age = defaults.integer(forKey: "age")

// JSON 解析示例
let jsonString = "{\\"name\\": \\"John\\", \\"age\\": 25, \\"city\\": \\"New York\\"}"

if let data = jsonString.data(using: .utf8) {
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    if let dict = json as? [String: Any] {
        print(dict["name"] as! String)
    }
}
\\`\\`\\`

### 3. 其他应用
- **配置管理**: 应用配置信息的存储
- **数据映射**: 对象属性映射
- **缓存系统**: 键值对缓存

### 4. 优势
- **快速查找**: 平均时间复杂度 O(1)
- **灵活性**: 可以存储不同类型的值
- **易于使用**: 语法简洁明了
"""
        default:
            return """
## 在 iOS 开发中的应用

### 1. 基本应用
- **数据存储**: 作为基础数据结构使用
- **算法实现**: 各种算法的基础
- **性能优化**: 选择合适的数据结构优化性能

### 2. 实际应用场景
\(rawValue) 在 iOS 开发中有多种应用场景，包括数据存储、算法实现、性能优化等。

### 3. 优势
- **适合特定场景**: 根据具体需求选择合适的数据结构
- **性能优化**: 正确选择数据结构可以显著提升性能
- **代码清晰**: 使用合适的数据结构使代码更易理解

### 4. 注意事项
- 根据具体需求选择合适的数据结构
- 考虑时间复杂度和空间复杂度的权衡
- 注意内存使用和性能的影响
"""
        }
    }
}