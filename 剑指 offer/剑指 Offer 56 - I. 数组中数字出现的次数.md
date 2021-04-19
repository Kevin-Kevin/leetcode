#### [剑指 Offer 56 - I. 数组中数字出现的次数](https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/)

难度中等371

一个整型数组 `nums` 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

 

**示例 1：**

```
输入：nums = [4,1,4,6]
输出：[1,6] 或 [6,1]
```

**示例 2：**

```
输入：nums = [1,2,10,4,1,4,3,3]
输出：[2,10] 或 [10,2]
```

 

**限制：**

- `2 <= nums.length <= 10000`

#### 解法一 利用异或的性质解题

> 如果空间复杂度没有要求, 可以用哈希表
>
> 这道题我感觉要是没写过我应该是想不出来的

异或满足结合律, `x^y^z = x^z^y`

又有 ` x^x = 0, x^0 = x`

故 `x^y^x = y`

所有把数组中所有的数异或之后就等于数组中唯一的两个数字的异或 `a^b`

由于异或的结果是不同为 1, 相同为 0

在数组的异或结果中找到某一位是 1 的位

代表 a 和 b 的这一位肯定不一样, 一个是 1, 一个是 0

把所有的数和利用 `& (0x1 << n) ` 分成两组

这样一来, 一组中除了 a , 其余的数都出现过两次, 另一组除了 b 也是如此

然后把一组的所有数进行异或就得到 a 或 b

另一组也是一样

```java
class Solution {
    public int[] singleNumbers(int[] nums) {
      int xor = 0;
      for(int i=0; i<nums.length; i++){
        xor ^= nums[i];
      }
      int m = 0x1;
      while((xor & m )!= m){
        m = m<<1;
      }
      int aXor=0;
      int bXor=0;
      for(int i=0; i<nums.length; i++){
        if((nums[i] & m) == m){
          aXor ^= nums[i];
        }else{
          bXor ^= nums[i];
        }
      }
      return new int[]{aXor, bXor};
    }
}
```

