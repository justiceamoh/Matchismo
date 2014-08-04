//
//  PlayingCard.h
//  Matchismo
//
//  Created by Justice Amoh on 6/15/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;

@end
