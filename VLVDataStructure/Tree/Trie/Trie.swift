//
//  Trie.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/25.
//

/**
 *
 *  Trie，内部使用多叉树实现，insert、remove、contains操作都为O(k)。
 *
 */

fileprivate class TrieNode<Element: Hashable> {
    
    var element: Element?
    weak var parent: TrieNode<Element>?
    var children: [Element: TrieNode<Element>] = [:]
    
    var isTerminating = false
    
    init(element: Element?, parent: TrieNode<Element>?) {
        self.element = element
        self.parent = parent
    }
}

public struct Trie<Elements: Collection & Hashable> where Elements.Element: Hashable {
    
    private var root = TrieNode<Elements.Element>(element: nil, parent: nil)
    private var collections: Set<Elements> = []
    
    public var count: Int {
        collections.count
    }
    
    public var isEmpty: Bool {
        collections.isEmpty
    }
    
    public mutating func insert(_ elements: Elements) {
      
        var current = root
    
        for element in elements {

            if current.children[element] == nil {
                current.children[element] = TrieNode<Elements.Element>(element: element, parent: current)
            }
            
            current = current.children[element]!
        }
        
        if current.isTerminating {
            return
        }
        else {
            current.isTerminating = true
            collections.insert(elements)
        }
    }
    
    public mutating func remove(_ elements: Elements) {

        var current = root
        
        for element in elements {
            
            guard let child = current.children[element] else {
                return
            }
            
            current = child
        }
        
        guard current.isTerminating else {
            return
        }
    
        current.isTerminating = false
        collections.remove(elements)
      
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.element!] = nil
            current = parent
        }
    }
    
    public mutating func removeAll() {
        root.children.removeAll()
        collections.removeAll()
    }
    
    public func contains(_ elements: Elements) -> Bool {
        
        var current = root
        
        for element in elements {
            
            guard let child = current.children[element] else {
                return false
            }
            
            current = child
        }
        
        return current.isTerminating
    }
}

extension Trie where Elements: RangeReplaceableCollection {
    
    public func collections(startingWith prefix: Elements) -> [Elements] {

        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            
            current = child
        }
        
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: Elements, after node: TrieNode<Elements.Element>) -> [Elements] {
        
        var results: [Elements] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
    
        for child in node.children.values {
            
            var prefix = prefix
            prefix.append(child.element!)
            
            results += collections(startingWith: prefix, after: child)
        }
        
        return results
    }
}

extension Trie: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elementsArray: Elements...) {
        for elements in elementsArray {
            insert(elements)
        }
    }
}

extension Trie: CustomStringConvertible {
    
    public var description: String {
        "\(collections)"
    }
}
