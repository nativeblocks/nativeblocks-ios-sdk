//
//  Nativeblocks.h
//  Nativeblocks
//
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double NativeblocksVersionNumber;
FOUNDATION_EXPORT const unsigned char NativeblocksVersionString[];

NS_ASSUME_NONNULL_BEGIN

@interface ExceptionCatcher : NSObject
+ (nullable id)tryBlock:(id _Nullable(^)(void))block exception:(__autoreleasing NSException * _Nullable * _Nullable)exception;
@end

NS_ASSUME_NONNULL_END
