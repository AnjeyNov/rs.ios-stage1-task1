#import "Parser.h"




@implementation Parser

-(id)init {
    self = [super init];
    ringScopes = @[@"(", @")"];
    triangleScopes = @[@"<", @">"];
    rectangleScopes = @[@"[", @"]"];
    return self;
}

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray <NSString*> *result = [[NSMutableArray alloc] init];
    
    NSString *currentSymbol;
    NSUInteger len = 0;
    NSString* stringForSearch;
    for(NSUInteger index = 0; index < [string length]; index+=1) {
        currentSymbol = [string substringWithRange: NSMakeRange(index, 1)];
        
        if([currentSymbol isEqualToString:[ringScopes firstObject]]) {
            
            stringForSearch = [string substringFromIndex:index+1];
            len = [Parser searchScopes:ringScopes inString:stringForSearch];
            if(len != 0){
                [result addObject:[stringForSearch substringWithRange:NSMakeRange(0, len)]];
                continue;
            }
            
        } else if ([currentSymbol isEqualToString:[triangleScopes firstObject]]) {
            
            stringForSearch = [string substringFromIndex:index+1];
            len = [Parser searchScopes:triangleScopes inString:stringForSearch];
            if(len != 0){
                [result addObject:[stringForSearch substringWithRange:NSMakeRange(0, len)]];
                continue;
            }
        } else if ([currentSymbol isEqualToString:[rectangleScopes firstObject]]) {
        
            stringForSearch = [string substringFromIndex:index+1];
            len = [Parser searchScopes:rectangleScopes inString:stringForSearch];
            if(len != 0){
                [result addObject:[stringForSearch substringWithRange:NSMakeRange(0, len)]];
                continue;
            }
        }
            
    }
        
    return result;
}

+(NSInteger)searchScopes:(NSArray<NSString *> *)scopes inString:(NSString *)string {
    NSUInteger repeat = 0;
    NSString *currentSymbol = [NSString new];
    
    for(NSInteger index = 0; index < [string length]; index += 1){
        currentSymbol = [string substringWithRange: NSMakeRange(index, 1)];
        if([currentSymbol isEqualToString:[scopes firstObject]]){
            repeat += 1;
            continue;
        }
        if ([currentSymbol isEqualToString: [scopes lastObject]])  {
            if(repeat != 0){
                repeat -= 1;
                continue;
            } else {
                return index;
            }
        }
    }
    return 0;
}

@end


