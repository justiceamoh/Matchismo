//
//  Card.h
//  Matchismo
//
//  Created by Justice Amoh on 6/15/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString * contents;
@property (nonatomic,getter=isMatched) BOOL matched;
@property (nonatomic,getter=isChosen) BOOL chosen;

- (int)match:(NSArray *) otherCards;

@end
