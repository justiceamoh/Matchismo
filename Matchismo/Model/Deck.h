//
//  Deck.h
//  Matchismo
//
//  Created by Justice Amoh on 6/15/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
