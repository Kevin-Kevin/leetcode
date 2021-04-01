#### [剑指 Offer 61. 扑克牌中的顺子](https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/)

难度 简单

从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

 

**示例 1:**

```
输入: [1,2,3,4,5]
输出: True
```

 

**示例 2:**

```
输入: [0,0,1,2,5]
输出: True
```

 

**限制：**

数组长度为 5 

数组的数取值为 [0, 13] .

#### 解法

> 难点在于如何判断是不是顺子
>
> 我是用最平常的判断法, 排好序的牌中间数值有断层就用 0 来补, 补不上就代表不是顺子
>
> 
>
> 题解区有个大佬总结的判断条件 : nums 中没有重复的牌, max-min<5
>
> 由此有两种解题思路
>
> 1. 遍历放入set, 顺便找出 min 和 max, set 可以判断有没有重复, max 和 min 可以看是否<5
>
> 2. 排序后遍历, 相邻的牌差为 0 就说明有重复, min 位于最后一个 0 之后, max 在最后面
>
>    
>
> ps : 大佬的判断比较难想到, 细思其实是我这种思路的进阶

```java
class Solution {
    public boolean isStraight(int[] nums) {
      // 插入排序
      for(int i=1;i<nums.length;i++){
        int n = nums[i];
        while(i>0 && n<nums[i-1]){
          nums[i] = nums[i-1];
          i--;
        }
        nums[i] = n;
      }
      // 记录有几个 0
      int i=0;
      while(nums[i]==0){
        i++;
      }
      int numOfZero = i;
      int min = nums[i];
      i++;
      // 排除掉大王小王后, 看排完序的牌前后差
      // 等于 1 就看下一个
      // 大于 1 就填补 0, numOfZero 减去相应的数量, 0 要是没有了代表不是顺子, 返回 false
      // 等于 0 代表有重复的牌, 就返回 false 
      while(i<nums.length){
        int difference= nums[i]-nums[i-1];
        if(difference==1){
        }else if(difference>1){
          numOfZero -= difference-1;
          if(numOfZero<0){
            return false;
          }
        }else{
          return false;
        }
        i++;
      }
      return true;
    }
}
```

