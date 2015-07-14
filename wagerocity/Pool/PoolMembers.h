//
//  PoolMembers.h
//
//  Created by   on 06/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PoolMembers : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *displayname;
@property (nonatomic, assign) double lost;
@property (nonatomic, assign) double win;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double tie;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, assign) double dollars;
@property (nonatomic, assign) double rank;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
