//
//  PriorityQueue.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/27.
//

public struct PriorityQueue<Element: Equatable> {

    private var heap: Heap<Element>
    
    public var count: Int {
        heap.count
    }
    
    public var isEmpty: Bool {
        heap.isEmpty
    }
    
    public var peek: Element? {
        heap.peek
    }
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
      heap = Heap(sort: sort, elements: elements)
    }
    
    public mutating func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        heap.remove()
    }
}

extension PriorityQueue: CustomStringConvertible {
    
    public var description: String {
        "\(Self.self): |Front| \(heap) |Rear|"
    }
}
