//
//  main.m
//  BasicsObjc
//
//  Created by Станислав Белых on 10.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *students = [NSMutableArray array];
        
        Student *studentIvan = [[Student alloc] initWithName: @"Ivan" Surname: @"Ivanov" andAge: @20];
        Student *studentPetr = [[Student alloc] initWithName: @"Petr" Surname: @"Petrov" andAge: @30];
        Student *studentSergey = [[Student alloc] initWithName: @"Sergey" Surname: @"Sergeev" andAge: @40];
        
        [students addObject: studentIvan];
        [students addObject: studentPetr];
        [students addObject: studentSergey];
        
        NSLog(@"%lu", (unsigned long)students.count);
        
        for (Student *student in students) {
            NSLog(@"%@", student.description);
        }
        
        for (Student *student in students) {
            [student addOneYear];
            NSLog(@"%@", student.description);
        }
    }
    return 0;
}
