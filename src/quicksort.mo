import Debug "mo:base/Debug";

func _quicksort(arr: [var Int], i: Nat, j: Nat): () {
    var p = i;
    var tmp = arr[i];
    var left = i;
    var right = j;
    
    while (left <= right) {
        while (right >= p and arr[right] >= tmp and right != 0) {
            right := right - 1;
        };

        if (right > p) {
            arr[p] := arr[right];
            p := right;
        };

        while(left <= p and arr[left] <= tmp) {
            left := left + 1;
        };

        if (left < p) {
            arr[p] := arr[left];
            p := left;
        }
    };

    arr[p] := tmp;

    if (p > i + 1) {
        _quicksort(arr, i, p-1);
    };

    if (j > p + 1) {
        _quicksort(arr, p+1, j);
    };
};

func quicksort(arr: [var Int]): () {
    _quicksort(arr, 0, arr.size() - 1);
};

var arr: [var Int] = [var 3,1,8,2,7,5,6,4];
// var arr: [var Int] = [var 1,2,3,4,5,6,7,8];
// var arr: [var Int] = [var 8,7,6,5,4,3,2,1];
quicksort(arr);
Debug.print(debug_show(arr));
