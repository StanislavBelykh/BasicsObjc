//
//  main.m
//  BasicsObjc
//
//  Created by Станислав Белых on 10.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>

void checkChar(char character) {
    int intChar = character;
    
    if ((intChar >= 65 && intChar <= 90) || (intChar >= 97 && intChar <= 122)){
        printf("Буква %c из английского алфавита \n", character);
    } else {
        printf("Cимвол %c не принадлежит английскому алфавиту \n", character);
    }
}

enum OperationType {
    plus,
    minus,
    divide,
    multiply
} OperationType;

double mathFunc(enum OperationType operation, double first, double second) {
    double result;
    switch (operation) {
        case plus:
            result = first + second;
            break;
        case minus:
            result = first - second;
            break;
        case divide:
            result = first / second;
            break;
        case multiply:
            result = first * second;
            break;
    }
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        checkChar('A');
        printf("Result: %0.2f \n", mathFunc(plus, 1, 1) );
    }
    return 0;
}
