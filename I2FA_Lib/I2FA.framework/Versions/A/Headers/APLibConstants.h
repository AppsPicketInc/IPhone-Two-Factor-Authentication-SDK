//
//  APLibConstants.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"
#import "Value.h"
#import <CommonCrypto/CommonDigest.h>


@interface APLibConstants : NSObject

+(NSDictionary *)removeNullValues:(NSDictionary*)reponsedict;
+(NSString*)getDeviceId;
+(NSString *)extractCh:(NSDictionary *)responseDict;
+(int)getRadix;
+(BigInteger *)getP_1024;
+(BigInteger *)getQ_1024;
+(BigInteger *)getG_1024;

+ (NSString *)MD5String: (NSString *)input;


@end



