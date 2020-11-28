//
//  BinaryTree.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/25.
//

/**
 *
 *  BinaryTree，内部使用AVLTree实现的平衡二叉树，insert、remove、contains操作都为O(logn)时间复杂度。
 *
 */

fileprivate class BinaryTreeNode<Element>: CustomStringConvertible {

    var element: Element
    var leftChild: BinaryTreeNode<Element>?
    var rightChild: BinaryTreeNode<Element>?
    
    fileprivate var height: Int = 0
    
    // 平衡因子
    var balanceFactor: Int {
        leftHeight - rightHeight
    }
    
    var leftHeight: Int {
        leftChild?.height ?? -1
    }
    
    var rightHeight: Int {
        rightChild?.height ?? -1
    }
    
    init(element: Element) {
        self.element = element
    }
    
    deinit {
        print("deinit \(element)")
    }
}

fileprivate extension BinaryTreeNode {
    
    var min: BinaryTreeNode {
        leftChild?.min ?? self
    }
}

fileprivate extension BinaryTreeNode {
    
    var description: String {
        "\(element)"
    }
}

public struct BinaryTree<Element: Comparable> {

    private var root: BinaryTreeNode<Element>?
    
    public var isEmpty: Bool {
        root == nil
    }
    
    public mutating func insert(_ element: Element) {
        root = insert(from: root, element: element)
    }
    
    public mutating func remove(_ element: Element) {
        root = remove(from: root, element: element)
    }
    
    public mutating func removeAll() {
        root = nil
    }
    
    public func contains(_ element: Element) -> Bool {
        
        var currentNode = root
        
        while let node = currentNode {
            
            if element == node.element {
                return true
            }
            
            if element < node.element {
                currentNode = node.leftChild
            }
            else {
                currentNode = node.rightChild
            }
        }
        
        return false
    }
    
    private func insert(from node: BinaryTreeNode<Element>?, element: Element) -> BinaryTreeNode<Element> {
       
        guard let node = node else {
            return BinaryTreeNode(element: element)
        }

        if element < node.element {
            node.leftChild = insert(from: node.leftChild, element: element)
        }
        else {
            node.rightChild = insert(from: node.rightChild, element: element)
        }

        let balancedNode = balanced(node)
        balancedNode.height = 1 + max(balancedNode.leftHeight, balancedNode.rightHeight)
        return balancedNode
    }
    
    private func remove(from node: BinaryTreeNode<Element>?, element: Element) -> BinaryTreeNode<Element>? {
       
        guard let node = node else {
            return nil
        }
        
        if element == node.element {
            
            // 叶节点
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            // 度为1节点（只有1个子节点）
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            
            // 度为2节点（有2个子节点）
            // 先找到后继节点，将值赋值给当前节点
            // 再找到这个后继节点，然后删除
            node.element = node.rightChild!.min.element
            node.rightChild = remove(from: node.rightChild, element: node.element)
        }
        else if element < node.element {
            node.leftChild = remove(from: node.leftChild, element: element)
        }
        else {
            node.rightChild = remove(from: node.rightChild, element: element)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = 1 + max(balancedNode.leftHeight, balancedNode.rightHeight)
        return balancedNode
    }
    
    private func balanced(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            }
            else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            }
            else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
    
    private func leftRotate(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        
        let pivot = node.rightChild!
        node.rightChild = pivot.leftChild
        pivot.leftChild = node
        
        node.height = 1 + max(node.leftHeight, node.rightHeight)
        pivot.height = 1 + max(pivot.leftHeight, pivot.rightHeight)
        
        return pivot
    }
    
    private func rightRotate(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        
        node.height = 1 + max(node.leftHeight, node.rightHeight)
        pivot.height = 1 + max(pivot.leftHeight, pivot.rightHeight)
        
        return pivot
    }
    
    private func leftRightRotate(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        
        guard let leftChild = node.leftChild else {
            return node
        }
        
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    
    private func rightLeftRotate(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
}

extension BinaryTree {
    
    public func traverseLevel(visit: (Element, inout Bool) -> Void) {
        
        guard let node = root else {
            return
        }
        
        var queue = Queue<BinaryTreeNode<Element>>()
        queue.enqueue(node)
        
        while let currentNode = queue.dequeue()  {
            
            var stop = false
            
            visit(currentNode.element, &stop)
            
            if stop {
                break
            }
            
            if let child = currentNode.leftChild {
                queue.enqueue(child)
            }
            if let child = currentNode.rightChild {
                queue.enqueue(child)
            }
        }
    }
    
    public func traverseInOrder(visit: (Element, inout Bool) -> Void) {
        traverseInOrderRecursive(node: root, visit: visit)
    }
    
    public func traversePreOrder(visit: (Element, inout Bool) -> Void) {
        traversePreOrderRecursive(node: root, visit: visit)
    }

    public func traversePostOrder(visit: (Element, inout Bool) -> Void) {
        traversePostOrderRecursive(node: root, visit: visit)
    }
    
    fileprivate func traverseInOrderRecursive(node: BinaryTreeNode<Element>?, visit: (Element, inout Bool) -> Void) {
        
        guard let currentNode = node else {
            return
        }
        
        traverseInOrderRecursive(node: currentNode.leftChild, visit: visit)
        
        var stop = false
        
        visit(currentNode.element, &stop)
        
        if stop {
            return
        }
        
        traverseInOrderRecursive(node: currentNode.rightChild, visit: visit)
    }
    
    fileprivate func traversePreOrderRecursive(node: BinaryTreeNode<Element>?, visit: (Element, inout Bool) -> Void) {
        
        guard let currentNode = node else {
            return
        }
        
        var stop = false
        
        visit(currentNode.element, &stop)
        
        if stop {
            return
        }
        
        traversePreOrderRecursive(node: currentNode.leftChild, visit: visit)
        traversePreOrderRecursive(node: currentNode.rightChild, visit: visit)
    }
    
    fileprivate func traversePostOrderRecursive(node: BinaryTreeNode<Element>?, visit: (Element, inout Bool) -> Void) {
        
        guard let currentNode = node else {
            return
        }
        
        traversePostOrderRecursive(node: currentNode.leftChild, visit: visit)
        traversePostOrderRecursive(node: currentNode.rightChild, visit: visit)
        
        var stop = false
        
        visit(currentNode.element, &stop)
        
        if stop {
            return
        }
    }
}

extension BinaryTree: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    
    public var description: String {
        "\n\(Self.self):\n\(diagram(for: root))"
    }
    
    private func diagram(for node: BinaryTreeNode<Element>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node)\n"
        }
        
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
                + root + "\(node)\n"
                + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
