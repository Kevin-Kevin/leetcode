#### [剑指 Offer 49. 丑数](https://leetcode-cn.com/problems/chou-shu-lcof/)

难度中等146

我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

 

**示例:**

```
输入: n = 10
输出: 12
解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
```

**说明:** 

1. `1` 是丑数。
2. `n` **不超过**1690。

#### 解法一 暴力法

对于每个数都进行丑数判断

丑数判断函数 : 如果一个数可以被 2, 3 或 5 整除, 就对其余数递归调用判断函数, 直到余数为 0

#### 解法二 动态规划

这是我一开始想出来的思路, 可惜超时了

> 状态 : dp[i] 记录 i 是否为丑数
>
> 状态转移方程  : 如果 i 可以被 2, 3, 5 整除,  `dp[i] = dp[i/2] || dp[i/3] || dp[i/5] , i>2`
>
> 边界条件 : dp[1] = dp[2] = true;

动态规划的另一种思路

已知前 n-1 个丑数, 求第 n 个丑数

由于每个丑数都是由比其小的丑数乘以 2, 3, 5 得到的

维护三个指针指向丑数数组的三个数, 如果这三个数分别乘以 2, 3 ,5 小于dp[n-1], 指针就++

把三个 while 改成 if 会快 1ms, 但是改成 if 需要数学证明可行, 面试的时候不会有这个时间推理的

```java
class Solution {
    public int nthUglyNumber(int n) {
        int[] dp = new int[n];
        dp[0] =1;
        int two = 0;
        int three = 0;
        int five = 0;
        for(int i=1;i<n;i++){
          while(dp[two]*2<=dp[i-1]){
            two++;
          }
          while(dp[three]*3<=dp[i-1]){
            three++;
          }
          while(dp[five]*5<=dp[i-1]){
            five++;
          }
          dp[i] = Math.min(dp[five]*5, Math.min(dp[three]*3, dp[two]*2));
        }
        return dp[n-1];
    }
}
```

#### 解法三 最小堆

每次求出一个丑数都把其乘以 2,3,5 的值放入最小堆, 求新的丑数时取出来

放入最小堆的时候要用哈希表记录, 如果重复了就不放进去

T=O( log n! ) = O( nlog(n) )

