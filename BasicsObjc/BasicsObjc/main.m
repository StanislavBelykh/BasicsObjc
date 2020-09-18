//
//  main.m
//  BasicsObjc
//
//  Created by Станислав Белых on 10.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int first = 0;
        int second = 0;

        int operation = 0;

        printf("First number: \n");
        scanf("%d", &first);
        printf("Second number: \n");
        scanf("%d", &second);
        printf("Select operation! \n Enter operation number, \n 1 for sum \n 2 for subtraction \n 3 for degree \n 4 for multiplication \n Number of operation: ");
        scanf("%d", &operation);

        switch (operation) {
            case 1:
                NSLog(@"Sum %d and %d: %d", first, second, first + second);
                break;
            case 2:
                NSLog(@"Subtraction %d and %d: %d", first, second, first - second);
                break;
            case 3:
                NSLog(@"%d divided by %d: %d", first, second, first / second);
                break;
            case 4:
                NSLog(@"%d multiply %d: %d", first, second, first * second);
                break;
            default:
                printf("Error operation");
                break;
        }
        printf("\n");

        double firstAvr = 0;
        double secondAvr = 0;
        double thirdAvr = 0;
        
        printf("Enter three num \n");
        printf("First number: \n");
        scanf("%lf", &firstAvr);
        printf("Second number: \n");
        scanf("%lf", &secondAvr);
        printf("Third number: \n");
        scanf("%lf", &thirdAvr);
        
        NSLog(@"Avarage for numbers(%.2f, %.2f, %.2f): %.2f", firstAvr, secondAvr, thirdAvr, (firstAvr + secondAvr + thirdAvr)/3);
    }
    return 0;
}
