#### [剑指 Offer 57 - II. 和为s的连续正数序列](https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/)

难度简单230

输入一个正整数 `target` ，输出所有和为 `target` 的连续正整数序列（至少含有两个数）。

序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

 

**示例 1：**

```
输入：target = 9
输出：[[2,3,4],[4,5]]
```

**示例 2：**

```
输入：target = 15
输出：[[1,2,3,4,5],[4,5,6],[7,8]]
```

 

**限制：**

- `1 <= target <= 10^5`

#### 解法

滑动窗口

4ms , 还有大佬是 0ms 的, 明天学习一下

```java
class Solution {
  public int[][] findContinuousSequence(int target) {
    int front = 1;
    int end=2;
    List<int[]> res= new ArrayList<>();
    int[] item;
    while(front<end){
      int sum = (end*end+end-front*front+front)/2;
      if (sum < target) {
        end++;
      } else if (sum > target) {
        front++;
      } else {
        item = new int[end-front+1];   
        for (int i = front; i <= end; i++) {
          item[i-front] = i;
        }
        res.add(item);
        front++;
      }
    }
    return res.toArray(new int[res.size()][]);
  }

}
```

