//
//  Heap.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/25.
//

/**
 *
 *  Heap，内部使用Array实现的二叉堆，insert、remove操作都为O(logn)，search为O(n)，peek为O(1)。
 *
 */

public struct Heap<Element: Equatable> {
    
    private let sort: (Element, Element) -> Bool
    private var elements: [Element]
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var count: Int {
        elements.count
    }
    
    public var peek: Element? {
        elements.first
    }
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            // stride改变索引函数
            // stride(from:3, to:0, by:-1)
            // 3，2，1
            // 之所以从 elements.count / 2 - 1 开始到 0，是因为 elements.count / 2 - 1之后的全是leaf，调整并没有意义（需要调整paraent）
            // 倒序开始因为从下到上才更有意义，操作步骤会更少
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    public mutating func insert(_ element: Element) {
        
        // 直接加到last
        elements.append(element)
        
        // 值在leaf，需要向上调整（值大上浮）
        siftUp(from: elements.count - 1)
    }
    
    @discardableResult
    public mutating func remove() -> Element? {
        
        guard !isEmpty else {
            return nil
        }
        
        // 1、优先将index为0的值与lastIndex的值替换
        elements.swapAt(0, count - 1)
        
        // 3、第1步交换的值在root，需要向下调整（值小下沉）
        defer {
            siftDown(from: 0)
        }
        
        // 2、删除lastIndex的值
        return elements.removeLast()
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> Element? {
    
        guard index < elements.count && index > 0 else {
            return nil
        }
        
        if index == elements.count - 1 {
            
            return elements.removeLast()
        }
        else {
            
            // 1、优先将index的值与lastIndex的值替换
            elements.swapAt(index, elements.count - 1)
            
            // 3、第1步交换的值在index，可能需要向下后者向上调整（值小下沉、值大上浮）
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }

            // 2、删除lastIndex的值
            return elements.removeLast()
        }
    }
    
    public func index(_ element: Element) -> Int? {
        index(of: element, startingAt: 0)
    }
    
    private mutating func siftUp(from index: Int) {
        
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        // 假设传入如的sort为 >
        // 如果child的值大于parent的值，持续循环交换值
        // child等于0的时候，说明已经回到root循环结束
        while child > 0 && sort(elements[child], elements[parent]) {
            
            elements.swapAt(child, parent)
            
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        
        var parent = index
        
        while true {
            
            // 根据parent获取left、right
            // parent会在循环后新指向
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            // 只有在确定了left、right后才能确定current
            // parent会在循环后新指向，current也需要跟着调整
            var current = parent
            
            // 假设传入如的sort为 >
            // left内部控制永远不会为负，无需检验负数
            // 如果left的值大于current的值，current下移指向left（准备交换值）
            if left < count && sort(elements[left], elements[current]) {
                current = left
            }
            
            // 假设传入如的sort为 >
            // right内部控制永远不会为负，无需检验负数
            // 如果right的值大于current的值，current下移指向right（准备交换值）
            if right < count && sort(elements[right], elements[current]) {
                current = right
            }
            
            // left、right的值都不大于current的值
            // 此时必然current等于parent，无需交换直接返回
            if current == parent {
                return
            }

            // 交换parent与current的值
            elements.swapAt(parent, current)
            
            // parent下移指向current（准备下一轮切换）
            parent = current
        }
    }
    
    private func index(of element: Element, startingAt i: Int) -> Int? {
        
        if i >= count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }
    
    private func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    private func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    private func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
}

extension Heap: CustomStringConvertible {
    
    public var description: String {
        "\(elements)"
    }
}
