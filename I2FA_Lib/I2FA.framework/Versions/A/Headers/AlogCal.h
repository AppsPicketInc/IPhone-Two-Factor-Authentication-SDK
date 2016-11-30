//
//  AlogCal.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"
#import "APLibConstants.h"
#import "SecureKeys.h"

@interface AlogCal : NSObject

+(BigInteger *)getMin;
+(BigInteger *)getOne;
+(SecureKeys *) computePK:(NSString*)username  andPwd: (NSString*)pwdL;
+(BigInteger*) getKey:(BigInteger*)k2 andk1:(BigInteger *)k1;
+(BigInteger*) getK2:(NSString*)pwd;
+(SecureKeys*) computeCom:(SecureKeys*)secureKeys;
+(BigInteger*) computeS:(SecureKeys*)secureKeys andCh:(BigInteger *)ch ;
+(BigInteger*) random:(BigInteger*)minL andMax:(BigInteger *)maxL;

@end
