#### [剑指 Offer 58 - I. 翻转单词顺序](https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/)

难度简单77

输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。

 

**示例 1：**

```
输入: "the sky is blue"
输出: "blue is sky the"
```

**示例 2：**

```
输入: "  hello world!  "
输出: "world! hello"
解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
```

**示例 3：**

```
输入: "a good   example"
输出: "example good a"
解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
```

 

**说明：**

- 无空格字符构成一个单词。
- 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
- 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

#### 解法

分割字符串, 并逆序放入到新字符串

难点在于 string 的用法以及如何分割字符串

```java
class Solution {
    public String reverseWords(String s) {
      char[] chars = s.toCharArray();
      int length = chars.length;
      int start=0;
      int end = length-1;
      int i=length-1;
      StringBuffer sb = new StringBuffer();   
      while(i>=0){
        // 找到单词前面最后一个空格
        while(i>=0 && chars[i]!=' '){
          i--;
        }
        start = i+1;
        // 将找到的单词放入 sb
        if(end-start+1>0){
          char[] newChars = new char[end-start+1];
          for(int index= start;index<=end;index++){
            newChars[index-start] = chars[index];
          }
          sb.append(newChars);
          sb.append(' ');
        }
        // 找到连续空格前面最后一个字母
        while(i>=0 && chars[i]==' '){
          i--;
        }
        end = i;
      }
      // 去除最后的空格
      if(sb.length()!=0 && sb.charAt(sb.length()-1)==' '){
        sb.deleteCharAt(sb.length()-1);
      }
      return sb.toString();
    }
}
```

