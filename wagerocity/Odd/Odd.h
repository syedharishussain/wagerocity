//
//  TeamAOdds.h
//
//  Created by   on 03/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Odd : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *over;
@property (nonatomic, strong) NSString *under;
@property (nonatomic, strong) NSString *oddId;
@property (nonatomic, strong) NSString *point;
@property (nonatomic, strong) NSString *totalId;
@property (nonatomic, strong) NSString *pointId;
@property (nonatomic, strong) NSString *totalMid;
@property (nonatomic, strong) NSString *pointMid;
@property (nonatomic, strong) NSString *moneyId;
@property (nonatomic, strong) NSString *money;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
