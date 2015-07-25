//
//  Game.h
//
//  Created by   on 03/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Odd;

@interface Game : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSMutableArray *oddHolders;
@property (nonatomic, strong) Odd *oddA;
@property (nonatomic, strong) Odd *oddB;
@property (nonatomic, strong) NSString *teamBNickname;
@property (nonatomic, strong) NSString *nameA;
@property (nonatomic, strong) NSArray *sports;
@property (nonatomic, strong) NSString *fullNameB;
@property (nonatomic, strong) NSString *logoA;
@property (nonatomic, strong) NSString *teamBPitcher;
@property (nonatomic, strong) NSString *teamAPitcher;
@property (nonatomic, strong) NSString *logoB;
@property (nonatomic, strong) NSString *teamBNumber;
@property (nonatomic, strong) NSString *nameB;
@property (nonatomic, strong) NSString *teamANickname;
@property (nonatomic, strong) NSString *fullNameA;
@property (nonatomic, strong) NSString *teamANumber;
@property (nonatomic, strong) NSString *cstStartTime;
@property (nonatomic, strong) NSString *leagueName;
@property (nonatomic, strong) NSString *poolId;
@property (nonatomic, strong) NSString *pitcherA;
@property (nonatomic, strong) NSString *pitcherB;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
