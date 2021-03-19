#### [剑指 Offer 68 - II. 二叉树的最近公共祖先](https://leetcode-cn.com/problems/er-cha-shu-de-zui-jin-gong-gong-zu-xian-lcof/)

难度 简单

给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

[百度百科](https://baike.baidu.com/item/最近公共祖先/8918834?fr=aladdin)中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（**一个节点也可以是它自己的祖先**）。”

例如，给定如下二叉树: root = [3,5,1,6,2,0,8,null,null,7,4]

![img](https://gitee.com/kevinzhang1999/my-picture/raw/master/uPic/binarytree-1616146813571.png)

 

**示例 1:**

```
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出: 3
解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
```

**示例 2:**

```
输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出: 5
解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
```

 

**说明:**

- 所有节点的值都是唯一的。
- p、q 为不同节点且均存在于给定的二叉树中。



#### 解法一 深度优先搜索

深度优先搜索, 递归返回占用空间较多  

难点在于返回的情况比较繁琐

- 本身是 q 或 p
- 左右子树中有 q 或者 p

```java

class Solution {
    TreeNode res;
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        res = null;
        DepthFirstSearch(root, p, q);
        return res;
    }
    public int DepthFirstSearch(TreeNode root, TreeNode p, TreeNode q){
      if(root==null){
        return 0;
      }
      if(res!=null){
        return -1;
      }
      int resOfLeft = DepthFirstSearch(root.left, p, q);
      int resOfRight = DepthFirstSearch(root.right, p, q);
      if(resOfLeft ==1 && resOfRight==1){
        this.res = root;
        return 1;
      }
      int thisTimeRes=0;
      if(root == p || root == q){
        thisTimeRes = 1;
      }
      if(resOfLeft==1 || resOfRight==1){
        if(thisTimeRes==1){
          res = root;
        }else{
          return 1;
        }
      }
      return thisTimeRes;
    }
}
```



#### 解法二 哈希表记录 key(结点)-value(父结点 , 是否访问过)

速度慢, 但是空间占用少

遍历一次寻找 q 和 p ,把遍历到的结点及其的父结点记入哈希表, 标记为未访问

第二次在哈希表中查找 q 以及 q 父结点的父结点...直到根, 同时标记为已访问, 然后同样查找 p 以及 p 的父结点的父结点... , 这其中第一个访问过的就是 p 和 q 的最近公共祖先

> 用哈希表也可以有好几种方法, 都是记录了结点的父结点, 然后找最近公共祖先
>
> 1. 用两个哈希表, 一个是<结点, 父结点>, 一个是<父结点, 是否访问过> 和我这个差不多
>
> 2. 类似于找两个链表的公共部分, 双指针一起走, 走到头就换另外一条路, 指针相同代表指向了最近公共祖先

```java
class Solution {
  public  class FatherAndIsAccessed{
    TreeNode father;
    Boolean isAccessed;

    public FatherAndIsAccessed(TreeNode father, Boolean isAccessed) {
      this.father = father;
      this.isAccessed= isAccessed;
    }
  }
  public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    HashMap<TreeNode, FatherAndIsAccessed> hashMap = new HashMap<>();
    Deque<TreeNode> queue = new LinkedList<>();
    queue.add(root);
    int flag = 0;
    while(queue.size()!=0){
      TreeNode node = queue.removeFirst();
      if (node == q || node == p) {
        flag++;
      }
      if(flag==2){
        break;
      }
      if (node.left != null) {
        hashMap.put(node.left, new FatherAndIsAccessed(node, false));
        queue.add(node.left);
      }
      if (node.right != null) {
        hashMap.put(node.right, new FatherAndIsAccessed(node, false));
        queue.add(node.right);
      }
    }
    while (hashMap.get(q)!=null){
      TreeNode father = hashMap.get(q).father;
      hashMap.put(q, new FatherAndIsAccessed(father, true));
      q = father;
    }
    while (hashMap.get(p)!=null){
      Boolean isAccessed = hashMap.get(p).isAccessed;
      if(isAccessed){
        return p;
      }
      p=hashMap.get(p).father;
    }
    return root;

  }
}
```

