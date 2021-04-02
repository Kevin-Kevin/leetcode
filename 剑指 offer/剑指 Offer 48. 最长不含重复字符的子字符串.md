#### [剑指 Offer 48. 最长不含重复字符的子字符串](https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/)

难度中等175

请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

 

**示例 1:**

```
输入: "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```

**示例 2:**

```
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```

**示例 3:**

```
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```

 

提示：

- `s.length <= 40000`

#### 暴力法

两种写法

- 枚举所有的子串组合, 检验是否有重复, 找出无重复最长的子字符串

- 遍历, 遍历过程中找以当前字符为起始的最长无重复子串, 找出最长的

```
// 代码就不写了
```

#### 滑动窗口 + 哈希表

窗口初始时, 长度为 0, 起始点和终止点为 0

从 0处开始扩大, 将遍历过的 **字符** 和 **下标** 写入 map

遇到重复字符窗口起始点前移到重复的字符的下一个位置

遍历过程中找出窗口最大值

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
      int[] map = new int[128];
      int max = 0;
      char[] str = s.toCharArray();
      int begin = 0;
      for(int i=0;i<str.length;i++){
        int charNum = (int)(str[i]);
        if(map[charNum]!=0){
          while(begin<map[charNum]){
            map[str[begin]] = 0;
            begin++;
          }
        }
        map[charNum] = i+1;
        if(max<i-begin+1){
          max = i-begin+1;
        }
      }
      return max;
    }
}
```








