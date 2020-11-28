//
//  Stack.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

/**
 * 
 *  Stack，内部使用双向链表实现，push、pop 操作都为O(1)时间复杂度。
 *
 */

public struct Stack<Element> {
    
    private var linkedList = LinkedList<Element>()
    
    public var count: Int {
        linkedList.count
    }
    
    public var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    public var peek: Element? {
        linkedList.last
    }
    
    public mutating func push(_ element: Element) {
        linkedList.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        linkedList.removeLast()
    }
    
    public mutating func removeAll() {
        linkedList.removeAll()
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        for element in elements {
            push(element)
        }
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        "\(Self.self): |Bottom| \(linkedList.customDesc) |Top|"
    }
}


