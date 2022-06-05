#### [剑指 Offer 68 - I. 二叉搜索树的最近公共祖先](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-zui-jin-gong-gong-zu-xian-lcof/)

难度 简单

给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

[百度百科](https://baike.baidu.com/item/最近公共祖先/8918834?fr=aladdin)中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（**一个节点也可以是它自己的祖先**）。”

例如，给定如下二叉搜索树: root = [6,2,8,0,4,7,9,null,null,3,5]

![img](https://raw.githubusercontent.com/Kevin-Kevin/pictureBed/master/uPic/binarysearchtree_improved-1616225353780.png)

 

**示例 1:**

```
输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
输出: 6 
解释: 节点 2 和节点 8 的最近公共祖先是 6。
```

**示例 2:**

```
输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
输出: 2
解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
```

 

**说明:**

- 所有节点的值都是唯一的。
- p、q 为不同节点且均存在于给定的二叉搜索树中。

#### 解法一

由于是二叉搜索树, 可以利用此树的特性

Root.val 有以下情况

| p.val | <           |     <     | <    |     >     |      >      | >    | =    | =    | =      |
| ----- | ----------- | :-------: | ---- | :-------: | :---------: | ---- | ---- | ---- | ------ |
| q.val | <           |     >     | =    |     <     |      >      | =    | <    | >    | =      |
|       | root 在右边 | ✅或不可能 | ✅    | ✅或不可能 | root 在左边 | ✅    | ✅    | ✅    | 不可能 |

可以用迭代写出来也可以用递归

看了题解觉得迭代更好, 不占空间

```java
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
      if(root==null){
        return null;
      }
      if(root.val<p.val && root.val<q.val){
        return lowestCommonAncestor(root.right,p,q);
      }
      if(root.val>p.val && root.val>q.val){
        return lowestCommonAncestor(root.left,p,q);
      }
      return root;
    }
}
```

```java
// 这样写会快 1ms
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
      if(root==null){
        return null;
      }
      int min = Math.min(p.val, q.val);
      int max = Math.max(p.val, q.val);
      if(root.val<min){
        return lowestCommonAncestor(root.right,p,q);
      }
      if(root.val>max){
        return lowestCommonAncestor(root.left,p,q);
      }
      return root;
    }
}
```

#### 解法二

二叉搜索树查找 p 和 q

记录查找的路径, 既经过的结点

找出最后相同的结点

这样比较占空间 O(n)

