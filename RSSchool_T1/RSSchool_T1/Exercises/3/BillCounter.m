#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray<NSNumber*> *forAnn = [[NSMutableArray <NSNumber*> alloc] initWithArray: bill copyItems:YES];
    [forAnn removeObjectAtIndex:index];
    int _sum = 0;
    for(NSNumber *value in forAnn){
        _sum += [value intValue];
    }
    _sum /= 2;
    if(_sum == [sum intValue]){
        return @"Bon Appetit";
    } else {
        return [[[NSNumber alloc] initWithInt:([sum intValue] - _sum)] stringValue];
    }
}

@end
