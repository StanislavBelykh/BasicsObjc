//
//  main.m
//  BasicsObjc
//
//  Created by Станислав Белых on 10.09.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

#import <Foundation/Foundation.h>

struct UserStore {
    NSMutableArray *users;
};
typedef struct UserStore UserStore;

void addUserInStore(struct UserStore store) {
    char nameChar[40];
    NSString *user;
    printf("Введите имя пользователя для добавление в список: \n");
    scanf("%s", nameChar);
    
    user = [NSString stringWithCString: nameChar encoding:1];
    [store.users addObject: user];
};

UserStore createStoreList() {
    UserStore userStore;
    userStore.users = [NSMutableArray array];
    do {
        char answer;
        printf("Внести еще одного пользователя? (y/n) \n");
        scanf("%s", &answer);
        if (answer == 'n') {
            return userStore;
        } else if (answer == 'y') {
            addUserInStore(userStore);
            continue;
        } else {
            printf("неверная команда попробуйте еще раз \n");
            continue;
        }
        
    } while (true);
};

void printUsersForStore(struct UserStore store) {
    for (int i = 0; i < store.users.count; i++) {
        NSLog(@"User # %d: %@ \n", i, store.users[i]);
    }
};

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
        UserStore userStore;
        userStore = createStoreList();
        printUsersForStore(userStore);

        double first;
        double second;
        char operation;
        
        printf("Введите первую цифру: \n");
        scanf("%lf", &first);
        printf("Введите вторую цифру: \n");
        scanf("%lf", &second);
        printf("Введите знак операции: \n");
        scanf("%s", &operation);
        switch (operation) {
            case '+':
                printf("Result: %0.2f \n", mathFunc(plus, first, second) );
                break;
            case '-':
                printf("Result: %0.2f \n", mathFunc(minus, first, second) );
                break;
            case '/':
                printf("Result: %0.2f \n", mathFunc(divide, first, second) );
                break;
            case '*':
                printf("Result: %0.2f \n", mathFunc(multiply, first, second) );
                break;
            default:
                printf("Ошибка! Не верно введен знак операции!");
                break;
        }
    }
    return 0;
}
