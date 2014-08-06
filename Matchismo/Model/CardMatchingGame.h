//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Justice Amoh on 8/4/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define COST_TO_CHOOSE 1

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *) deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *) cardAtIndex:(NSUInteger)index;


@property (nonatomic,readonly) NSInteger score;

@end
