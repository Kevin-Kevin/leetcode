/**
 * Definition for a binary tree node. public class TreeNode { int val; TreeNode
 * left; TreeNode right; TreeNode(int x) { val = x; } }
 */
class Solution {

  private HashMap<TreeNode, TreeNode> map; // map中key是树中的子节点，而value则是树中的父节点，用于快速从子节点找到父节点
  private Queue<TreeNode> queue;

  public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    // 使用层次遍历，也就是广度优先遍历的思路进行结点与父节点的之间的连接
    map = new HashMap();
    queue = new LinkedList<>();

    if (root == null) {
      return null;
    }

    queue.add(root);
    while (!queue.isEmpty()) {
      TreeNode tmp = queue.remove();
      if (tmp.left != null) {
        queue.add(tmp.left);
        map.put(tmp.left, tmp);
      }
      if (tmp.right != null) {
        queue.add(tmp.right);
        map.put(tmp.right, tmp);
      }
    }

    TreeNode head1 = p;
    TreeNode head2 = q;

    while (head1 != head2) {
      head1 = map.keySet().contains(head1) ? map.get(head1) : q;
      head2 = map.keySet().contains(head2) ? map.get(head2) : p;
    }

    return head1;

  }

}