#### [剑指 Offer 12. 矩阵中的路径](https://leetcode-cn.com/problems/ju-zhen-zhong-de-lu-jing-lcof/)

难度中等289

请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

[["a","**b**","c","e"],
["s","**f**","**c**","s"],
["a","d","**e**","e"]]

但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

 

**示例 1：**

```
输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
输出：true
```

**示例 2：**

```
输入：board = [["a","b"],["c","d"]], word = "abcd"
输出：false
```

 

**提示：**

- `1 <= board.length <= 200`
- `1 <= board[i].length <= 200`

#### 解法一 深度优先搜索 + 哈希表(超时)

> 该解法超过了 leetcode 时间要求

对于矩阵中的每一个字母, 进行比较

和给定的 word 的第一个字母一样的就对这个位置进行深度优先搜索

搜索过程中用哈希表记录已经走过的字母路径

```java
class Solution {
  Integer key;
  public boolean exist(char[][] board, String word) {
    HashMap<Integer, String> map = new HashMap<>();
    char[] charsWord = word.toCharArray();
    for(int y=0; y<board.length; y++){
      for(int x=0; x<board[0].length; x++){
        if(board[y][x] == word.charAt(0)){
          map.clear();
          key = -1;
          if( bfs(board, charsWord, x, y, map) ){
            return true;
          }
        }
      }
    }
    return false;
  }
  public boolean bfs(char[][] board, char[] word,int x, int y, HashMap map){
    if(key+1 < word.length && board[y][x] == word[key+1]){
      map.put(++key, String.valueOf(x)+String.valueOf(y));
    }else{

      return false;
    }
    if(key == word.length-1){
      return true;
    }
    boolean up=false;
    boolean down = false;
    boolean left = false;
    boolean right = false;
    // up
    if(y-1>=0 && !map.containsValue(String.valueOf(x)+String.valueOf(y-1))){
      up = bfs(board, word, x, y-1, map);
    }
    // down
    if(y+1<board.length && !map.containsValue(String.valueOf(x)+String.valueOf(y+1))){
      down = bfs(board, word, x, y+1, map);
    }
    // left
    if(x-1>=0 && !map.containsValue(String.valueOf(x-1)+String.valueOf(y))){
      left = bfs(board, word, x-1, y, map);
    }
    // right
    if(x+1<board[0].length && !map.containsValue(String.valueOf(x+1)+String.valueOf(y))){
      right = bfs(board, word, x+1, y, map);
    }
    if(up || down || left || right){
      return true;
    }else{
      map.remove(key);
      key--;
      return false;
    }

  }
}
```

#### 解法一改进

> 看大佬题解总结的
>
> java 的二维数组真的慢, 优化后把 `board[][]`放在 if 外面居然超时了
>
> 不创建变量 up, down... 直接判断四个递归的 或结果 可以快一点

依然是深度优先搜索, 但是优化了程序结构

1. 首先是深度优先搜索的时候, 把要注意的边界问题放到一起

2. 然后是取消了哈希表, 减少了每次查看以前是否走过该字母的时间开销

   使用word 本身记录走过的路径

   然后每次递归调用开始的时候置走到的 `board[][]` 字母为 0

   结束时把 word 对应的字母赋给 `board[][]`

3. 原本使用类间变量 key 来记录走到了 word 哪一个字母, 这样每次都要加一减一, 太麻烦, 把 key 当做参数传进去, 然后每次都+1 递归

```java
import java.util.HashMap;

class Solution {
  public boolean exist(char[][] board, String word) {
    char[] charsWord = word.toCharArray();
    for(int y=0; y<board.length; y++){
      for(int x=0; x<board[0].length; x++){
        if(board[y][x] == word.charAt(0)){
          if( dfs(board, charsWord, x, y, 0) ){
            return true;
          }
        }
      }
    }
    return false;
  }
  public boolean dfs(char[][] board, char[] word,int x, int y, int key){
    if(y<0 || y>=board.length || x<0 || x>=board[0].length || board[y][x] != word[key]){
      return false;
    }
    if(key == word.length-1){
      return true;
    }
    board[y][x] = '\0';

    boolean res = ( dfs(board, word, x, y-1, key+1) || dfs(board, word, x, y+1, key+1) || dfs(board, word, x-1, y, key+1) || dfs(board, word, x+1, y, key+1) );

    if(res){
      return true;
    }else{
      board[y][x] = word[key];
      return false;
    }
  }
}
```



