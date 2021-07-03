## [剑指 Offer 39. 数组中出现次数超过一半的数字](https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/)

> 难度简单124
>
> 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
>
>  
>
> 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
>
>  
>
> **示例 1:**
>
> ```
> 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
> 输出: 2
> ```
>
>  
>
> **限制：**
>
> ```
> 1 <= 数组长度 <= 50000
> ```

#### 解法一 哈希表

#### 解法二 排序

#### 解法三 抵消法

由于要求的数字超过数组的一半, 取数组中的数两两比较不同就抵消掉, 最后总会剩下要求的数字

```java
class Solution {
    public int majorityElement(int[] nums) {
      int mode = 0;
      int times = 0;
      for(int n : nums){
        if(times == 0){
          mode = n;
        }
        if(mode!=n){
          times -= 1;
        }else{
          times += 1;
        }
      }
      return mode;
      
    }
}
```

