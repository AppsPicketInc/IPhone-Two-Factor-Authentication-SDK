//
//  SecureKeys.h
//  I2FA
//
//  Created by Noopur Virmani on 18/11/16.
//  Copyright © 2016 Noopur Virmani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BigInteger.h"

@interface SecureKeys : NSObject

@property (nonatomic,strong) BigInteger *k1;
@property (nonatomic,strong) BigInteger *key;
@property (nonatomic,strong) BigInteger *pk;
@property (nonatomic,strong) BigInteger *com;
@property (nonatomic,strong) BigInteger *l;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *pwd;

-(id) initWithKey:(BigInteger*)keyL pk:(BigInteger *)pkL username: (NSString *) usernameL pwd: (NSString*)pwdL ;
-(BigInteger *)getKey;
-(NSString *)getPK;

@end

