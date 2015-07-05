//
//  Pool.h
//
//  Created by   on 06/07/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Pool : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isPaid;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, strong) NSString *fromDate;
@property (nonatomic, strong) NSString *senderId;
@property (nonatomic, strong) NSString *limitedSize;
@property (nonatomic, strong) NSString *matchUp;
@property (nonatomic, strong) NSString *pickGame;
@property (nonatomic, strong) NSArray *poolMembers;
@property (nonatomic, strong) NSString *internalBaseClassDescription;
@property (nonatomic, strong) NSString *receiverId;
@property (nonatomic, strong) NSString *privacy;
@property (nonatomic, strong) NSString *pickgameDateFrom;
@property (nonatomic, strong) NSString *poolImage;
@property (nonatomic, strong) NSString *poolLeague;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *regStartDate;
@property (nonatomic, strong) NSString *dateTime;
@property (nonatomic, strong) NSString *wagerType;
@property (nonatomic, strong) NSString *joinedMembers;
@property (nonatomic, strong) NSString *games;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSArray *commisioner;
@property (nonatomic, strong) NSString *toDate;
@property (nonatomic, strong) NSString *minPeople;
@property (nonatomic, strong) NSString *poolStatus;
@property (nonatomic, strong) NSString *poolType;
@property (nonatomic, strong) NSString *pickgameDateTo;
@property (nonatomic, strong) NSString *poolId;
@property (nonatomic, strong) NSString *regEndDate;
@property (nonatomic, strong) NSString *amount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
