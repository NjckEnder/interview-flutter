(int min, int max) miniMaxSum(List<int> arr) {

  arr.sort(); // Sắp xếp mảng theo thứ tự tăng dần

  int minSum = 0;
  int maxSum = 0;

  int n = arr.length;
  int sum = 0;

  // Tính tổng tất cả các phần tử trong mảng
  for (int i = 0; i < n; i++) {
    sum += arr[i];
  }

  // Tính tổng nhỏ nhất bằng cách trừ đi phần tử lớn nhất
  minSum = sum - arr[n - 1];

  // Tính tổng lớn nhất bằng cách trừ đi phần tử nhỏ nhất
  maxSum = sum - arr[0];

  print('$minSum $maxSum');
  return (minSum,maxSum);
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  List<int> arr2 = [1,3,5,7,9];
  miniMaxSum(arr);
  miniMaxSum(arr2);
}