#### [剑指 Offer 32 - III. 从上到下打印二叉树 III](https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/)

> 难度中等79
>
> 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。
>
>  
>
> 例如:
> 给定二叉树: `[3,9,20,null,null,15,7]`,
>
> ```
>     3
>    / \
>   9  20
>     /  \
>    15   7
> ```
>
> 返回其层次遍历结果：
>
> ```
> [
>   [3],
>   [20,9],
>   [15,7]
> ]
> ```
>
>  
>
> **提示：**
>
> 1. `节点总数 <= 1000`

#### 解法一

> 一个队列正常入列出列, 拿出一个结点就把其左结点右节点入列
>
> 然后使用另一个栈, 如果这一层要逆序输出, 就这一层全部入栈后弹栈输出
>
> 栈也可以用双端队列代替

#### 解法二

> 只用一个 LinkedList
>
> 把它当队列看, 正常入列出列, 拿出一个结点就把其左结点右节点入列
>
> 然后输出到 res 链表时, 如果这一层要逆序输出就从这一层结尾向前输出
>
> 其实一开始我知道可以用两个队列, 但是试着能不能只用一个, 看了一下速度对比, 其实两个和一个没区别, 时间空间复杂度最终都是 O(n)

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
      List<List<Integer>> result = new LinkedList<>();
      List<TreeNode> transferStation = new LinkedList<>();
      if(root ==null){
        return result;
      }
      transferStation.add(root);
      int flag =0;
      int level =0;
      while(transferStation.size()!=0){
        int size = transferStation.size();
        result.add(new LinkedList<Integer>());
        for (int i = 0; i < size; i++) {
            TreeNode node = transferStation.get(i);
            if(node.left!=null){
              transferStation.add(node.left);
            }
            if(node.right!=null){
              transferStation.add(node.right);
            }
        }
        if (flag == 0) {
          for (int i = 0; i < size; i++) {
            TreeNode node = transferStation.remove(0);
            result.get(level).add(node.val);
          }
          flag=1;
        }else {
          for (int i = 0; i < size; i++) {
            TreeNode node = transferStation.remove(size-1-i);
            result.get(level).add(node.val);
          }
          flag=0;
        }
        level++;
        }
return result;
    }
  }
```

