

#import <Foundation/Foundation.h>
#import "BaseRequest.h"

@interface APIManager : NSObject

+ (id)sharedManager;

- (void) postToAPI : (NSString *) url withParams : (NSDictionary *) params completion:(void (^)(id response, NSError *error))completion;

#pragma mark - API Methods
- (void) loginControl: (NSString *)email password:(NSString*)password completion : (void (^)(id result_array, NSError *error)) block ;

- (void) getTrainingsForMember: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block ;

- (void) getTrainingsForMotion: (NSString *)trainingID completion : (void (^)(id result_array, NSError *error)) block;

- (void) getMainInformation: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block ;
@end

