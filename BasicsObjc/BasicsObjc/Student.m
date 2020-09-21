//
//  Student.m
//  BasicsObjc
//
//  Created by Станислав Белых on 21.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName: (NSString *)name Surname: (NSString *) surname andAge: (NSNumber *) age {
    self = [super init];
    if (self != nil) {
        _name = name;
        _surname = surname;
        _age = age;
    }
    return self;
}

- (NSString *)fullname {
    NSString *nameWithSpace = [_name stringByAppendingString: @" "];
    return [nameWithSpace stringByAppendingString: _surname];
}

- (void)addOneYear {
    _age = [NSNumber numberWithInteger: ([_age integerValue] + 1)];
}

- (NSString *)description {
    NSString *fullname = [self fullname];
    NSString *descriptionString = [NSString stringWithFormat: @"Student: %@, age: %@", fullname, _age.stringValue];
    return descriptionString;
}

@end
