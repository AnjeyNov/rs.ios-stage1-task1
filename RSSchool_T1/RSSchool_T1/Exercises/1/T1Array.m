#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:sadArray copyItems:YES];
    BOOL flag = true;
    while(result.count > 2 && flag) {
        flag = false;
        for(int index = 0; index < result.count - 2; index+=1){
            NSNumber *value1 = result[index];
            NSNumber *value3 = result[index+2];
            NSNumber *value2 = result[index+1];
            if( [value2 intValue] > [value1 intValue] + [value3 intValue]){
                [result removeObjectAtIndex:(index+1)];
                index -= 1;
                flag = true;
            }
        }
        
    }
    return result;
}

@end
  
