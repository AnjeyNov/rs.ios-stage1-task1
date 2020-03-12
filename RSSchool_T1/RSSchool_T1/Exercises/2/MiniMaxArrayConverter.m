#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSArray<NSNumber*> * sorted = [[NSArray alloc] initWithArray: [array sortedArrayUsingSelector:@selector(compare:)]];
    NSMutableArray<NSNumber *> *result = [[NSMutableArray alloc] init];
    int sum = 0;
    for(NSNumber *value in sorted){
        sum += [value intValue];
    }
    [result addObject: [[NSNumber alloc] initWithInt: (sum - [[sorted lastObject] intValue])]];
    [result addObject: [[NSNumber alloc] initWithInt: (sum - [[sorted firstObject] intValue])]];
    return result;
}

@end
