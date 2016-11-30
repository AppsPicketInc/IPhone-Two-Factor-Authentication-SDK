//
//  Value.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Value : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *val;

-(id)initWithParams:(NSDictionary *)params;
@end
