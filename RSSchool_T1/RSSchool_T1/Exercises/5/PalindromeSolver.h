#import <Foundation/Foundation.h>

@interface PalindromeSolver : NSObject

- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k;

@end

@interface PalindromeSolver ()

+(NSUInteger)countReplaceInString: (NSString*)string;

@end
