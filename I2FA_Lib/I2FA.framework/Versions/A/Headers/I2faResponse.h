//
//  I2faResponse.h
//  I2FA
//
//  Created by Noopur Virmani on 24/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface I2faResponse : NSObject

@property (nonatomic,strong) NSString *message;
@property (nonatomic, assign) BOOL status;

-(id)initWithParams:(NSDictionary *)params;
@end
