//
//  StackTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

public struct StackTest {
    
    public static func test() {
        
        example(name: "Stack CustomStringConvertible") {
            
            let stack = Stack<Int>()
            
            print(stack)
            print("count: \(stack.count)")
            print("isEmpty: \(stack.isEmpty)")
            print("peek: \(stack.peek != nil ? "\(stack.peek!)" : "nil")")
        }
        
        example(name: "Stack ExpressibleByArrayLiteral") {
            
            let stack: Stack = [1, 2, 3, 4, 5]
            
            print(stack)
            print("count: \(stack.count)")
            print("isEmpty: \(stack.isEmpty)")
            print("peek: \(stack.peek != nil ? "\(stack.peek!)" : "nil")")
        }

        example(name: "Stack Push") {
            
            var stack = Stack<Int>()
            stack.push(3)
            stack.push(2)
            stack.push(1)
            stack.push(0)
            
            print(stack)
            print("count: \(stack.count)")
            print("isEmpty: \(stack.isEmpty)")
            print("peek: \(stack.peek != nil ? "\(stack.peek!)" : "nil")")
        }

        example(name: "Stack Pop") {
            
            var stack = Stack<Int>()
            stack.push(3)
            stack.push(2)
            stack.push(1)
            stack.push(0)
            stack.pop()
            
            print(stack)
            print("count: \(stack.count)")
            print("isEmpty: \(stack.isEmpty)")
            print("peek: \(stack.peek != nil ? "\(stack.peek!)" : "nil")")
        }

        example(name: "Stack Remove All") {
            
            var stack = Stack<Int>()
            stack.push(3)
            stack.push(2)
            stack.push(1)
            stack.push(0)
            stack.removeAll()
            
            print(stack)
            print("count: \(stack.count)")
            print("isEmpty: \(stack.isEmpty)")
            print("peek: \(stack.peek != nil ? "\(stack.peek!)" : "nil")")
        }
    }
}
