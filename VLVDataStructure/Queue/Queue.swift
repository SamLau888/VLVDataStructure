//
//  Queue.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

/**
 *
 *  Queue，内部使用双向链表实现的双端队列，enqueue、dequeue操作都为O(1)时间复杂度。
 *
 */

public enum Direction {
    case front
    case rear
}

public struct Queue<Element> {
    
    private var linkedList = LinkedList<Element>()
    
    public var count: Int {
        linkedList.count
    }
    
    public var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    public var peek: Element? {
        linkedList.first
    }
    
    public mutating func enqueue(_ element: Element) {
        enqueue(element, .rear)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        dequeue(.front)
    }
    
    public mutating func enqueue(_ element: Element, _ direction: Direction) {
        switch direction {
        case .front:
            linkedList.append(element)
        case .rear:
            linkedList.push(element)
        }
    }
    
    @discardableResult
    public mutating func dequeue(_ direction: Direction) -> Element? {
        switch direction {
        case .front:
            return linkedList.removeLast()
        case .rear:
            return linkedList.pop()
        }
    }
}

extension Queue: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        for element in elements {
            enqueue(element)
        }
    }
}

extension Queue: CustomStringConvertible {
    
    public var description: String {
        "\(Self.self): |Rear| \(linkedList.customDesc) |Front|"
    }
}
