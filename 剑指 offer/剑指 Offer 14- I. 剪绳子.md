#### [剑指 Offer 14- I. 剪绳子](https://leetcode-cn.com/problems/jian-sheng-zi-lcof/)

难度中等205

给你一根长度为 `n` 的绳子，请把绳子剪成整数长度的 `m` 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 `k[0],k[1]...k[m-1]` 。请问 `k[0]*k[1]*...*k[m-1]` 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

**示例 1：**

```
输入: 2
输出: 1
解释: 2 = 1 + 1, 1 × 1 = 1
```

**示例 2:**

```
输入: 10
输出: 36
解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36
```

**提示：**

- `2 <= n <= 58`

#### 解法一 动态规划

```java
class Solution {
    public int cuttingRope(int n) {
      int[] dp = new int[n+1];
      dp[1] = 1;
      for(int l = 2; l<=n; l++){
        dp[l] = 0;
        for(int i=1; i<=l/2; i++){
          int left = dp[i]>i ? dp[i] : i;
          int right = dp[l-i]>l-i ? dp[l-i] : l-i;
          int res = left*right;
          if(res>dp[l]){
            dp[l] = res;
          } 
        }
      }
      return dp[n];
    }
}
```

#### 解法二 贪心法

尽可能把绳子分成长度为3的小段，这样乘积最大

> 这个是题解区大佬的解法, 强👍

```java
class Solution {
    public int cuttingRope(int n) {
        if(n < 4){
            return n - 1;
        }
        int res = 1;
        while(n > 4){
            res *= 3;
            n -= 3;
        }
        return res * n;
    }
}

```

