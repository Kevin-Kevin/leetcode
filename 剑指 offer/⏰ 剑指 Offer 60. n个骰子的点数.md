#### [剑指 Offer 60. n个骰子的点数](https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/)

难度中等202

把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。

 

你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。

 

**示例 1:**

```
输入: 1
输出: [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
```

**示例 2:**

```
输入: 2
输出: [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]
```

 

**限制：**

```
1 <= n <= 11
```



#### 解法一 暴力法

T=O(6^n), 肯定不符合要求

```java

class Solution {
  HashMap<Integer, Double> map;
  public double[] dicesProbability(int n) {
    map = new HashMap<>();
    int[] path = new int[n];

    dfs(n, 0, path);
    double[] res = new double[map.size()];
    int index=0;
    for(int i=0;i<=6*n;i++){
      if(map.containsKey(i)){
        res[index] = map.get(i);
        index++;
      }
    }
    return res;
  }

  public void dfs(int n, int k, int[] path) {
    if(k==n){
      int sum =0;
      for (int index : path) {
        sum += index;
      }
      double probability = Math.pow(1.0/6, n);
      if(map.containsKey(sum)){
        probability += map.get(sum);
      }
      map.put(sum, probability);
      return;
    }
    for(int i=1;i<=6;i++){
      path[k] = i;
      dfs(n, k+1, path);
    }
  }
}
```

#### 解法二 动态规划

`dp[n][s]` : n 骰子点数和为 s 的概率

`dp[n][s] =  n-1个骰子点数为 s-1, s-2,... ,s-6 的概率乘以 1/6 的和` 

```

```

