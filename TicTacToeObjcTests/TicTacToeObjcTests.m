//
//  TicTacToeObjcTests.m
//  TicTacToeObjcTests
//
//  Created by Paul Wallace on 8/25/18.
//  Copyright © 2018 Paul Wallace. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Board.h"

@interface TicTacToeObjcTests : XCTestCase
@property Board * board;
@end

@implementation TicTacToeObjcTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _board = [[Board alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _board = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    self.board.board = [NSMutableArray arrayWithCapacity:3];
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    XCTAssertFalse([_board canMakeMoveAt:0 andY:0]);
    XCTAssertTrue([_board canMakeMoveAt:1 andY:1]);
}

-(void)testCheckDiagonalTopLeftToBottomRightWin {
    self.board.board = [NSMutableArray arrayWithCapacity:3];
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @1, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@-1, @-1, @1]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@0, @-1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @0, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@-1, @-1, @0]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @0, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@1, @-1, @0]];
    XCTAssertFalse([_board checkWin]);
}

-(void)testCheckDiagonalBottomLeftToTopRightWin {
    self.board.board = [NSMutableArray arrayWithCapacity:3];
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @1, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @-1, @0]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @0, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@0, @-1, @1]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @0, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    XCTAssertFalse([_board checkWin]);
}

-(void)testCheckHorizontalWins {
    self.board.board = [NSMutableArray arrayWithCapacity:3];
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @1, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @0, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@1, @-1, @1]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@1, @0, @1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@1, @0, @1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@0, @0, @0]];
    XCTAssertTrue([_board checkWin]);
    
    self.board.board[0] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    self.board.board[1] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    self.board.board[2] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    XCTAssertFalse([_board checkWin]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
