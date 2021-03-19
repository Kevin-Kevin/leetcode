#### [剑指 Offer 55 - I. 二叉树的深度](https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/)

难度简单

输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

例如：

给定二叉树 `[3,9,20,null,null,15,7]`，

```
    3
   / \
  9  20
    /  \
   15   7
```

返回它的最大深度 3 。

 

**提示：**

1. `节点总数 <= 10000`

#### 解法

深度优先遍历, 递归返回左右子树的深度, 选择其中大的数加一返回

```java
class Solution {
    public int maxDepth(TreeNode root) {
      if(root==null){
        return 0;
      }
      int leftMaxDepth = maxDepth(root.left);
      int rightMaxDepth = maxDepth(root.right);
      return leftMaxDepth>rightMaxDepth ? leftMaxDepth+1 : rightMaxDepth+1;
    }
}
```

