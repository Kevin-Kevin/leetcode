#### [剑指 Offer 57. 和为s的两个数字](https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/)

难度简单85

输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

 

**示例 1：**

```
输入：nums = [2,7,11,15], target = 9
输出：[2,7] 或者 [7,2]
```

**示例 2：**

```
输入：nums = [10,26,30,31,47,60], target = 40
输出：[10,30] 或者 [30,10]
```

 

**限制：**

- `1 <= nums.length <= 10^5`
- `1 <= nums[i] <= 10^6`

#### 解法一 暴力法

只用这种方法肯定是不行, 写题跟没写一样

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
      // 由于要求是一对数, 那就从后向前遍历, 
      int length = nums.length;
      int i=length-1;
      while(nums[i]>=target){
        i--;
      }
      int[] res = new int[2];      
      for(;i>=0;i--){
        for(int index = i-1;index>=0;index--){
          if(nums[i]+nums[index]==target){
            res[0] = nums[i];
            res[1] = nums[index];
            return res;
          }
        }
      }
    return res;
    }
}
```

