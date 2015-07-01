//
//  Pick.h
//
//  Created by   on 02/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Pick : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *poolName;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *matTimer;
@property (nonatomic, strong) NSString *betDisOdds;
@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSString *betType;
@property (nonatomic, strong) NSString *oddId;
@property (nonatomic, strong) NSString *stake;
@property (nonatomic, strong) NSString *teamANumber;
@property (nonatomic, strong) NSString *teamAName;
@property (nonatomic, strong) NSString *teamBPeriod;
@property (nonatomic, strong) NSString *matCreated;
@property (nonatomic, strong) NSString *cstStartTime;
@property (nonatomic, strong) NSString *betOt;
@property (nonatomic, strong) NSString *betOddVal;
@property (nonatomic, strong) NSString *teamBAbbr;
@property (nonatomic, strong) NSString *matchId;
@property (nonatomic, strong) NSString *oddsVal;
@property (nonatomic, strong) NSString *teamBLogo;
@property (nonatomic, strong) NSString *refId;
@property (nonatomic, strong) NSString *teamBNumber;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *scheduledTime;
@property (nonatomic, strong) NSString *isPoolBet;
@property (nonatomic, strong) NSString *leagueName;
@property (nonatomic, strong) NSString *oddType;
@property (nonatomic, strong) NSString *matProcessed;
@property (nonatomic, strong) NSString *poolId;
@property (nonatomic, strong) NSString *teaserPoint;
@property (nonatomic, strong) NSString *matStatus;
@property (nonatomic, strong) NSString *usrId;
@property (nonatomic, strong) NSString *isMobileBet;
@property (nonatomic, strong) NSString *betParent;
@property (nonatomic, strong) NSString *betProcessed;
@property (nonatomic, strong) NSArray *oddInfo;
@property (nonatomic, strong) NSString *teamBName;
@property (nonatomic, strong) NSString *betResult;
@property (nonatomic, strong) NSString *teamAAbbr;
@property (nonatomic, strong) NSString *osBet;
@property (nonatomic, strong) NSString *cstScheduledTime;
@property (nonatomic, strong) NSString *teamALogo;
@property (nonatomic, strong) NSString *teamBNickname;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *matchDet;
@property (nonatomic, strong) NSString *teamANickname;
@property (nonatomic, strong) NSString *betId;
@property (nonatomic, strong) NSString *betCreated;
@property (nonatomic, strong) NSString *teamAScore;
@property (nonatomic, strong) NSString *teamBScore;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *pos;
@property (nonatomic, strong) NSString *subleagueId;
@property (nonatomic, strong) NSString *matPeriod;
@property (nonatomic, strong) NSString *teamAPeriod;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
