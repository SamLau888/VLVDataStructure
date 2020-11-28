//
//  PriorityQueueTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/27.
//

public struct PriorityQueueTest {
    
    public static func test() {
        
        example(name: "PriorityQueue CustomStringConvertible") {
            
            let queue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
            print(queue)
        }
        
        example(name: "PriorityQueue Enqueue") {
            
            var queue = PriorityQueue<Int>(sort: >)
            queue.enqueue(0)
            queue.enqueue(2)
            queue.enqueue(1)
            queue.enqueue(5)
            queue.enqueue(3)
            print(queue)
        }
        
        example(name: "PriorityQueue Dequeue") {
            
            var queue = PriorityQueue<Int>(sort: >)
            queue.enqueue(0)
            queue.enqueue(2)
            queue.enqueue(1)
            queue.enqueue(5)
            queue.enqueue(3)
            print(queue)
            
            queue.dequeue()
            print(queue)
            queue.dequeue()
            print(queue)
        }
    }
}
