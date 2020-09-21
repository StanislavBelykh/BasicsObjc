//
//  Student.h
//  BasicsObjc
//
//  Created by Станислав Белых on 21.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

    @property (nonatomic, strong) NSString *name;
    @property (nonatomic, strong) NSString *surname;
    @property (nonatomic, strong, readonly) NSString *fullname;
    @property (nonatomic, readonly) NSNumber *age;

- (instancetype)initWithName: (NSString *)name Surname: (NSString *) surname andAge: (NSNumber *) age;

- (void)addOneYear;
- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
