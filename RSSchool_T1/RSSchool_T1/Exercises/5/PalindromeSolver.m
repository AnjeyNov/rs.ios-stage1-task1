#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSMutableString *result = [[NSMutableString alloc] initWithString:s];
    NSUInteger needReplace = [PalindromeSolver countReplaceInString:s];
    
    if(needReplace > [k integerValue]){
        return @"-1";
    }
    
    NSUInteger excess = [k integerValue] - needReplace;
    
    NSUInteger firstIndex = 0;
    NSUInteger secondIndex = [result length] - 1;
    NSString *firstValue;
    NSString *secondValue;
    
    for(;firstIndex < secondIndex; firstIndex += 1, secondIndex -= 1) {
        firstValue = [result substringWithRange: NSMakeRange(firstIndex, 1)];
        secondValue = [result substringWithRange:NSMakeRange(secondIndex, 1)];
        if ([firstValue intValue] != [secondValue intValue]) {
            if(([firstValue intValue] != 9 || [secondValue intValue] != 9) && excess != 0) {
                [result replaceCharactersInRange:NSMakeRange(firstIndex, 1) withString: @"9"];
                [result replaceCharactersInRange:NSMakeRange(secondIndex, 1) withString: @"9"];
                excess -= 1;
                continue;
            }
            if([firstValue intValue] > [secondValue intValue]) {
                [result replaceCharactersInRange:NSMakeRange(secondIndex, 1) withString:firstValue];
            } else {
                [result replaceCharactersInRange:NSMakeRange(firstIndex, 1) withString:secondValue];
            }
        }
    }
    
    return result;
}

+(NSUInteger)countReplaceInString:(NSString *)string {
    NSUInteger needReplace = 0;
    
    NSUInteger firstIndex = 0;
    NSUInteger secondIndex = [string length] - 1;
    NSString *firstValue;
    NSString *secondValue;
    
    for(;firstIndex < secondIndex; firstIndex += 1, secondIndex -= 1) {
        firstValue = [string substringWithRange: NSMakeRange(firstIndex, 1)];
        secondValue = [string substringWithRange:NSMakeRange(secondIndex, 1)];
        if (![firstValue isEqualToString:secondValue]) {
            needReplace +=1;
        }
    }
    return needReplace;
}



@end
