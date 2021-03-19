#### [剑指 Offer 50. 第一个只出现一次的字符](https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/)

> 难度 简单
>
> 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。
>
> **示例:**
>
> ```
> s = "abaccdeff"
> 返回 "b"
> 
> s = "" 
> 返回 " "
> ```
>
>  
>
> **限制：**
>
> ```
> 0 <= s 的长度 <= 50000
> ```



#### 解法

####  

> 用哈希表记录, 字符是 key ,次数是 value
>
> 遍历两次 string
>
> 第一次 put (key, value)
>
> 第二次找出第一个只出现一次的字符
>
> ps : 最快的答案没有用哈希表, 而是遍历'a'-'z', 使用 string.indexof() 和 lastindexof, 如果字符只出现一次, 记录位置, 找到位置最前的字符



```java
class Solution {
  public char firstUniqChar(String s) {
    int[] hashTable = new int[128]; 
    char[] charArray = s.toCharArray();   
    for( char c : charArray){
      hashTable[c]++;
    }
    for( char c : charArray){
      if( hashTable[c] == 1){
        return c;
      }
    }
    return ' ';
  }

}	
```

