#### [剑指 Offer 66. 构建乘积数组](https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof/)

难度中等102

给定一个数组 `A[0,1,…,n-1]`，请构建一个数组 `B[0,1,…,n-1]`，其中 `B[i]` 的值是数组 `A` 中除了下标 `i` 以外的元素的积, 即 `B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]`。不能使用除法。

 

**示例:**

```
输入: [1,2,3,4,5]
输出: [120,60,40,30,24]
```

 

**提示：**

- 所有元素乘积之和不会溢出 32 位整数
- `a.length <= 100000`

#### 解法一 暴力法

遍历 b[i] , 每次都计算一次 A[]中 除了下标 `i` 以外的元素的积

#### 解法二 动态规划

> 这里要求不用除法, 本来可以先计算下标 0 右边所有的积 rightSum , 然后求 b 的时候每次都rightSum/a[i]

根据暴力法很明显可以看出, 这里有很多重复的计算, 利用动态规划可以减少计算量

dp[a.length] 记录从当前下标 i 到 a.length-1位置所有的值的积

遍历 b[a.length] , b[i] = leftProduct * a[i-1] * dp[i+1]

边界条件 i=0, i=a.length-1

特殊输入 a.length==0 || a.length==1

```java
class Solution {
    public int[] constructArr(int[] a) {
      if(a.length==0 || a.length==1){
        return a;
      }
      int leftProduct = 1;
      int rightProduct = 1;
      int[] dp = new int[a.length];
      int[] res = new int[a.length];
      for(int i=a.length-1; i>=1; i--){
        rightProduct *= a[i];
        dp[i] = rightProduct;
      }
      
      res[0] = dp[1];
      for(int i=1; i<a.length-1; i++){
        leftProduct *= a[i-1];
        rightProduct = dp[i+1];
        res[i] = leftProduct*rightProduct;  
      }
      res[a.length-1] = leftProduct*a[a.length-2];
      return res;
    }
}
```

 

