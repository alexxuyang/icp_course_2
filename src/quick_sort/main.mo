import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";

actor {
    func quicksort(arr: [var Int], i: Nat, j: Nat): () {
        var p = i;
        var tmp = arr[i];
        var left = i;
        var right = j;

        Debug.print(debug_show((i, j, p, tmp)));
        
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

        Debug.print(debug_show((arr)));

        if (p > i + 1) {
            quicksort(arr, i, p-1);
        };

        if (j > p + 1) {
            quicksort(arr, p+1, j);
        };
    };

    public func qsort(arr: [Int]): async [Int] {
        var arr2 = Array.thaw<Int>(arr);
        quicksort(arr2, 0, arr2.size() - 1);
        Array.freeze(arr2)
    }
}