//
//  OddInfo.h
//
//  Created by   on 02/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OddInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *oddInfoIdentifier;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *points;
@property (nonatomic, strong) NSString *overMoney;
@property (nonatomic, strong) NSString *underMoney;
@property (nonatomic, strong) NSString *lineType;
@property (nonatomic, strong) NSString *teamNumber;
@property (nonatomic, strong) NSString *mL;
@property (nonatomic, strong) NSString *sportsbookId;
@property (nonatomic, strong) NSString *timeStamp;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *eventNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
