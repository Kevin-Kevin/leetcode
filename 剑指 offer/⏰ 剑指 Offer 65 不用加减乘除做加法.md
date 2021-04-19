#### 剑指 Offer 65. [不用加减乘除做加法](https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof/)

难度简单159

写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。

 

**示例:**

```
输入: a = 1, b = 1
输出: 2
```

 

**提示：**

- `a`, `b` 均可能是负数或 0
- 结果不会溢出 32 位整数

#### 解法一 位运算

> 由于计算机中使用补码存储数字, 所以只要考虑加法的位运算实现就好

```java
class Solution {
    public int add(int a, int b) {
      while(b!=0){
        int carry = (a & b)<<1;
        a = a ^ b;
        b = carry;
      }
      return a;
    }
}
```

