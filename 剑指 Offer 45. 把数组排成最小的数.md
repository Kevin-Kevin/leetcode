## [剑指 Offer 45. 把数组排成最小的数](https://leetcode-cn.com/problems/ba-shu-zu-pai-cheng-zui-xiao-de-shu-lcof/)

> 输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
>
> 示例 1:
>
> 输入: [10,2]
> 输出: "102"
> 示例 2:
>
> 输入: [3,30,34,5,9]
> 输出: "3033459"

### 方法一 : 插入排序 (要使用特殊的比较方式)

```c++
class Solution {
public:
    string minNumber(vector<int>& nums) {
      // 插入排序
      // 比较时要用特殊的比较方式
      int length=nums.size();
      for(int i=1;i<length;i++){
        int index=i;
        int num=nums.at(i);
        // 小于前面的数就把前面的数向后挪
        while( 1==specialCompare(num, nums.at(index-1)) ){
          nums.at(index) = nums.at(index-1);
          index--;
          if(index==0)
            break;
        }
        // 挪完后将数字放进去
        nums.at(index) = num; 
      }
      // 将数组转换为字符串
      string str=to_string(nums.at(0));
      for(int i=1;i<length;i++){
        string n=to_string(nums.at(i));
        str.append(n);
      }
      return str;
    }
    // 比较两个数字谁放前面比较小
  	// 转换成字符串后互相追加到后面,然后从下标 0 开始比较
    int specialCompare(int a,int b){
      string aStr = to_string(a);
      string bStr = to_string(b);
      aStr.append(to_string(b));
      bStr.append(to_string(a));
      for(int i=0;i<aStr.size();i++){
        if(aStr.at(i)<bStr.at(i))
          return 1;
        else if(aStr.at(i)>bStr.at(i))
          return 0;
      }
      return 0;
    }

};
```

### 方法二 归并排序



