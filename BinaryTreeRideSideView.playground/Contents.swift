/*
 
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 Example:
 
 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:
 
 1            <---
 /   \
 2     3         <---
 \     \
 5     4       <---
 
 */


public class TreeNode {
        public var val: Int
        public var left: TreeNode?
         public var right: TreeNode?
         public init() { self.val = 0; self.left = nil; self.right = nil; }
         public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
         public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
                 self.val = val
                     self.left = left
                     self.right = right
             }
     }

class NodeDepthPair {
    
    let treeNode: TreeNode
    let depth: Int
    
    init(_ node: TreeNode, _ depth: Int) {
        self.treeNode = node
        self.depth = depth
    }
}

class Solution {
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var rightSideView: [Int] = []
        var visitedDepths: [Int] = []
        var treeNodes: [NodeDepthPair] = []
        
        guard root != nil else {
            return rightSideView
        }
        
        let currentNode = root
        treeNodes.append(NodeDepthPair(currentNode!,0))
        
        while !treeNodes.isEmpty {
            
            let nodeDepthPair = treeNodes.removeFirst()
            let node = nodeDepthPair.treeNode
            let depth = nodeDepthPair.depth
            
            if (!visitedDepths.contains(depth)) {
                visitedDepths.append(depth)
                rightSideView.append(node.val)
                
                if let right = node.right {
                    treeNodes.append(NodeDepthPair(right, depth + 1))
                }
                
                if let left = node.left {
                    treeNodes.append(NodeDepthPair(left, depth + 1))
                }
            } else {
                
                if let right = node.right {
                    treeNodes.append(NodeDepthPair(right, depth + 1))
                }
                
                if let left = node.left {
                    treeNodes.append(NodeDepthPair(left, depth + 1))
                }
            }
        }
        
        return rightSideView
    }
    
}

/* TestCases
 Input:
 [1,2,3,null,5,null,4]
 [1,2,3,null,5,null]
 [1,2,null,5]
 [1,2,3,null,5,4]
 
 Output//Expected Output
 [1,3,4]
 [1,3,5]
 [1,2,5]
 [1,3,4]
 */
