#### [剑指 Offer 38. 字符串的排列](https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/)

难度中等246

输入一个字符串，打印出该字符串中字符的所有排列。

 

你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。



**示例:**

```
输入：s = "abc"
输出：["abc","acb","bac","bca","cab","cba"] 
```

**限制：**

```
1 <= s 的长度 <= 8
```

#### 解法一 回溯算法

> 这题写的时候有两个问题
>
> 1. 没有思考输入条件, 导致没有想到会有重复的字符串
>
> 2. 对于重复的字符串的剪枝做的不够好, 字符串中有重复字符只遍历一次
>
>    在第 key 次递归的时候
>
>    1. 跳过在之前的路径中的字符
>
>    2. 在字符串中有重复的只遍历一次, 这个有两种做法, 一种用哈希表记录已经遍历过的字符, 另一种是每次都看后面有没有重复的, 有就跳过
>
>       PS : 只有字母时, 哈希表可以用 26 位数组代替, asc 码表同理

```java
class Solution {
  char[] chars;
  List<String> list;
  char[] path;
  public String[] permutation(String s) {
    chars = s.toCharArray();
    list = new ArrayList<>();
    path = new char[s.length()];
    dfs(0);
    return list.toArray(new String[list.size()]);
  }
  public void dfs(int key){
    if (key == chars.length) {
      list.add(new String(path));
      return;
    }
    HashMap<Character,Integer> map = new HashMap<>();
    for (int i = 0; i < chars.length; i++) {
      if(chars[i]!='\0' && !map.containsKey(chars[i])){
        path[key] = chars[i];
        map.put(chars[i], key);
        chars[i] = '\0';
        dfs(key+1);
        chars[i] = path[key];
      }
    }
  }
}
```

