## [剑指 Offer 59 - II. 队列的最大值](https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/)

> 请定义一个队列并实现函数 `max_value` 得到队列里的最大值，要求函数`max_value`、`push_back` 和 `pop_front` 的**均摊**时间复杂度都是O(1)。
>
> 若队列为空，`pop_front` 和 `max_value` 需要返回 -1
>
> **示例 1：**
>
> ```
> 输入: 
> ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
> [[],[1],[2],[],[],[]]
> 输出: [null,null,null,2,1,2]
> ```
>
> **示例 2：**
>
> ```
> 输入: 
> ["MaxQueue","pop_front","max_value"]
> [[],[],[]]
> 输出: [null,-1,-1]
> ```
>
>  
>
> **限制：**
>
> - `1 <= push_back,pop_front,max_value的总操作数 <= 10000`
> - `1 <= value <= 10^5`



### 思路

在队列当前最大值之前, 不管怎么出列, 最大值都不变

当出列值为最大值的时候, 需要在最大值后面找到第二大的数来补上去

这就需要在入列的时候记录



### 解法一 : 使用两个队列

> 一个正常使用出队入队
>
>  一个存储一个降序序列,
>
> 不同的是这个降序序列每次在 push_back 的时候就从后向前比较
>
>  比新结点小就移除,
>
> 然后在尾部插入新结点

```java
class MaxQueue {
  Deque<Integer> maxDeque;
  Deque<Integer> q;

  public MaxQueue() {
    q= new LinkedList<>();
    maxDeque= new LinkedList<>();
  } 
  public int max_value() {
    if(maxDeque.size()==0)
      return -1;
    return maxDeque.getFirst().intValue();
  }
  public void push_back(int value) {
    // 队列入栈
    Integer integer = new Integer(value);
    q.addLast(integer);
    // 只要新入列的值大于 maxDeque 的尾部,就把尾部去掉
    if(maxDeque.size()!=0){
      while(integer.compareTo(maxDeque.getLast())==1){
        maxDeque.removeLast();
        if(maxDeque.size()==0)
          break;
      }
    }
    maxDeque.addLast(integer);
  }
  
  public int pop_front() {
    // 队列为空, 返回-1
    if(q.size()==0)
      return -1;
    // 出队
    Integer integer=q.removeFirst();
    // 如果出队的是最大值
    if(integer==maxDeque.getFirst()){
      maxDeque.removeFirst();
    }
    // 返回出队列的值
    return integer.intValue();
  }
}
```

## 解法二 : 直接定义一个最大值, 最大值出队的时候使用比较的方法再找出一个最大值

> 年轻人不讲武德😡
>
> 两个队列我想了好久, 然而速度还没有直接查找最大值快
>
> 这个很简单就不放代码了

