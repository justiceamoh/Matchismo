//
//  ViewController.m
//  Matchismo
//
//  Created by Justice Amoh on 6/13/14.
//  Copyright (c) 2014 Justice Amoh. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
            
@property (nonatomic) Deck *deck;
@property (nonatomic) CardMatchingGame *game;
@property (nonatomic) Card *previousCard;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameMessageLabel;
@end

@implementation ViewController

- (CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}


- (Deck *) deck
{
    if (!_deck) _deck = [self createDeck]; //lazy instantiation
    return _deck;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}
- (IBAction)touchNewGameButton {
    self.deck = nil;
    self.game = nil;
    self.previousCard = nil;
    [self updateUI];
    
}


- (IBAction)touchCardButton:(UIButton *)sender
{

    NSInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    [self updateGameMessage:cardIndex];

}

- (void) updateUI
{
    self.gameMessageLabel.text=@"";
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
}

- (void) updateGameMessage:(NSInteger)cardIndex
{
    Card *card = [self.game cardAtIndex:cardIndex];
    
    if (self.previousCard) {
        if (card.isMatched) {
            self.gameMessageLabel.text = [NSString stringWithFormat:@"Matched %@ %@ for %d points!",self.previousCard.contents,card.contents,MATCH_BONUS];
            self.previousCard = nil;
        } else {
            self.gameMessageLabel.text = [NSString stringWithFormat:@"%@%@ don't match! -%d points!",self.previousCard.contents,card.contents,MISMATCH_PENALTY];
                self.previousCard = card;
        }
    } else {
        self.gameMessageLabel.text = card.contents;
        self.previousCard = card;
    }
    

}



- (NSString *) titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
