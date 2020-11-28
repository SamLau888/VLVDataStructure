//
//  HeepTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/26.
//

public struct HeepTest {
    
    public static func test() {
        
        
        example(name: "Heap CustomStringConvertible") {
            
            let heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
            print(heap)
        }
        
        example(name: "Trie Insert") {
            
            var heap = Heap(sort: <, elements: [3, 2, 1])
            heap.insert(0)
            print(heap)
            
        }
        
        example(name: "Trie Remove") {
            
            var heap = Heap(sort: <, elements: [3, 2, 1])
            heap.insert(0)
            print(heap)
            
            heap.remove()
            print(heap)
        }
        
        example(name: "Trie Remove Index") {
            
            var heap = Heap(sort: <, elements: [3, 2, 1])
            heap.insert(0)
            print(heap)
            
            heap.remove(at: 1)
            print(heap)
        }
        
        example(name: "Trie Index") {
            
            let heap = Heap(sort: <, elements: [3, 2, 1])
            print(heap)
            print(heap.index(3)!)
        }
    }
}
