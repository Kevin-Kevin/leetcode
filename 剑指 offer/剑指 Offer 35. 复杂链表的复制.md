#### [剑指 Offer 35. 复杂链表的复制](https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/)

> 难度 中等
>
> 请实现 `copyRandomList` 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 `next` 指针指向下一个节点，还有一个 `random` 指针指向链表中的任意节点或者 `null`。
>
>  
>
> **示例 1：**
>
> ![img](https://raw.githubusercontent.com/Kevin-Kevin/pictureBed/master/uPic/e1-1615864197054.png)
>
> ```
> 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
> 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
> ```
>
> **示例 2：**
>
> ![img](https://raw.githubusercontent.com/Kevin-Kevin/pictureBed/master/uPic/e2-1615864197129.png)
>
> ```
> 输入：head = [[1,1],[2,1]]
> 输出：[[1,1],[2,1]]
> ```
>
> **示例 3：**
>
> **![img](https://raw.githubusercontent.com/Kevin-Kevin/pictureBed/master/uPic/e3-1615864197180.png)**
>
> ```
> 输入：head = [[3,null],[3,0],[3,null]]
> 输出：[[3,null],[3,0],[3,null]]
> ```
>
> **示例 4：**
>
> ```
> 输入：head = []
> 输出：[]
> 解释：给定的链表为空（空指针），因此返回 null。
> ```
>
>  
>
> **提示：**
>
> - `-10000 <= Node.val <= 10000`
> - `Node.random` 为空（null）或指向链表中的节点。
> - 节点数目不超过 1000 。

#### 解法

##### 难点

> 复杂链表结点类有三个字段, next 和 val 很简单, 每次 new 一个对象, 然后赋值就好
>
> 但是 random 就不一样了, 如果直接把原来的 random 的值赋给新的, 那指向关系就不对了
>
> 原本 random 指的是本链表中的第二个, 直接赋值的话对于新的 random 来说 ,指向的就是另外一个链表的第二个

##### 解题思路一

> 遍历两遍
>
> 第一遍先创建出链表, 将 next 和 val 字段填充好, rondom 先直接复制过去, 用哈希表记录, 原链表每个结点的地址作为 key , 对应在新链表的地址作为 value
>
> 第二遍时, 用新链表的每个结点的 random 作为 key 从哈希表中取出 value , 替换 rondom

```java
/*
// Definition for a Node.
class Node {
    int val;
    Node next;
    Node random;

    public Node(int val) {
        this.val = val;
        this.next = null;
        this.random = null;
    }
}
*/
class Solution {

  public Node copyRandomList(Node head) {
    if(head==null){
      return null;
    }
    Node newHead = new Node(head.val);
    Map<Node, Node> ht = new HashMap<>();
    newHead.random = head.random;
    ht.put(head, newHead);
    Node indexNode = head.next;
    Node newIndexNode = newHead;

    while (indexNode != null) {
      newIndexNode.next = new Node(indexNode.val);
      newIndexNode.next.random = indexNode.random;

      ht.put(indexNode, newIndexNode.next);

      newIndexNode = newIndexNode.next;

      indexNode = indexNode.next;
    }

    newIndexNode = newHead;
    while (newIndexNode  != null) {
       newIndexNode.random = ht.get(newIndexNode.random);
      newIndexNode = newIndexNode.next;
    }
  return newHead;
  }
}
```

##### 解题思路二

> 遍历链表三次
>
> 第一次在原链表每个结点后面插入新结点并复制 value
>
> 第二次修改每个新结点的 random, 使其为原结点的 random 的 next
>
> 第三次把原结点和新结点分离, 重组成原链表和新链表
>
> ps : 时间复杂度没变, 空间复杂度有争议, leetcode 官方推荐题解是 O(1), 但是每次都要申请 n 个结点, 那不是还是 O(n)

