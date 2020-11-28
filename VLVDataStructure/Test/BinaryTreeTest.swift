//
//  binaryTreeTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/25.
//

public struct BinaryTreeTest {
    
    public static func test() {
        
        example(name: "BinaryTree CustomStringConvertible") {
            
            let binaryTree = BinaryTree<Int>()
            
            print(binaryTree)
            print("isEmpty: \(binaryTree.isEmpty)")
        }
        
        example(name: "BinaryTree ExpressibleByArrayLiteral") {
            
            let binaryTree: BinaryTree = [0, 1, 2, 3, 4, 5]
            
            print(binaryTree)
            print("isEmpty: \(binaryTree.isEmpty)")
        }
        
        example(name: "BinaryTree Insert") {
            
            var binaryTree = BinaryTree<Int>()
            binaryTree.insert(3)
            binaryTree.insert(1)
            binaryTree.insert(4)
            binaryTree.insert(0)
            binaryTree.insert(2)
            binaryTree.insert(5)
            
            print(binaryTree)
            print("isEmpty: \(binaryTree.isEmpty)")
        }
        
        example(name: "BinaryTree Remove") {
            
            var binaryTree = BinaryTree<Int>()
            binaryTree.insert(3)
            binaryTree.insert(1)
            binaryTree.insert(4)
            binaryTree.insert(0)
            binaryTree.insert(2)
            binaryTree.insert(5)
            print(binaryTree)
            
            binaryTree.remove(2)
            print("\n删除叶节点（2）: \(binaryTree)")
            
            binaryTree.insert(2)
            binaryTree.remove(4)
            print("\n删除度为1的节点（4）: \(binaryTree)")
            
            binaryTree.insert(4)
            binaryTree.remove(1)
            print("\n删除度为2的节点（1）: \(binaryTree)")
        }
        
        example(name: "BinaryTree Remove Rebalance") {

            var binaryTree = BinaryTree<Int>()
            binaryTree.insert(15)
            binaryTree.insert(10)
            binaryTree.insert(16)
            binaryTree.insert(18)
            print(binaryTree)
            binaryTree.remove(10)
            print(binaryTree)
        }
        
        example(name: "BinaryTree Remove All") {
            
            var binaryTree = BinaryTree<Int>()
            binaryTree.insert(3)
            binaryTree.insert(1)
            binaryTree.insert(4)
            binaryTree.insert(0)
            binaryTree.insert(2)
            binaryTree.insert(5)
            print(binaryTree)
            
            binaryTree.removeAll()
            print(binaryTree)
        }
        
        example(name: "BinaryTree Traverse") {
            
            var binaryTree = BinaryTree<Int>()
            binaryTree.insert(3)
            binaryTree.insert(1)
            binaryTree.insert(4)
            binaryTree.insert(0)
            binaryTree.insert(2)
            binaryTree.insert(5)
            
            print(binaryTree)
            print("Traverse Level:")
            binaryTree.traverseLevel { (element, _) in
                print(element)
            }
            
            print("\nTraverse Pre Order:")
            binaryTree.traversePreOrder { (element, _) in
                print(element)
            }
            
            print("\nTraverse In Order:")
            binaryTree.traverseInOrder { (element, _) in
                print(element)
            }
            
            print("\nTraverse Post Order:")
            binaryTree.traversePostOrder { (element, _) in
                print(element)
            }
            
            print()
        }
    }
}
