#### [剑指 Offer 40. 最小的k个数](https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/)

难度简单225

输入整数数组 `arr` ，找出其中最小的 `k` 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

 

**示例 1：**

```
输入：arr = [3,2,1], k = 2
输出：[1,2] 或者 [2,1]
```

**示例 2：**

```
输入：arr = [0,1,2,1], k = 1
输出：[0]
```

#### 解法一 快速排序后输出前 k 个数

```java
class Solution {
    public int[] getLeastNumbers(int[] arr, int k) {
      quickSort(arr, 0, arr.length-1, k);
      int[] res = new int[k];
      for(int i=0;i<k;i++){
        res[i] = arr[i];
      }
      return res;
    }
    public void quickSort(int[] arr, int left, int right, int k){
      if(left>=right){
        return;
      }
      int l = left;
      int r = right;
      int pivot = arr[left];
      while(left<right){
        while(left<right && arr[right]>=pivot ){
          right--;
        }
        int m = arr[left];
        arr[left] = arr[right];
        arr[right] = m;
        while(left<right && arr[left]<=pivot){
          left++;
        }
        m = arr[left];
        arr[left] = arr[right];
        arr[right] = m;
      }
      // 这里的条件不可以是 left>=k-1
      // 因为快速排序不能保证 l到left 中间是排好序的
      if(left==k-1){
        return;
      }
      quickSort(arr, l, left-1, k);
      quickSort(arr, left+1, r, k);
    }
}
```

#### 解法二 使用最小堆

#### 解法三 二叉搜索树

#### 解法四 计数排序