#### [剑指 Offer 55 - II. 平衡二叉树](https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/)

难度简单124

输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

 

**示例 1:**

给定二叉树 `[3,9,20,null,null,15,7]`

```
    3
   / \
  9  20
    /  \
   15   7
```

返回 `true` 。

**示例 2:**

给定二叉树 `[1,2,2,3,3,null,null,4,4]`

```
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
```

返回 `false` 。

 

**限制：**

- `0 <= 树的结点个数 <= 10000`

#### 解法一 

深度优先遍历, 每个结点都计算左右子树以及自身是否平衡

> 真的慢

```java
class Solution {
    public boolean isBalanced(TreeNode root) {
      if(root==null){
        return true;
      }
      boolean leftIs = isBalanced(root.left);
      boolean rightIs = isBalanced(root.right);
      int leftH = getHeight(root.left);
      int rightH = getHeight(root.right);
      if(leftIs & rightIs){
        if(leftH-rightH<=1 && leftH-rightH>=-1){
          return true;
        }else{
          return false;
        }
      }else{
        return false;
      }
    }
    int getHeight(TreeNode root){
      if(root==null){
        return 0;
      }
      int leftH = getHeight(root.left);
      int rightH = getHeight(root.right);
      return leftH>rightH ? leftH+1 : rightH+1;
    }    
}
```



#### 解法二

同样深度优先遍历, 每个结点递归返回时得出自己的高度差, 然后判断是否左右深度不超过 1

> 当一个结点的左右深度差超过一时, 如何告诉给另一个一开始调用它的函数
>
> - 定义一个类间变量 flag
>
> - 返回 -1, 然后加上一段判断函数, 左右结点返回-1,那此函数也返回-1代表不平衡
>
>   

```java
class Solution {
    public boolean isBalanced(TreeNode root) {
      if(root==null){
        return true;
      }
      return getHeight(root)==-1 ? false : true;
    }
    int getHeight(TreeNode root){
      if(root ==null){
        return 0;
      }
      int leftH = getHeight(root.left);
      int rightH = getHeight(root.right);
      if(leftH==-1 || rightH==-1){
        return -1;
      }
      if(leftH-rightH >1 || leftH-rightH <-1){
        return -1;
      }
      return leftH>rightH ? leftH+1 : rightH+1;
    }
    
}
```

