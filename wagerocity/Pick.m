//
//  Pick.m
//
//  Created by   on 02/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Pick.h"
#import "OddInfo.h"
#import "User.h"


NSString *const kPickPoolName = @"pool_name";
NSString *const kPickId = @"id";
NSString *const kPickMatTimer = @"mat_timer";
NSString *const kPickBetDisOdds = @"bet_dis_odds";
NSString *const kPickResult = @"result";
NSString *const kPickBetType = @"bet_type";
NSString *const kPickOddId = @"odd_id";
NSString *const kPickStake = @"stake";
NSString *const kPickTeamANumber = @"team_A_number";
NSString *const kPickTeamAName = @"team_A_name";
NSString *const kPickTeamBPeriod = @"team_B_period";
NSString *const kPickMatCreated = @"mat_created";
NSString *const kPickCstStartTime = @"cst_start_time";
NSString *const kPickBetOt = @"bet_ot";
NSString *const kPickBetOddVal = @"bet_odd_val";
NSString *const kPickTeamBAbbr = @"team_B_abbr";
NSString *const kPickMatchId = @"match_id";
NSString *const kPickOddsVal = @"odds_val";
NSString *const kPickTeamBLogo = @"team_B_logo";
NSString *const kPickRefId = @"ref_id";
NSString *const kPickTeamBNumber = @"team_B_number";
NSString *const kPickStartTime = @"start_time";
NSString *const kPickScheduledTime = @"scheduled_time";
NSString *const kPickIsPoolBet = @"is_pool_bet";
NSString *const kPickLeagueName = @"league_name";
NSString *const kPickOddType = @"odd_type";
NSString *const kPickMatProcessed = @"mat_processed";
NSString *const kPickPoolId = @"pool_id";
NSString *const kPickTeaserPoint = @"teaser_point";
NSString *const kPickMatStatus = @"mat_status";
NSString *const kPickUsrId = @"usr_id";
NSString *const kPickIsMobileBet = @"is_mobile_bet";
NSString *const kPickBetParent = @"bet_parent";
NSString *const kPickBetProcessed = @"bet_processed";
NSString *const kPickOddInfo = @"odd_info";
NSString *const kPickTeamBName = @"team_B_name";
NSString *const kPickBetResult = @"bet_result";
NSString *const kPickTeamAAbbr = @"team_A_abbr";
NSString *const kPickOsBet = @"os_bet";
NSString *const kPickCstScheduledTime = @"cst_scheduled_time";
NSString *const kPickTeamALogo = @"team_A_logo";
NSString *const kPickTeamBNickname = @"team_B_nickname";
NSString *const kPickUserInfo = @"user_info";
NSString *const kPickMatchDet = @"match_det";
NSString *const kPickTeamANickname = @"team_A_nickname";
NSString *const kPickBetId = @"bet_id";
NSString *const kPickBetCreated = @"bet_created";
NSString *const kPickTeamAScore = @"team_A_score";
NSString *const kPickTeamBScore = @"team_B_score";
NSString *const kPickTeamName = @"team_name";
NSString *const kPickPos = @"pos";
NSString *const kPickSubleagueId = @"subleague_id";
NSString *const kPickMatPeriod = @"mat_period";
NSString *const kPickTeamAPeriod = @"team_A_period";


@interface Pick ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Pick

@synthesize poolName = _poolName;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize matTimer = _matTimer;
@synthesize betDisOdds = _betDisOdds;
@synthesize result = _result;
@synthesize betType = _betType;
@synthesize oddId = _oddId;
@synthesize stake = _stake;
@synthesize teamANumber = _teamANumber;
@synthesize teamAName = _teamAName;
@synthesize teamBPeriod = _teamBPeriod;
@synthesize matCreated = _matCreated;
@synthesize cstStartTime = _cstStartTime;
@synthesize betOt = _betOt;
@synthesize betOddVal = _betOddVal;
@synthesize teamBAbbr = _teamBAbbr;
@synthesize matchId = _matchId;
@synthesize oddsVal = _oddsVal;
@synthesize teamBLogo = _teamBLogo;
@synthesize refId = _refId;
@synthesize teamBNumber = _teamBNumber;
@synthesize startTime = _startTime;
@synthesize scheduledTime = _scheduledTime;
@synthesize isPoolBet = _isPoolBet;
@synthesize leagueName = _leagueName;
@synthesize oddType = _oddType;
@synthesize matProcessed = _matProcessed;
@synthesize poolId = _poolId;
@synthesize teaserPoint = _teaserPoint;
@synthesize matStatus = _matStatus;
@synthesize usrId = _usrId;
@synthesize isMobileBet = _isMobileBet;
@synthesize betParent = _betParent;
@synthesize betProcessed = _betProcessed;
@synthesize oddInfo = _oddInfo;
@synthesize teamBName = _teamBName;
@synthesize betResult = _betResult;
@synthesize teamAAbbr = _teamAAbbr;
@synthesize osBet = _osBet;
@synthesize cstScheduledTime = _cstScheduledTime;
@synthesize teamALogo = _teamALogo;
@synthesize teamBNickname = _teamBNickname;
@synthesize user = _user;
@synthesize matchDet = _matchDet;
@synthesize teamANickname = _teamANickname;
@synthesize betId = _betId;
@synthesize betCreated = _betCreated;
@synthesize teamAScore = _teamAScore;
@synthesize teamBScore = _teamBScore;
@synthesize teamName = _teamName;
@synthesize pos = _pos;
@synthesize subleagueId = _subleagueId;
@synthesize matPeriod = _matPeriod;
@synthesize teamAPeriod = _teamAPeriod;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.poolName = [self objectOrNilForKey:kPickPoolName fromDictionary:dict];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kPickId fromDictionary:dict];
            self.matTimer = [self objectOrNilForKey:kPickMatTimer fromDictionary:dict];
            self.betDisOdds = [self objectOrNilForKey:kPickBetDisOdds fromDictionary:dict];
            self.result = [self objectOrNilForKey:kPickResult fromDictionary:dict];
            self.betType = [self objectOrNilForKey:kPickBetType fromDictionary:dict];
            self.oddId = [self objectOrNilForKey:kPickOddId fromDictionary:dict];
            self.stake = [self objectOrNilForKey:kPickStake fromDictionary:dict];
            self.teamANumber = [self objectOrNilForKey:kPickTeamANumber fromDictionary:dict];
            self.teamAName = [self objectOrNilForKey:kPickTeamAName fromDictionary:dict];
            self.teamBPeriod = [self objectOrNilForKey:kPickTeamBPeriod fromDictionary:dict];
            self.matCreated = [self objectOrNilForKey:kPickMatCreated fromDictionary:dict];
            self.cstStartTime = [self objectOrNilForKey:kPickCstStartTime fromDictionary:dict];
            self.betOt = [self objectOrNilForKey:kPickBetOt fromDictionary:dict];
            self.betOddVal = [self objectOrNilForKey:kPickBetOddVal fromDictionary:dict];
            self.teamBAbbr = [self objectOrNilForKey:kPickTeamBAbbr fromDictionary:dict];
            self.matchId = [self objectOrNilForKey:kPickMatchId fromDictionary:dict];
            self.oddsVal = [self objectOrNilForKey:kPickOddsVal fromDictionary:dict];
            self.teamBLogo = [self objectOrNilForKey:kPickTeamBLogo fromDictionary:dict];
            self.refId = [self objectOrNilForKey:kPickRefId fromDictionary:dict];
            self.teamBNumber = [self objectOrNilForKey:kPickTeamBNumber fromDictionary:dict];
            self.startTime = [self objectOrNilForKey:kPickStartTime fromDictionary:dict];
            self.scheduledTime = [self objectOrNilForKey:kPickScheduledTime fromDictionary:dict];
            self.isPoolBet = [self objectOrNilForKey:kPickIsPoolBet fromDictionary:dict];
            self.leagueName = [self objectOrNilForKey:kPickLeagueName fromDictionary:dict];
            self.oddType = [self objectOrNilForKey:kPickOddType fromDictionary:dict];
            self.matProcessed = [self objectOrNilForKey:kPickMatProcessed fromDictionary:dict];
            self.poolId = [self objectOrNilForKey:kPickPoolId fromDictionary:dict];
            self.teaserPoint = [self objectOrNilForKey:kPickTeaserPoint fromDictionary:dict];
            self.matStatus = [self objectOrNilForKey:kPickMatStatus fromDictionary:dict];
            self.usrId = [self objectOrNilForKey:kPickUsrId fromDictionary:dict];
            self.isMobileBet = [self objectOrNilForKey:kPickIsMobileBet fromDictionary:dict];
            self.betParent = [self objectOrNilForKey:kPickBetParent fromDictionary:dict];
            self.betProcessed = [self objectOrNilForKey:kPickBetProcessed fromDictionary:dict];
    NSObject *receivedOddInfo = [dict objectForKey:kPickOddInfo];
    NSMutableArray *parsedOddInfo = [NSMutableArray array];
    if ([receivedOddInfo isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOddInfo) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOddInfo addObject:[OddInfo modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOddInfo isKindOfClass:[NSDictionary class]]) {
       [parsedOddInfo addObject:[OddInfo modelObjectWithDictionary:(NSDictionary *)receivedOddInfo]];
    }

    self.oddInfo = [NSArray arrayWithArray:parsedOddInfo];
            self.teamBName = [self objectOrNilForKey:kPickTeamBName fromDictionary:dict];
            self.betResult = [self objectOrNilForKey:kPickBetResult fromDictionary:dict];
            self.teamAAbbr = [self objectOrNilForKey:kPickTeamAAbbr fromDictionary:dict];
            self.osBet = [self objectOrNilForKey:kPickOsBet fromDictionary:dict];
            self.cstScheduledTime = [self objectOrNilForKey:kPickCstScheduledTime fromDictionary:dict];
            self.teamALogo = [self objectOrNilForKey:kPickTeamALogo fromDictionary:dict];
            self.teamBNickname = [self objectOrNilForKey:kPickTeamBNickname fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kPickUserInfo]];
            self.matchDet = [self objectOrNilForKey:kPickMatchDet fromDictionary:dict];
            self.teamANickname = [self objectOrNilForKey:kPickTeamANickname fromDictionary:dict];
            self.betId = [self objectOrNilForKey:kPickBetId fromDictionary:dict];
            self.betCreated = [self objectOrNilForKey:kPickBetCreated fromDictionary:dict];
            self.teamAScore = [self objectOrNilForKey:kPickTeamAScore fromDictionary:dict];
            self.teamBScore = [self objectOrNilForKey:kPickTeamBScore fromDictionary:dict];
            self.teamName = [self objectOrNilForKey:kPickTeamName fromDictionary:dict];
            self.pos = [self objectOrNilForKey:kPickPos fromDictionary:dict];
            self.subleagueId = [self objectOrNilForKey:kPickSubleagueId fromDictionary:dict];
            self.matPeriod = [self objectOrNilForKey:kPickMatPeriod fromDictionary:dict];
            self.teamAPeriod = [self objectOrNilForKey:kPickTeamAPeriod fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.poolName forKey:kPickPoolName];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kPickId];
    [mutableDict setValue:self.matTimer forKey:kPickMatTimer];
    [mutableDict setValue:self.betDisOdds forKey:kPickBetDisOdds];
    [mutableDict setValue:self.result forKey:kPickResult];
    [mutableDict setValue:self.betType forKey:kPickBetType];
    [mutableDict setValue:self.oddId forKey:kPickOddId];
    [mutableDict setValue:self.stake forKey:kPickStake];
    [mutableDict setValue:self.teamANumber forKey:kPickTeamANumber];
    [mutableDict setValue:self.teamAName forKey:kPickTeamAName];
    [mutableDict setValue:self.teamBPeriod forKey:kPickTeamBPeriod];
    [mutableDict setValue:self.matCreated forKey:kPickMatCreated];
    [mutableDict setValue:self.cstStartTime forKey:kPickCstStartTime];
    [mutableDict setValue:self.betOt forKey:kPickBetOt];
    [mutableDict setValue:self.betOddVal forKey:kPickBetOddVal];
    [mutableDict setValue:self.teamBAbbr forKey:kPickTeamBAbbr];
    [mutableDict setValue:self.matchId forKey:kPickMatchId];
    [mutableDict setValue:self.oddsVal forKey:kPickOddsVal];
    [mutableDict setValue:self.teamBLogo forKey:kPickTeamBLogo];
    [mutableDict setValue:self.refId forKey:kPickRefId];
    [mutableDict setValue:self.teamBNumber forKey:kPickTeamBNumber];
    [mutableDict setValue:self.startTime forKey:kPickStartTime];
    [mutableDict setValue:self.scheduledTime forKey:kPickScheduledTime];
    [mutableDict setValue:self.isPoolBet forKey:kPickIsPoolBet];
    [mutableDict setValue:self.leagueName forKey:kPickLeagueName];
    [mutableDict setValue:self.oddType forKey:kPickOddType];
    [mutableDict setValue:self.matProcessed forKey:kPickMatProcessed];
    [mutableDict setValue:self.poolId forKey:kPickPoolId];
    [mutableDict setValue:self.teaserPoint forKey:kPickTeaserPoint];
    [mutableDict setValue:self.matStatus forKey:kPickMatStatus];
    [mutableDict setValue:self.usrId forKey:kPickUsrId];
    [mutableDict setValue:self.isMobileBet forKey:kPickIsMobileBet];
    [mutableDict setValue:self.betParent forKey:kPickBetParent];
    [mutableDict setValue:self.betProcessed forKey:kPickBetProcessed];
    NSMutableArray *tempArrayForOddInfo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.oddInfo) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOddInfo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOddInfo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOddInfo] forKey:kPickOddInfo];
    [mutableDict setValue:self.teamBName forKey:kPickTeamBName];
    [mutableDict setValue:self.betResult forKey:kPickBetResult];
    [mutableDict setValue:self.teamAAbbr forKey:kPickTeamAAbbr];
    [mutableDict setValue:self.osBet forKey:kPickOsBet];
    [mutableDict setValue:self.cstScheduledTime forKey:kPickCstScheduledTime];
    [mutableDict setValue:self.teamALogo forKey:kPickTeamALogo];
    [mutableDict setValue:self.teamBNickname forKey:kPickTeamBNickname];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kPickUserInfo];
    [mutableDict setValue:self.matchDet forKey:kPickMatchDet];
    [mutableDict setValue:self.teamANickname forKey:kPickTeamANickname];
    [mutableDict setValue:self.betId forKey:kPickBetId];
    [mutableDict setValue:self.betCreated forKey:kPickBetCreated];
    [mutableDict setValue:self.teamAScore forKey:kPickTeamAScore];
    [mutableDict setValue:self.teamBScore forKey:kPickTeamBScore];
    [mutableDict setValue:self.teamName forKey:kPickTeamName];
    [mutableDict setValue:self.pos forKey:kPickPos];
    [mutableDict setValue:self.subleagueId forKey:kPickSubleagueId];
    [mutableDict setValue:self.matPeriod forKey:kPickMatPeriod];
    [mutableDict setValue:self.teamAPeriod forKey:kPickTeamAPeriod];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.poolName = [aDecoder decodeObjectForKey:kPickPoolName];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kPickId];
    self.matTimer = [aDecoder decodeObjectForKey:kPickMatTimer];
    self.betDisOdds = [aDecoder decodeObjectForKey:kPickBetDisOdds];
    self.result = [aDecoder decodeObjectForKey:kPickResult];
    self.betType = [aDecoder decodeObjectForKey:kPickBetType];
    self.oddId = [aDecoder decodeObjectForKey:kPickOddId];
    self.stake = [aDecoder decodeObjectForKey:kPickStake];
    self.teamANumber = [aDecoder decodeObjectForKey:kPickTeamANumber];
    self.teamAName = [aDecoder decodeObjectForKey:kPickTeamAName];
    self.teamBPeriod = [aDecoder decodeObjectForKey:kPickTeamBPeriod];
    self.matCreated = [aDecoder decodeObjectForKey:kPickMatCreated];
    self.cstStartTime = [aDecoder decodeObjectForKey:kPickCstStartTime];
    self.betOt = [aDecoder decodeObjectForKey:kPickBetOt];
    self.betOddVal = [aDecoder decodeObjectForKey:kPickBetOddVal];
    self.teamBAbbr = [aDecoder decodeObjectForKey:kPickTeamBAbbr];
    self.matchId = [aDecoder decodeObjectForKey:kPickMatchId];
    self.oddsVal = [aDecoder decodeObjectForKey:kPickOddsVal];
    self.teamBLogo = [aDecoder decodeObjectForKey:kPickTeamBLogo];
    self.refId = [aDecoder decodeObjectForKey:kPickRefId];
    self.teamBNumber = [aDecoder decodeObjectForKey:kPickTeamBNumber];
    self.startTime = [aDecoder decodeObjectForKey:kPickStartTime];
    self.scheduledTime = [aDecoder decodeObjectForKey:kPickScheduledTime];
    self.isPoolBet = [aDecoder decodeObjectForKey:kPickIsPoolBet];
    self.leagueName = [aDecoder decodeObjectForKey:kPickLeagueName];
    self.oddType = [aDecoder decodeObjectForKey:kPickOddType];
    self.matProcessed = [aDecoder decodeObjectForKey:kPickMatProcessed];
    self.poolId = [aDecoder decodeObjectForKey:kPickPoolId];
    self.teaserPoint = [aDecoder decodeObjectForKey:kPickTeaserPoint];
    self.matStatus = [aDecoder decodeObjectForKey:kPickMatStatus];
    self.usrId = [aDecoder decodeObjectForKey:kPickUsrId];
    self.isMobileBet = [aDecoder decodeObjectForKey:kPickIsMobileBet];
    self.betParent = [aDecoder decodeObjectForKey:kPickBetParent];
    self.betProcessed = [aDecoder decodeObjectForKey:kPickBetProcessed];
    self.oddInfo = [aDecoder decodeObjectForKey:kPickOddInfo];
    self.teamBName = [aDecoder decodeObjectForKey:kPickTeamBName];
    self.betResult = [aDecoder decodeObjectForKey:kPickBetResult];
    self.teamAAbbr = [aDecoder decodeObjectForKey:kPickTeamAAbbr];
    self.osBet = [aDecoder decodeObjectForKey:kPickOsBet];
    self.cstScheduledTime = [aDecoder decodeObjectForKey:kPickCstScheduledTime];
    self.teamALogo = [aDecoder decodeObjectForKey:kPickTeamALogo];
    self.teamBNickname = [aDecoder decodeObjectForKey:kPickTeamBNickname];
    self.user = [aDecoder decodeObjectForKey:kPickUserInfo];
    self.matchDet = [aDecoder decodeObjectForKey:kPickMatchDet];
    self.teamANickname = [aDecoder decodeObjectForKey:kPickTeamANickname];
    self.betId = [aDecoder decodeObjectForKey:kPickBetId];
    self.betCreated = [aDecoder decodeObjectForKey:kPickBetCreated];
    self.teamAScore = [aDecoder decodeObjectForKey:kPickTeamAScore];
    self.teamBScore = [aDecoder decodeObjectForKey:kPickTeamBScore];
    self.teamName = [aDecoder decodeObjectForKey:kPickTeamName];
    self.pos = [aDecoder decodeObjectForKey:kPickPos];
    self.subleagueId = [aDecoder decodeObjectForKey:kPickSubleagueId];
    self.matPeriod = [aDecoder decodeObjectForKey:kPickMatPeriod];
    self.teamAPeriod = [aDecoder decodeObjectForKey:kPickTeamAPeriod];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_poolName forKey:kPickPoolName];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kPickId];
    [aCoder encodeObject:_matTimer forKey:kPickMatTimer];
    [aCoder encodeObject:_betDisOdds forKey:kPickBetDisOdds];
    [aCoder encodeObject:_result forKey:kPickResult];
    [aCoder encodeObject:_betType forKey:kPickBetType];
    [aCoder encodeObject:_oddId forKey:kPickOddId];
    [aCoder encodeObject:_stake forKey:kPickStake];
    [aCoder encodeObject:_teamANumber forKey:kPickTeamANumber];
    [aCoder encodeObject:_teamAName forKey:kPickTeamAName];
    [aCoder encodeObject:_teamBPeriod forKey:kPickTeamBPeriod];
    [aCoder encodeObject:_matCreated forKey:kPickMatCreated];
    [aCoder encodeObject:_cstStartTime forKey:kPickCstStartTime];
    [aCoder encodeObject:_betOt forKey:kPickBetOt];
    [aCoder encodeObject:_betOddVal forKey:kPickBetOddVal];
    [aCoder encodeObject:_teamBAbbr forKey:kPickTeamBAbbr];
    [aCoder encodeObject:_matchId forKey:kPickMatchId];
    [aCoder encodeObject:_oddsVal forKey:kPickOddsVal];
    [aCoder encodeObject:_teamBLogo forKey:kPickTeamBLogo];
    [aCoder encodeObject:_refId forKey:kPickRefId];
    [aCoder encodeObject:_teamBNumber forKey:kPickTeamBNumber];
    [aCoder encodeObject:_startTime forKey:kPickStartTime];
    [aCoder encodeObject:_scheduledTime forKey:kPickScheduledTime];
    [aCoder encodeObject:_isPoolBet forKey:kPickIsPoolBet];
    [aCoder encodeObject:_leagueName forKey:kPickLeagueName];
    [aCoder encodeObject:_oddType forKey:kPickOddType];
    [aCoder encodeObject:_matProcessed forKey:kPickMatProcessed];
    [aCoder encodeObject:_poolId forKey:kPickPoolId];
    [aCoder encodeObject:_teaserPoint forKey:kPickTeaserPoint];
    [aCoder encodeObject:_matStatus forKey:kPickMatStatus];
    [aCoder encodeObject:_usrId forKey:kPickUsrId];
    [aCoder encodeObject:_isMobileBet forKey:kPickIsMobileBet];
    [aCoder encodeObject:_betParent forKey:kPickBetParent];
    [aCoder encodeObject:_betProcessed forKey:kPickBetProcessed];
    [aCoder encodeObject:_oddInfo forKey:kPickOddInfo];
    [aCoder encodeObject:_teamBName forKey:kPickTeamBName];
    [aCoder encodeObject:_betResult forKey:kPickBetResult];
    [aCoder encodeObject:_teamAAbbr forKey:kPickTeamAAbbr];
    [aCoder encodeObject:_osBet forKey:kPickOsBet];
    [aCoder encodeObject:_cstScheduledTime forKey:kPickCstScheduledTime];
    [aCoder encodeObject:_teamALogo forKey:kPickTeamALogo];
    [aCoder encodeObject:_teamBNickname forKey:kPickTeamBNickname];
    [aCoder encodeObject:_user forKey:kPickUserInfo];
    [aCoder encodeObject:_matchDet forKey:kPickMatchDet];
    [aCoder encodeObject:_teamANickname forKey:kPickTeamANickname];
    [aCoder encodeObject:_betId forKey:kPickBetId];
    [aCoder encodeObject:_betCreated forKey:kPickBetCreated];
    [aCoder encodeObject:_teamAScore forKey:kPickTeamAScore];
    [aCoder encodeObject:_teamBScore forKey:kPickTeamBScore];
    [aCoder encodeObject:_teamName forKey:kPickTeamName];
    [aCoder encodeObject:_pos forKey:kPickPos];
    [aCoder encodeObject:_subleagueId forKey:kPickSubleagueId];
    [aCoder encodeObject:_matPeriod forKey:kPickMatPeriod];
    [aCoder encodeObject:_teamAPeriod forKey:kPickTeamAPeriod];
}

- (id)copyWithZone:(NSZone *)zone
{
    Pick *copy = [[Pick alloc] init];
    
    if (copy) {

        copy.poolName = [self.poolName copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.matTimer = [self.matTimer copyWithZone:zone];
        copy.betDisOdds = [self.betDisOdds copyWithZone:zone];
        copy.result = [self.result copyWithZone:zone];
        copy.betType = [self.betType copyWithZone:zone];
        copy.oddId = [self.oddId copyWithZone:zone];
        copy.stake = [self.stake copyWithZone:zone];
        copy.teamANumber = [self.teamANumber copyWithZone:zone];
        copy.teamAName = [self.teamAName copyWithZone:zone];
        copy.teamBPeriod = [self.teamBPeriod copyWithZone:zone];
        copy.matCreated = [self.matCreated copyWithZone:zone];
        copy.cstStartTime = [self.cstStartTime copyWithZone:zone];
        copy.betOt = [self.betOt copyWithZone:zone];
        copy.betOddVal = [self.betOddVal copyWithZone:zone];
        copy.teamBAbbr = [self.teamBAbbr copyWithZone:zone];
        copy.matchId = [self.matchId copyWithZone:zone];
        copy.oddsVal = [self.oddsVal copyWithZone:zone];
        copy.teamBLogo = [self.teamBLogo copyWithZone:zone];
        copy.refId = [self.refId copyWithZone:zone];
        copy.teamBNumber = [self.teamBNumber copyWithZone:zone];
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.scheduledTime = [self.scheduledTime copyWithZone:zone];
        copy.isPoolBet = [self.isPoolBet copyWithZone:zone];
        copy.leagueName = [self.leagueName copyWithZone:zone];
        copy.oddType = [self.oddType copyWithZone:zone];
        copy.matProcessed = [self.matProcessed copyWithZone:zone];
        copy.poolId = [self.poolId copyWithZone:zone];
        copy.teaserPoint = [self.teaserPoint copyWithZone:zone];
        copy.matStatus = [self.matStatus copyWithZone:zone];
        copy.usrId = [self.usrId copyWithZone:zone];
        copy.isMobileBet = [self.isMobileBet copyWithZone:zone];
        copy.betParent = [self.betParent copyWithZone:zone];
        copy.betProcessed = [self.betProcessed copyWithZone:zone];
        copy.oddInfo = [self.oddInfo copyWithZone:zone];
        copy.teamBName = [self.teamBName copyWithZone:zone];
        copy.betResult = [self.betResult copyWithZone:zone];
        copy.teamAAbbr = [self.teamAAbbr copyWithZone:zone];
        copy.osBet = [self.osBet copyWithZone:zone];
        copy.cstScheduledTime = [self.cstScheduledTime copyWithZone:zone];
        copy.teamALogo = [self.teamALogo copyWithZone:zone];
        copy.teamBNickname = [self.teamBNickname copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.matchDet = [self.matchDet copyWithZone:zone];
        copy.teamANickname = [self.teamANickname copyWithZone:zone];
        copy.betId = [self.betId copyWithZone:zone];
        copy.betCreated = [self.betCreated copyWithZone:zone];
        copy.teamAScore = [self.teamAScore copyWithZone:zone];
        copy.teamBScore = [self.teamBScore copyWithZone:zone];
        copy.teamName = [self.teamName copyWithZone:zone];
        copy.pos = [self.pos copyWithZone:zone];
        copy.subleagueId = [self.subleagueId copyWithZone:zone];
        copy.matPeriod = [self.matPeriod copyWithZone:zone];
        copy.teamAPeriod = [self.teamAPeriod copyWithZone:zone];
    }
    
    return copy;
}


@end
