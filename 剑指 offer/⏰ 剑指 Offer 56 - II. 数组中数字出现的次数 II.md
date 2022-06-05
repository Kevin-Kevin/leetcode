#### [剑指 Offer 56 - II. 数组中数字出现的次数 II](https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/)

难度中等170

在一个数组 `nums` 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

 

**示例 1：**

```
输入：nums = [3,4,3,3]
输出：4
```

**示例 2：**

```
输入：nums = [9,1,7,9,7,9,7]
输出：1
```

 

**限制：**

- `1 <= nums.length <= 10000`
- `1 <= nums[i] < 2^31`

#### 解法一 位运算

> 看了剑指 offer 的书才有的思路
>
> 太慢了, 下次写个更好的

```java
class Solution {
    public int singleNumber(int[] nums) {
      // 把每个数字的每一位相加, 每一位的和对 3 取余, 每一位取余的结果组合起来就是只出现一次的数字
      int[] res = new int[31];
      for(int i=0; i<nums.length; i++){
        int m = 1;
        for(int index = 0; index<31; index++){
          int and = nums[i] & m;
          if(and != 0){
            res[index]++; 
          }
          m <<= 1;
        }
      }
      int result=0;
      for(int index = 0; index<31; index++){
        res[index] %= 3;
        result += res[index]*Math.pow(2, index);
      }
      return result;
    }
}
```

