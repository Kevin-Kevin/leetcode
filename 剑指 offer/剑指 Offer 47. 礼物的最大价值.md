#### [剑指 Offer 47. 礼物的最大价值](https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/)

难度中等129

在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

 

**示例 1:**

```
输入: 
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
输出: 12
解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
```

#### 解法一 动态规划

状态变量`dp[y][x]` : 在(x, y) 格子可以拿到的最大价值的礼物

状态转移方程 : `dp[y][x] = grid[y][x] + max(dp[y-1][x], dp[y][x-1])`

边界条件 : x=0, y=0

> 这里边界条件没有放到双重循环中, 可以提高速度

```java
class Solution {
    public int maxValue(int[][] grid) {
      for(int y=1; y<grid.length; y++){
        grid[y][0] += grid[y-1][0];
      }
      for(int x=1; x<grid[0].length; x++){
        grid[0][x] += grid[0][x-1];
      }
      for(int y=1; y<grid.length; y++){
        for(int x=1; x<grid[0].length; x++){
            grid[y][x] += Math.max(grid[y-1][x], grid[y][x-1]);
        }
      }
      return grid[grid.length-1][grid[0].length-1];
    }
}
```

#### 解法一的优化

> Java 一维数组的访问比二维数组快很多, 但是另一种方法空间复杂度更好

##### 数组使用一维数组

每次记录上一行对应格子的最大价值, 然后逐个更新

##### 不增加数组使用原有数组

每次 y, x 位置求出最大值后放入 `grid[y][x]` 中 

#### 解法二 深度优先搜索

用一个二维数组记录上一次访问的最大值, 然后和这一次访问的最大值比较后取最大

重复访问的格子太多, 速度慢

> 提交记录最快的是一个用逆向动态规划的, 从 (x, y) 到 (0, 0) 遍历, 但是代码判断语句太多, 而且比较难想到