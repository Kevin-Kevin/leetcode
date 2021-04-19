#### [面试题34. 二叉树中和为某一值的路径](https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/)

难度中等160

输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

 

**示例:**
给定如下二叉树，以及目标和 `target = 22`，

```
              5
             / \
            4   8
           /   / \
          11  13  4
         /  \    / \
        7    2  5   1
```

返回:

```
[
   [5,4,11,2],
   [5,8,4,5]
]
```

 

**提示：**

1. `节点总数 <= 10000`

#### 解法一 回溯法深度优先搜索

一个深度优先搜索加一个 path 记录路径

漏看了叶结点, 审题还是不够认真, 一定要是到叶结点的路径才能算

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    List<List<Integer>> list;
    List<Integer> path;
    public List<List<Integer>> pathSum(TreeNode root, int target) {
      list = new ArrayList<>();
      path = new ArrayList<>();
      dfs(root, target, 0);
      return list;
    }
    public void dfs(TreeNode root, int target, int currentSum){
      if(root==null){
        return;
      }
      path.add(root.val);
      currentSum += root.val;
      if(currentSum == target && root.left==null && root.right==null){
        list.add(new ArrayList<>(path));
        path.remove(path.size()-1);
        return;
      }
      dfs(root.left, target, currentSum);
      dfs(root.right, target, currentSum);
      path.remove(path.size()-1);
    }
}

```

