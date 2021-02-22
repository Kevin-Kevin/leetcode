## [剑指 Offer 32 - II. 从上到下打印二叉树 II](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/)

### 解法一 : 递归

```

```



### 解法二 : 队列模拟堆栈 , 利用队列的size记录层相应的结点的数量

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
    public List<List<Integer>> levelOrder(TreeNode root) {
      if(root==null)
        return new ArrayList<>();
      Queue<TreeNode> q = new LinkedList<>();
      List<List<Integer>> l=new ArrayList<List<Integer>>();
      int y=0;
      q.add(root);
      while(!q.isEmpty()){
      l.add(new ArrayList<Integer>());
        int i=0;
        for(i=q.size();i>0;i--){
          TreeNode node = q.remove();
          l.get(y).add(node.val);
          if(node.left!=null)
            q.add(node.left);
          if(node.right!=null)
            q.add(node.right);
        }
      y++;
      }
      return l;
    }
}
```



### 解法三 : 双队列迭代

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
    public List<List<Integer>> levelOrder(TreeNode root) {
      if(root==null)
        return new ArrayList<>();
      Queue<TreeNode> q1 = new LinkedList<>();
      Queue<TreeNode> q2 = new LinkedList<>();

      List<List<Integer>> l=new ArrayList<List<Integer>>();
      Queue<TreeNode> getQ=q1;
      Queue<TreeNode> putQ=q2;
      getQ.add(root);
      int flag=1;
      int x=0,y=0;
      l.add(new ArrayList<Integer>());
      while(!q1.isEmpty()||!q2.isEmpty()){
        if(getQ.isEmpty()){
      l.add(new ArrayList<Integer>());
          y++;
          x=0;
          if(flag==0){
            flag=1;
            getQ=q1;
            putQ=q2;
          }
          else{
            flag=0;
            getQ=q2;
            putQ=q1;
          }
        }

        TreeNode node = getQ.remove();
        l.get(y).add(node.val);
       
        if(node.left!=null)
          putQ.add(node.left);
        if(node.right!=null)
          putQ.add(node.right);
        
        x++;
      }
return l;
    }
}
```

