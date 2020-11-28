//
//  LinkedListTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

public struct LinkedListTest {
    
    public static func test() {
        
        example(name: "LinkedList CustomStringConvertible") {
            
            let linkedList = LinkedList<Int>()
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList ExpressibleByArrayLiteral") {
            
            let linkedList: LinkedList = [1, 2, 3, 4, 5]
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Push") {
            
            var linkedList = LinkedList<Int>()
            linkedList.push(3)
            linkedList.push(2)
            linkedList.push(1)
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Pop") {
            
            var linkedList = LinkedList<Int>()
            linkedList.push(3)
            linkedList.push(2)
            linkedList.push(1)
            linkedList.pop()
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Append") {
            
            var linkedList = LinkedList<Int>()
            linkedList.append(1)
            linkedList.append(2)
            linkedList.append(3)
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Remove Last") {
            
            var linkedList = LinkedList<Int>()
            linkedList.append(1)
            linkedList.append(2)
            linkedList.append(3)
            linkedList.removeLast()
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Remove All") {
            
            var linkedList = LinkedList<Int>()
            linkedList.append(1)
            linkedList.append(2)
            linkedList.append(3)
            linkedList.removeAll()
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Insert At") {
            
            var linkedList = LinkedList<Int>()
            linkedList.insert(0, at: 0)
            linkedList.insert(2, at: 1)
            linkedList.insert(1, at: 1)
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Remove At") {
            
            var linkedList = LinkedList<Int>()
            linkedList.insert(0, at: 0)
            linkedList.insert(2, at: 1)
            linkedList.insert(1, at: 1)
            linkedList.remove(at: 2)
            
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
        }
        
        example(name: "LinkedList Value At") {
            
            var linkedList = LinkedList<Int>()
            linkedList.insert(0, at: 0)
            linkedList.insert(2, at: 1)
            linkedList.insert(1, at: 1)
        
            print(linkedList)
            print("count: \(linkedList.count)")
            print("isEmpty: \(linkedList.isEmpty)")
            print("element: \(linkedList.element(at: 1)!)")
        }
        
        example(name: "LinkedList Copy On Write") {
            
            let linkedList1: LinkedList = [1, 2, 3]
            var linkedList2 = linkedList1
            linkedList2.removeLast()
        
            print(linkedList2)
            print(linkedList1)
        }
    }
}
