#### [剑指 Offer 14- II. 剪绳子 II](https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/)

难度中等92

给你一根长度为 `n` 的绳子，请把绳子剪成整数长度的 `m` 段（m、n都是整数，n>1并且m>1），每段绳子的长度记为 `k[0],k[1]...k[m - 1]` 。请问 `k[0]*k[1]*...*k[m - 1]` 可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 

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

- `2 <= n <= 1000`

#### 错误解法 

下面这个是错误的解法

因为每次得到的res = (a*1000000007 +b)%1000000007

取余后不能正确表示 res 和 dp[l] 的大小关系, 比较的仅仅是 b, a 由于取余的关系被忽略了

```java
class Solution {
    public int cuttingRope(int n) {
      long[] dp = new long[n+1];
      dp[1] = 1;
      for(int l = 2; l<=n; l++){
        dp[l] = 0;
        for(int i=1; i<=l/2; i++){
          long left = dp[i]>i ? dp[i] : i;
          long right = dp[l-i]>l-i ? dp[l-i] : l-i;
          long res = (left*right)%1000000007;
          if(res>dp[l]){
            dp[l] = res;
          } 
        }
      }
      return (int)(dp[n]%1000000007);
    }
}
```

#### 正确解法

难点 : 

> 本题难在一定要用贪心, 并且 res 要用 long 来防止 res*3 溢出, 以及每次计算 res 都要取余

为什么使用 long 类型的 res

> 因为 res<=base , res*3 最大可能是 3000000021 > 2^31-1
>
> base*3<long类型的最大值
>
> 所以 long 类型可以正确保存状态

这里写一下为什么 res = (res*3)%base 成立

> 因为 : 
> 	res = (a * base + b) % base
>   		= b
> 	res*3 = (3 * a * base + 3 * b) %base
> 				= 3*b
> 所以 : 
> 	res = (res*3)%base 成立, 不会影响结果

```java
class Solution {
    public int cuttingRope(int n) {
      if(n<4){
        return n-1;
      }
      int base = 1000000007;
      long res = 1;
      while(n>4){
        res = (res*3)%base;
        n -= 3;
      }
      return (int)((res*n)%base);
    }
}
```

