//
//  main.m
//  BasicsObjc
//
//  Created by Станислав Белых on 10.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ActionType {
    More,
    Less,
    Equal,
} ActionType ;

typedef int (^IteratorBlock) (int num, int iterationCount);
typedef int (^IteratorBlock) (int num, int iterationCount);

IteratorBlock sum = ^(int num, int iterationCount) {
    int result = 0;
    for (int i = 0; i < iterationCount; i++) {
        result += num;
    }
    return result;
};

IteratorBlock multiplication = ^(int num, int iterationCount) {
    int result = 0;
    for (int i = 0; i < iterationCount; i++) {
        result *= num;
    }
    return result;
};

typedef NSMutableArray * (^FilterBlock) (NSArray * array, ActionType operation, NSNumber* num);

FilterBlock filterOk = ^(NSArray * array, ActionType operation, NSNumber * num) {
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSNumber *i in array) {
        switch (operation) {
            case More:
                if (i.intValue > num.intValue) {
                    [resultArray addObject: i];
                }
                break;
            case Equal:
                if (i.intValue == num.intValue) {
                    [resultArray addObject: i];
                }
                break;
            case Less:
                if (i.intValue < num.intValue) {
                    [resultArray addObject: i];
                }
                break;
        }
    }
    return resultArray;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9];
        
        NSLog(@"%@", filterOk(numbers, Less, @5));
        
        dispatch_queue_t serial_queue = dispatch_queue_create("ru.example.serialQueue", NULL);
        dispatch_queue_t cuncurrent_queue = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0);
        
        __block int result = 0;

        for (int i = 0; i < 10; i++) {
            dispatch_async(serial_queue, ^{
                sleep(1);
                result += 1;
                printf("result: %d \n", result);
            });
        }

        __block int resultSync = 0;


        for (int i = 0; i < 10; i++) {
            dispatch_sync(serial_queue, ^{
                sleep(1);
                resultSync += 1;
                printf("resultSync: %d \n", resultSync);
            });
        }

        // Можно увидеть скорость выполнения оно будет гораздо быстрее остальных исполнений
        __block int resultCuncurrent = 0;

        for (int i = 0; i < 10; i++) {
            dispatch_async(cuncurrent_queue, ^{
                sleep(1);
                resultCuncurrent += 1;
                printf("resultCuncurrent: %d \n", resultCuncurrent);
            });
        }

        __block int resultCuncurrentSync = 0;


        for (int i = 0; i < 10; i++) {
            dispatch_sync(cuncurrent_queue, ^{
                sleep(1);
                resultCuncurrentSync += 1;
                printf("resultCuncurrentSync: %d \n", resultCuncurrentSync);
            });
        }
        
        //Результат будет отличный от 20 000 Так как параллельные потоки могут добавить число в один момент что приведет к потери данных
        
        __block int resultError = 0;
        
        for (int i = 0; i < 10000; i++) {
            dispatch_async(cuncurrent_queue, ^{
                resultError += 1;
            });
            dispatch_async(cuncurrent_queue, ^{
                resultError += 1;
            });
        }
        
        
        sleep(5);
        printf("resultError: %d \n", resultError);
        
    }
    return 0;
}
