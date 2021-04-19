#### [剑指 Offer 63. 股票的最大利润](https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/)

难度中等108

假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？

 

**示例 1:**

```
输入: [7,1,5,3,6,4]
输出: 5
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
```

**示例 2:**

```
输入: [7,6,4,3,1]
输出: 0
解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
```

 

**限制：**

```
0 <= 数组长度 <= 10^5
```

> 这道题写的时候魔怔了, 光想着要用 T=O(n) 解出来, 忘了要先思考普通的方法
>
> 

#### 解法一 暴力法

枚举出所有可能的买入和卖出日期利润`profit[buy][sell]` , buy<sell

然后找出最大的解

#### 解法二 贪心法

题解区有用动态规划写的, 代码差不多, 但是我感觉这道题用动态规划有点强求,  递推方程有点难求

> 本来我用的是双指针, 这道题不用也是可以的, 因为要求的是最大利润不是具体哪一天买和卖
>
> 用双指针就出现了边界问题, 还是写的不够熟练

```java
class Solution {
  public int maxProfit(int[] prices) {
    if(prices.length==0){
      return 0;
    }
    int min = prices[0];
    int maxProfit = 0;
    for(int i =0; i<prices.length; i++){
      if(prices[i]<min){
        min = prices[i];
      }else if(prices[i]-min>maxProfit){
        maxProfit = prices[i]-min;
      }
    }
    return maxProfit;
  }
}
```

