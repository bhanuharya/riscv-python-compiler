#include <stdio.h>

void bubble_sort(int lst[], int n) {
    for (int i = 0; i < n-1; i++) {
        for (int j = i+1; j < n; j++) {
            if (lst[i] > lst[j]) {
                int temp = lst[i];
                lst[i] = lst[j];
                lst[j] = temp;
            }
        }
    }
}

int main() {
    int a[] = {62, 14, 29, 1};
    int n = sizeof(a) / sizeof(a[0]);
    bubble_sort(a, n);
    
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
    return 0;
}
