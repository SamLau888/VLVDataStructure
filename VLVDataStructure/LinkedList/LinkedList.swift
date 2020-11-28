//
//  LinkedList.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

/**
 *
 *  LinkedList，内部使用双向链表实现，为了能在首位添加、删除操作都为O(1)时间复杂度。
 *
 */

fileprivate class LinkedListNode<Element>: CustomStringConvertible {
    
    var element: Element
    var next: LinkedListNode<Element>?
    weak var prev: LinkedListNode<Element>?

    convenience init(element: Element) {
        self.init(element: element, next: nil, prev: nil)
    }
    
    convenience init(element: Element, next: LinkedListNode<Element>?) {
        self.init(element: element, next: next, prev: nil)
    }
    
    convenience init(element: Element, prev: LinkedListNode<Element>?) {
        self.init(element: element, next: nil, prev: prev)
    }
    
    init(element: Element, next: LinkedListNode<Element>?, prev: LinkedListNode<Element>?) {
        self.element = element
        self.next = next
        self.prev = prev
    }
    
    deinit {
        print("deinit \(element)")
    }
}

fileprivate extension LinkedListNode {
    
    var description: String {
        "\(element)"
    }
}

public struct LinkedList<Element> {
    
    private var head: LinkedListNode<Element>?
    private var tail: LinkedListNode<Element>?
    
    public private(set) var count: Int = 0
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Element? {
        head?.element
    }
    
    public var last: Element? {
        tail?.element
    }
    
    public mutating func push(_ element: Element) {
        copyNodes()
        
        head = LinkedListNode(element: element, next: head)
        head?.next?.prev = head
        
        if tail == nil {
            tail = head
        }
        
        count += 1
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        copyNodes()
        
        guard !isEmpty else {
            return nil
        }
        
        defer {
            
            head = head!.next
            
            if head == nil {
                tail = nil
            }
            
            count -= 1
        }
        
        return head!.element
    }
    
    public mutating func append(_ element: Element) {
        copyNodes()
        
        guard !isEmpty else {
            push(element)
            return
        }
        
        tail!.next = LinkedListNode(element: element, prev: tail)
        tail = tail!.next
        
        count += 1
    }
    
    @discardableResult
    public mutating func removeLast() -> Element? {
        copyNodes()
        
        guard !isEmpty else {
            return nil
        }
        
        guard head !== tail else {
            return pop()
        }
         
        defer {
            
            tail = tail!.prev
            tail!.next = nil
            
            count -= 1
        }
        
        return tail!.element
    }
    
    public mutating func insert(_ element: Element, at index: Int) {
        copyNodes()
        
        guard index > -1 && index <= count else {
            return;
        }
        
        if index == 0 {
            push(element)
            return
        }
        
        if index == count {
            append(element)
            return
        }
        
        let indexNode = node(at: index)!
        let preNode = indexNode.prev!
        let newNode = LinkedListNode(element: element, next: indexNode, prev: preNode)
        indexNode.prev = newNode
        preNode.next = newNode
        
        count += 1
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
        copyNodes()
        
        guard !isEmpty else {
            return nil
        }
        
        guard index > -1 && index < count else {
            return nil;
        }
        
        if index == 0 {
            return pop()
        }
        
        if index == count - 1 {
            return removeLast()
        }
        
        let indexNode = node(at: index)!
        
        defer {
            
            let prevNode = indexNode.prev!
            prevNode.next = prevNode.next!.next
            prevNode.next!.prev = prevNode
            
            count -= 1
        }
        
        return indexNode.element
    }
    
    public mutating func removeAll() {
        copyNodes()
        
        head = nil
        tail = nil
        count = 0
    }
    
    public func element(at index: Int) -> Element? {
        return node(at: index)?.element
    }
    
    // MARK: Private Mehtods
    private func node(at index: Int) -> LinkedListNode<Element>? {
        
        guard !isEmpty else {
            return nil;
        }
        
        guard index > -1 && index < count else {
            return nil;
        }
        
        if index < (count / 2) {
            
            var currentIndex = 0
            var currentNode = head

            while currentIndex < index {
                currentNode = currentNode?.next
                currentIndex += 1
            }

            return currentNode
        }
        else {
            
            var currentIndex = count - 1
            var currentNode = tail

            while currentIndex > index {
                currentNode = currentNode?.prev
                currentIndex -= 1
            }

            return currentNode
        }
    }
    
    // 写时复制（Copy On Write）
    private mutating func copyNodes() {
        
        // 判断是否有多个引用
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }

        guard var oldNode = head else {
            return
        }

        head = LinkedListNode(element: oldNode.element)

        var current = head

        while let nextOldNode = oldNode.next {

            current?.next = LinkedListNode(element: nextOldNode.element, prev: current)
            current = current?.next

            oldNode = nextOldNode
        }

        tail = current
    }
}

extension LinkedList: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Element...) {
        for element in elements {
            append(element)
        }
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        "\(Self.self): Head| \(customDesc) |Tail"
    }
    
    var customDesc: String {
        
        var desc =  head != nil ? "\(head!)" : "nil"
        
        var currentNode = head

        while let nextNode = currentNode?.next {
            
            desc += " ←→ \(nextNode)"
            
            currentNode = nextNode
        }
        
        return desc
    }
}
