//
//  PlayingCard.m
//  Matchismo
//
//  Created by Justice Amoh on 6/15/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

//Override
- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count]==1) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = [otherCards firstObject];
            if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            } else if (self.rank == otherCard.rank) {
                score = 4;
            }
        }

    }
    
    return score;
}


@synthesize suit = _suit; //because we overide BOTH setter and getter

+ (NSArray *)validSuits  //Class method (uses '+') cant use properties)
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",
             @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSUInteger) maxRank { return [[self rankStrings] count]-1; }

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
