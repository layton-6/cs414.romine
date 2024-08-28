// William Romine
// 00103649
// Dr. Lewis CS414

#include <iostream>
#include <cstdlib>
#include <ctime>

// Part 1: Function to Fill Array with Random Numbers
void FillWithRandomNumbers(int data[], int size) {
    srand(static_cast<unsigned int>(time(0)));
    for (int i = 0; i < size; i++) {
        data[i] = rand() % 100001;
    }
}

// Part 2: Function to Sort the Array using Bubble Sort
void SortTheArray(int data[], int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (data[j] > data[j + 1]) {
                int temp = data[j];
                data[j] = data[j + 1];
                data[j + 1] = temp;
            }
        }
    }
}

// Part 3: Main Function
int main() {
    const int size = 10;
    int data[size];

    FillWithRandomNumbers(data, size);

    std::cout << "Unsorted Array: ";
    for (int i = 0; i < size; i++) {
        std::cout << data[i] << " ";
    }
    std::cout << std::endl;

    SortTheArray(data, size);

    std::cout << "Sorted Array: ";
    for (int i = 0; i < size; i++) {
        std::cout << data[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}