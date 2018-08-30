//
//  Board.h
//  TicTacToeObjc
//
//  Created by Paul Wallace on 8/23/18.
//  Copyright © 2018 Paul Wallace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject
@property (nonatomic) NSMutableArray<NSMutableArray<NSNumber *> *> * board;
@property (assign) int randomNumber;
+(instancetype) boardOfSize:(int) size;
-(BOOL) canMakeMoveAt:(int)x andY:(int)y;
-(BOOL) makeMove:(int)player withX:(int)x withY:(int)y;
-(BOOL) checkWin;
@end
