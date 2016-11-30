//
//  AuthService.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "I2faResponse.h"

@interface AuthService : NSObject

+(void) setServiceUrl:(NSString *)apiUrl;

+(void) login:(NSString *)usernameL password:(NSString *)passwordL errorBlock:(void (^)(int, NSString *))errorBlock responseBlock:(void (^)(I2faResponse *))responseBlock;

+(void) signup:(NSString *)emailL username:(NSString *)usernameL password:(NSString *)passwordL mobileNo:(NSString *)mobileNoL errorBlock:(void (^)(int, NSString *))errorBlock responseBlock:(void (^)(I2faResponse *))responseBlock;

+(void) signupOtp:(NSString *)otpL errorBlock:(void (^)(int, NSString *))errorBlock responseBlock:(void (^)(I2faResponse *))responseBlock;


@end

