## [剑指 Offer 30. 包含min函数的栈](https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/)

> 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。
>
>  
>
> 示例:
>
> MinStack minStack = new MinStack();
> minStack.push(-2);
> minStack.push(0);
> minStack.push(-3);
> minStack.min();   --> 返回 -3.
> minStack.pop();
> minStack.top();      --> 返回 0.
> minStack.min();   --> 返回 -2.
>
>
> 提示：
>
> 各函数的调用总次数不超过 20000 次

由于要求时间复杂度为 O(1) , 不能直接查找最小值

### 解法一 : 用两个栈 , 一个用于放入放出元素, 一个用于记录最小值

> 每次 push 的时候, 最小值的栈 minList 只记录小于等于当前 min 值的值
>
> 每次 pop 的时候, 如果是出栈的是最小值, 就将 minList 出栈
>
> 每次 getMin 的时候, 返回 minList 的栈顶值
>
> PS : 用 Java 实现了 Stack 接口的类速度会更快 , 这合理吗🤔

```java
class MinStack {
    public class Node{
      int val;
      Node next;
      public Node(int val){
        this.val = val;
        next = null;
      }
    }
    Node stack;
    Node minList;
    /** initialize your data structure here. */
    public MinStack() {
      stack = new Node(-1);
      minList = new Node(-1);
    }
    
    public void push(int x) {
      Node node = new Node(x);
      node.next = stack.next;
      stack.next = node;
      if(minList.next==null){
        minList.next = new Node(x);
      }else{
        if(x<=minList.next.val){
          Node newMin=new Node(x);
          newMin.next = minList.next;
          minList.next = newMin;
          System.out.println("min ="+x);
        }
      }

    }
    
    public void pop() {
      if(stack.next.val==minList.next.val){
        minList.next = minList.next.next;
      }
      stack.next = stack.next.next;

    }
    
    public int top() {
      return stack.next.val;
    }
    
    public int min() {
      System.out.println("get min");
      return minList.next.val;
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.min();
 */
```

### 解法二 : 用一个栈, 栈中元素是一个结点类, 结点类里有当前栈的值和当前最小的值, 相当于合并了解法一的两个栈