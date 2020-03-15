#import <Foundation/Foundation.h>

@interface Parser : NSObject {
    NSArray<NSString*> *ringScopes;
    NSArray<NSString*> *triangleScopes;
    NSArray<NSString*> *rectangleScopes;
}

- (id)init;

- (NSArray <NSString*>*)parseString: (NSString*)string;

@end

@interface Parser ()

+(NSInteger)searchScopes: (NSArray<NSString*>*)scopes inString:(NSString*) string;

@end

