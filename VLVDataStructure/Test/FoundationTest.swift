//
//  FoundationTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/24.
//

func example(name: String, content: () -> ()) {
    
    print("======================= 《\(name)》测试结果 =========================\n")
    content()
    print("\n")
}
