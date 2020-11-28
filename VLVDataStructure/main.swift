//
//  main.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

//LinkedListTest.test()
//StackTest.test()
//QueueTest.test()
//BinaryTreeTest.test()
//TrieTest.test()
//HeepTest.test()
PriorityQueueTest.test()


print(findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))

func findRepeatNumber(_ nums: [Int]) -> Int {

//        var newNums = nums
//        print(newNums)
//        for (index, num) in newNums.enumerated() {
//
//            if index == newNums[index] {
//                continue
//            }
//
//            if newNums[num] == num {
//                return num
//            }
//
//            newNums.swapAt(index, num)
//            print(newNums)
//        }
//
//        return -1
    
    var set = Set<Int>()
    
    for num in nums {
        
        if !set.insert(num).inserted {
            return num
        }
    }
    
    return -1
}
