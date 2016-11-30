//
//  BaseService.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void (^ResponseBlock)(NSDictionary *responseDict, NSString *error);

@interface BaseService : NSObject

+(void) requestForApi:(NSString *) apiCall withParams:(NSDictionary *)params response:(ResponseBlock)responseBlock;
+(NSString *)convertParamsToString:(NSDictionary*) dict;

@end
