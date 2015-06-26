//
//  User.h
//
//  Created by   on 11/06/2015
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) double score;
@property (nonatomic, strong) NSString *overallrank;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, assign) double credits;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *facebookUid;
@property (nonatomic, strong) NSString *birthdate;
@property (nonatomic, strong) NSString *creationDate;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *timezone;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *currentrecord;
@property (nonatomic, strong) NSString *email;

+ (instancetype)modelObjectWithDictionary:(id)dict;
- (instancetype)initWithDictionary:(id)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
