#### [剑指 Offer 53 - II. 0～n-1中缺失的数字](https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/)

> 难度 简单
>
> 一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。
>
>  
>
> **示例 1:**
>
> ```
> 输入: [0,1,3]
> 输出: 2
> ```
>
> **示例 2:**
>
> ```
> 输入: [0,1,2,3,4,5,6,7,9]
> 输出: 8
> ```
>
>  
>
> **限制：**
>
> ```
> 1 <= 数组长度 <= 10000
> ```



#### 解法

> 用遍历做实在太简单, 所以要用二分法
>
> 二分法难处有两点
>
> 1. 每次改变 left 或者 right 边界的时候, 是不包括 mid 分为两部分还是包括 mid 分为两部分, 如果包括 mid , 那 mid 是放到左边部分还是右边部分
> 2. 循环条件的判断
>
> 这道题选择不包括 mid 分为两部分, 完美符合边界条件

```java
class Solution {
    public int missingNumber(int[] nums) {
      int left=0;
      int right = nums.length-1;
      int mid;
      while(left<=right){
        mid = left+(right-left)/2;
        if(nums[mid]==mid){
          left=mid+1;
        }
        if(nums[mid]>mid){
          right=mid-1;
        }
      }
      return left;
    }
}
```

