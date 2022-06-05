#### [剑指 Offer 07. 重建二叉树](https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/)

难度中等422

输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 

例如，给出

```
前序遍历 preorder = [3,9,20,15,7]
中序遍历 inorder = [9,3,15,20,7]
```

返回如下的二叉树：

```
    3
   / \
  9  20
    /  \
   15   7
```

 

**限制：**

```
0 <= 节点个数 <= 5000
```

#### 解法一 递归法

`curIndex` 代表当前要放入树中的值在 `preorder[]` 中的下标

`recursion()` 返回建好的树

每次先找出当前值在 `inorder[]` 的下标, 查看下标是否在应在的边界中

`curIndex ` 超出边界代表重建完成, 返回 null 给上层的结点

> 一开始在找当前值在 `inorder[]` 的下标时我用的是一个遍历查找函数, 后来改用哈希表记录对应关系, 速度提高很明显

```java
class Solution {
    int curIndex;
    HashMap<Integer, Integer> map;
    public TreeNode buildTree(int[] preorder, int[] inorder) {
      TreeNode root=null;
      map = new HashMap<>();
      buildMap(inorder);
      curIndex = 0;
      root = recursion(preorder, inorder, 0, preorder.length);
      return root;
    }
    public TreeNode recursion(int[] preorder, int[] inorder, int left, int right){
      if(curIndex>=preorder.length){
        return null;
      }
      int rootInorderIndex = map.get(preorder[curIndex]);
      if(rootInorderIndex<left || rootInorderIndex > right){
        return null;
      }
      TreeNode res = new TreeNode(preorder[curIndex]);
      curIndex++;
      res.left = recursion(preorder, inorder, left, rootInorderIndex);
      res.right = recursion(preorder, inorder, rootInorderIndex, right);
      return res;
      
    }
    public void buildMap(int[] inorder){
      for(int i =0; i<inorder.length; i++){
        map.put(inorder[i], i);
      }
    }
}
```

#### 解法二 迭代法