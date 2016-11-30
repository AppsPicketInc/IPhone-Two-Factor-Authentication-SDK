//
//  SecureKeyStores.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecureKeys.h"

@interface SecureKeyStores : NSObject


+(void)saveSecureKeysprefrences: (SecureKeys *) secureKeys;
+(SecureKeys *)getSecureKeysprefrences;
+(void)setUrl:(NSString*)apiUrl andDeviceId:(NSString *) deviceId;
+(NSString *)getAPIUrl;
+(NSString *)getDeviceId;

@end
