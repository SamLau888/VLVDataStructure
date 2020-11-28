//
//  QueueTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

public struct QueueTest {
    
    public static func test() {
        
        example(name: "Queue CustomStringConvertible") {
            
            let queue = Queue<Int>()
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue ExpressibleByArrayLiteral") {
            
            let queue: Queue = [1, 2, 3, 4, 5]
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Equeue") {
            
            var queue = Queue<Int>()
            queue.enqueue(1)
            queue.enqueue(2)
            queue.enqueue(3)
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Dequeue") {
            
            var queue = Queue<Int>()
            queue.enqueue(1)
            queue.enqueue(2)
            queue.enqueue(3)
            queue.dequeue()
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Rear Equeue") {
            
            var queue = Queue<Int>()
            queue.enqueue(1, .rear)
            queue.enqueue(2, .rear)
            queue.enqueue(3, .rear)
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Front Equeue") {
            
            var queue = Queue<Int>()
            queue.enqueue(1, .front)
            queue.enqueue(2, .front)
            queue.enqueue(3, .front)
            
            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Front Dequeue") {

            var queue = Queue<Int>()
            queue.enqueue(1, .rear)
            queue.enqueue(2, .rear)
            queue.enqueue(3, .rear)
            queue.dequeue(.front)

            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
        
        example(name: "Queue Rear Dequeue") {

            var queue = Queue<Int>()
            queue.enqueue(1, .rear)
            queue.enqueue(2, .rear)
            queue.enqueue(3, .rear)
            queue.dequeue(.rear)

            print(queue)
            print("count: \(queue.count)")
            print("isEmpty: \(queue.isEmpty)")
            print("peek: \(queue.peek != nil ? "\(queue.peek!)" : "nil")")
        }
    }
}
