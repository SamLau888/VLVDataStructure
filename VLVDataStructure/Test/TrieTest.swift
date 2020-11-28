//
//  TrieTest.swift
//  VLVDataStructure
//
//  Created by sam on 2020/11/25.
//

public struct TrieTest {
    
    public static func test() {
        
        example(name: "Trie CustomStringConvertible") {
            
            let trie = Trie<String>()
            print(trie)
            print("isEmpty: \(trie.isEmpty)")
        }
        
        example(name: "Trie ExpressibleByArrayLiteral") {
            
            let trie: Trie = ["AAA", "AAB", "AAC", "ABA", "ABB", "ABC"]
            print(trie)
            print("isEmpty: \(trie.isEmpty)")
        }
        
        example(name: "Trie Insert") {
            
            var trie = Trie<String>()
            trie.insert("AAA")
            trie.insert("AAB")
            trie.insert("AAC")
            trie.insert("ABA")
            trie.insert("ABB")
            trie.insert("ABC")
            print(trie)
        }
        
        example(name: "Trie Remove") {
            
            var trie = Trie<String>()
            trie.insert("AAA")
            trie.insert("AAB")
            trie.insert("AAC")
            trie.insert("ABA")
            trie.insert("ABB")
            trie.insert("ABC")
            print(trie)
            
            trie.remove("AAA")
            print(trie)
        }
        
        example(name: "Trie Remove All") {
            
            var trie = Trie<String>()
            trie.insert("AAA")
            trie.insert("AAB")
            trie.insert("AAC")
            trie.insert("ABA")
            trie.insert("ABB")
            trie.insert("ABC")
            print(trie)
            
            trie.removeAll()
            print(trie)
        }
        
        example(name: "Trie Search StartingWith AB") {
            
            var trie = Trie<String>()
            trie.insert("AAA")
            trie.insert("AAB")
            trie.insert("AAC")
            trie.insert("ABA")
            trie.insert("ABB")
            trie.insert("ABC")
            print(trie)
            print(trie.collections(startingWith: "AB"))
        }
    }
}
