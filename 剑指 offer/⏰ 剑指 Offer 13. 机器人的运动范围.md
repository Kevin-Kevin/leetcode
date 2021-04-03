#### [剑指 Offer 13. 机器人的运动范围](https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/)

难度中等260

地上有一个m行n列的方格，从坐标 `[0,0]` 到坐标 `[m-1,n-1]` 。一个机器人从坐标 `[0, 0] `的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

 

**示例 1：**

```
输入：m = 2, n = 3, k = 1
输出：3
```

**示例 2：**

```
输入：m = 3, n = 1, k = 0
输出：1
```

**提示：**

- `1 <= n,m <= 100`
- `0 <= k <= 20`

#### 解法一 回溯法深度优先搜索

细读题目会发现只要向右或者向下移动, 所以向上和向下可以忽略

```java
class Solution {
    int res = 0;
    public int movingCount(int m, int n, int k) {
      int[][] isAccessed = new int[n][m];
      dfs(isAccessed, k, 0, 0);
      return res;
    }
    public void dfs(int[][] isAccessed, int k, int x, int y){
      // 超出边界 或 已经访问过 , 直接返回 
      if(x<0 || y<0 || x>=isAccessed[0].length || y>=isAccessed.length || isAccessed[y][x]==1){
        return;
      }
      // 计算数位之和
      int sumX = 0;
      int sumY = 0;
      int m = x;
      while(m!=0){
        sumX += m%10;
        m = m/10;
      }
      m = y;
      while(m!=0){
        sumY += m%10;
        m = m/10;
      }
      // 数位和大于 k 直接返回
      if(sumX+sumY>k){
        return;
      }
      isAccessed[y][x] = 1;
      res++;
      dfs(isAccessed, k, x+1, y);
      // dfs(isAccessed, k, x-1, y);
      dfs(isAccessed, k, x, y+1);
      // dfs(isAccessed, k, x, y-1);

    }
}
```

#### 解法一优化 数位和的计算

由于每次 x, y 的变化都是加一, 每次只需计算 x*x* 到 x \pm 1*x*±1 的**数位和增量**。

本题说明 1≤*n*,*m*≤100 ，公式仅在此范围适用。

>  不太喜欢return 的时候写一堆东西, 不喜欢这种代码风格, 就算 if 执行语句只有一行我都要放到 {} 里面

```java
class Solution {
    int m, n, k;
    boolean[][] visited;
    public int movingCount(int m, int n, int k) {
        this.m = m; this.n = n; this.k = k;
        this.visited = new boolean[m][n];
        return dfs(0, 0, 0, 0);
    }
    public int dfs(int i, int j, int si, int sj) {
        if(i >= m || j >= n || k < si + sj || visited[i][j]) return 0;
        visited[i][j] = true;
        return 1 + dfs(i + 1, j, (i + 1) % 10 != 0 ? si + 1 : si - 8, sj) + dfs(i, j + 1, si, (j + 1) % 10 != 0 ? sj + 1 : sj - 8);
    }
}

```



#### 解法二 广度优先搜索

使用辅助队列, 每次都出列

然后将弹出的位置结点的符合要求的右方格和下方格入列

res++

> 和二叉树的广度优先搜索差不太多, 把课本的数据结构与算法实现一遍真的有用

#### 解法三 动态规划



