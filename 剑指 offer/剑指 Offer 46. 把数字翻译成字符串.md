#### [剑指 Offer 46. 把数字翻译成字符串](https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/)

难度中等204

给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

 

**示例 1:**

```
输入: 12258
输出: 5
解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
```

 

**提示：**

- `0 <= num < 231`

#### 解法一 暴力递归法

遍历翻译

第一个字符可以是 第一个数字 或者 第一二个数字的组合

第二个字符可以是 第二个数字 或者 第二三个数字 或者第三四个数的组合

... 

使用递归函数可以解出答案

使用递归树求解时间复杂度

T(n) = O(2^n)

S(n) = O(n)

```java
class Solution {
  int res;
  public int translateNum(int num) {
    String str = String.valueOf(num);
    char[] chars = str.toCharArray();
    int[] nums = new int[chars.length];
    for(int i=0; i<chars.length; i++){
      nums[i] = chars[i]-'0';
    }
    res = 0;
    recursion(0, nums);
    return res;
  }
  public void recursion(int start, int[] nums){
    if(start>=nums.length-1){
      res++;
      return;
    }
    // 一位数字翻译为字符
    recursion(start+1, nums);
    // 两位数字
    if(nums[start]!=0 && nums[start]*10+nums[start+1]<26){
      recursion(start+2, nums);
    }
  }
}
```

#### 解法二 动态规划

状态 dp[i] : 0-i 个字符有多少种翻译方法

转移方程比较复杂, 看代码就好

边界条件 : `dp[0] =1,dp[1]= arr[0]*10+arr[1]<26 ? 2 : 1 `

```java
class Solution {
    public int translateNum(int num) {
      String str = String.valueOf(num);
      char[] chars = str.toCharArray();
      int[] arr = new int[chars.length];
      for(int i=0; i<chars.length; i++){
        arr[i] = chars[i]-'0';
      }
      int res = 0;
      // dp[i] : 0-i 个字符有多少种翻译方法
      int[] dp = new int[arr.length];
      dp[0] = 1;
      for(int i=1;i<arr.length; i++){
        int last1 = dp[i-1];
        int last2 = 0;
        if(arr[i-1]!=0 && arr[i-1]*10+arr[i]<26){
          if(i==1){
            last2 = 1;
          }else{
            last2 = dp[i-2];
          }
        }
        dp[i] = last1+last2;
      }
      return dp[arr.length-1];
    }
}
```

