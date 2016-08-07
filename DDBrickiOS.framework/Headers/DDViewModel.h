//
//  DDViewModel.h
//  DDBrickDemo
//
//  Created by amoblin on 16/5/24.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "DDBaseData.h"

@interface DDViewModel : NSObject

@property (nonatomic, strong, readonly) NSArray *dataArray;

- (instancetype)initWithDataArray:(NSArray *)dataArray;
- (void)setDataArray:(NSArray *)dataArray;

- (NSInteger)count;
- (DDBaseData *) dataAtIndex:(NSUInteger )index;

// protected method
- (Class) cellClassForData:(DDBaseData *)data withSuffix:(NSString *)suffix;

#if TARGET_OS_IPHONE

- (Class)tableViewCellClassForIndexPath:(NSIndexPath *)indexPath;

#endif

- (DDBaseData *) dataForIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath withClass:(Class)class;

@end
