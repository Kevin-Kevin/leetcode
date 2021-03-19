#### [剑指 Offer 54. 二叉搜索树的第k大节点](https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/)

> 难度 简单
>
> 给定一棵二叉搜索树，请找出其中第k大的节点。
>
>  
>
> **示例 1:**
>
> ```
> 输入: root = [3,1,4,null,2], k = 1
>    3
>   / \
>  1   4
>   \
>    2
> 输出: 4
> ```
>
> **示例 2:**
>
> ```
> 输入: root = [5,3,6,2,4,null,null,1], k = 3
>        5
>       / \
>      3   6
>     / \
>    2   4
>   /
>  1
> 输出: 4
> ```
>
>  
>
> **限制：**
>
> 1 ≤ k ≤ 二叉搜索树元素个数

#### 解法

> 二叉搜索树中序遍历是有序序列
>
> 此题目要求找出第 k 大的结点
>
> 容易想到的解法是使用一个数组, 中序遍历放入数组中, 然后找出第 k 大的数
>
> 这样空间复杂度比较高, O(n)
>
> 另外一种解法是中序遍历左右子树反过来, 这样遍历的顺序就是降序, 然后递归返回的时候 k-1, k==0 就代表是第 k 大的数

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
  int k;
  int res;
    public int kthLargest(TreeNode root, int k) {
      res = 0;
      this.k = k;
      inOrder(root);
      return res;
    }
    public void inOrder(TreeNode root){
      if(root == null){
        return;
      }
      if(k==0){
        return;
      }
      inOrder(root.right);
      k--;
      if(k==0){
        res = root.val;
      }
      inOrder(root.left);
      return ;
    }
    
}
```

