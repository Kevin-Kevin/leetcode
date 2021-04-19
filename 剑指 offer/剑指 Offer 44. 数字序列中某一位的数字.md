#### [剑指 Offer 44. 数字序列中某一位的数字](https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof/)

难度中等110

数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

请写一个函数，求任意第n位对应的数字。

 

**示例 1：**

```
输入：n = 3
输出：3
```

**示例 2：**

```
输入：n = 11
输出：0
```

 

**限制：**

- `0 <= n < 2^31`

#### 解法一 暴力法

从 0-n 遍历, 数字放入字符串str, 然后字符串str.get(n)

一定有更好的, 这个就跳过, 只作为更好的思路的参考

#### 解法二 找数学规律

时间非常快, 但是我的代码不够简洁

while 循环那里可以比较 sum+newColumnSum 和 n, 就不用在循环内多加一行

> 贴个题解区大佬的思路
>
> 10 11 12 ... 98 99              --> 90   个数字每个数字占两位
> 100 101 102 ... 998 999         --> 900  个数字每个数字占三位
> 1000 1001 1002 ... 9998 9999    --> 9000 个数字每个数字占四位
>
> 第一行共有 10*9*2 个数
> 第二行公有 10*10*9*3 个数
> 第三行公有 10*10*10*9*4 个数
>
> 好了规律出来了: 
> 假设初始标记count = 1 
> 每行总数字为：10**count * 9 * (count+1) 
>
> 另外关于整除后的余数：
> 如果没有余数，那结果就是基数（10**count） + 商 - 1，然后获取这个数的最后一个数字即可
> 如果有余数，那结果就是基数（10**count） + 商，获取到当前的数字，然后 余数-1 找到对应index返回即可
>
> 作者：qingfengpython
> 链接：https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof/solution/lai-kan-kan-fen-xi-ni-hui-jue-de-zhe-dao-3o0e/
> 来源：力扣（LeetCode）
> 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

```java
class Solution {
  public int findNthDigit(int n) {
    if(n<10){
      return n;
    }
    // 找到第 n 位对应的数字 number 
    // 以及第 n 位在数字 number 中的是第几位
    long sum = 10;
    long ten = 10;
    int i =1;
    while ((long)n+1 > sum) {
      long newColumnSum = (i + 1) * ten * 9;
      if (sum + newColumnSum > (long)n+1) {
        break;
      }
      sum +=newColumnSum;
      i++;
      ten *= 10;
    }
    if(n+1==sum){
      return 9;
    }
    long number = ten + (n - sum) / (i+1);
    int digit = i-(n - (int)sum) % (i+1);
    // 把数字 number 的第 digit 位返回
    int res = 0;
    while (digit != -1) {
      res = (int)(number % 10);
      number = number / 10;
      digit--;
    }
    return res;
  }
}
```

