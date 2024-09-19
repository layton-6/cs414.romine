// William Romine
// 00103649
// Dr. Lewis CS414

#include <functional>
#include <map>
#include <iostream>

struct Switch {
private:
    std::map<int, std::function<void()>> switchMap;

public:
    // Set underlying map object
    void setSwitchMap(const std::map<int, std::function<void()>>& map) {
        switchMap = map;
    }

    // Get underlying map object
    std::map<int, std::function<void()>> getSwitchMap() const {
        return switchMap;
    }

    void operator()(int key) const {
        auto it = switchMap.find(key);
        if (it != switchMap.end()) {
            (it->second)();
        }
    }
};

int main() {
    Switch switchObj;

    auto func1 = []() { std::cout << "Case 1" << std::endl; };
    auto func2 = []() { std::cout << "Case 2" << std::endl; };
    auto func3 = []() { std::cout << "Case 3" << std::endl; };

    // Map with integer keys and function objects
    std::map<int, std::function<void()>> switchMap = {{1, func1}, {2, func2}, {3, func3}};

    switchObj.setSwitchMap(switchMap);

    // Testing
    switchObj(1);  // Should be output: Case 1
    switchObj(2);  // Should be output: Case 2
    switchObj(3);  // Should be output: Case 3
    switchObj(4);  // Should not be an output (no matching case)

    return 0;
}