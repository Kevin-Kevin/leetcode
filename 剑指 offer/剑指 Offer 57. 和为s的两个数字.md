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

#### 解法二 哈希表

遍历一遍哈希表写入所有的数

第二次遍历, 在哈希表中寻找 target -nums[i]

```java
class Solution {
  public int[] twoSum(int[] nums, int target) {
    int[] res = new int[2];
    HashMap<Integer, Integer> map = new HashMap<>();
    for(int i =0;i<nums.length;i++){
      map.put(nums[i],i);
    }
    for(int i =0;i<nums.length;i++){
      if(map.containsKey(target-nums[i])){
        res[0] = nums[i];
        res[1] = target-nums[i];
        return res;
      }
    }
    return res;
  }
}
```

#### 解法三 双指针

使用双指针也可以分为两种

1. 一种是用二分法, 遍历数组,使用二分法查找 target-nums[i], 时间复杂度为 O( nlog(n) )

2. 另一种是一个指针 front 指向开头, 一个指针 end 指向结尾 ,  T=O(n) 

   如果 nums[front] + nums[end] < target, 因为 nums[end] 是最大的数, 所以只能 front++

   如果 相加大于 target, 因为 nums[front] 是最小的, 只能 end--

   如果相加和 target 相等, 直接返回

   

```java
class Solution {
  public int[] twoSum(int[] nums, int target) {
    int front = 0;
    int end = nums.length-1;
    int[] res = new int[2];
    while(front<end){
      if(nums[front]+nums[end]<target){
        front++;
      }else if(nums[front]+nums[end]>target){
        end--;
      }else{
        res[0] = nums[front];
        res[1] = nums[end];
        return res;
      }
    }
    // 题目没有说没找到返回什么, 就直接返回 res
    return res;
  }
}
```

