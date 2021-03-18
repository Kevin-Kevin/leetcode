#### [剑指 Offer 53 - I. 在排序数组中查找数字 I](https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/)

> 难度 简单
>
> 统计一个数字在排序数组中出现的次数。
>
>  
>
> **示例 1:**
>
> ```
> 输入: nums = [5,7,7,8,8,10], target = 8
> 输出: 2
> ```
>
> **示例 2:**
>
> ```
> 输入: nums = [5,7,7,8,8,10], target = 6
> 输出: 0
> ```
>
>  
>
> **限制：**
>
> ```
> 0 <= 数组长度 <= 50000
> ```

#### 解法

> 使用二分查找找出 target , 然后左右指针向两边延伸找出次数
>
> 另一种解法是二分查找找出最左边 target 的位置, 然后找出次数, 时间和空间差不太多 

```java
class Solution {
  public int search(int[] nums, int target) {
    if(nums.length==0) return 0;
    int left=0;
    int right = nums.length-1;
    int mid = left+(right-left)/2;
    while(left<=right){
      mid = left+(right-left)/2;
      if (nums[mid] > target) {
        right = mid-1;
      } else if (nums[mid] < target) {
        left = mid+1;
      }else{
        left=mid;
        right=mid;
        break;
      }
    }
      while(right+1<nums.length && nums[right+1]==target){
        right++;
      }
      while(left-1>-1 && nums[left-1]==target){
        left--;
      }
      return right-left+1;

  }
}
```

