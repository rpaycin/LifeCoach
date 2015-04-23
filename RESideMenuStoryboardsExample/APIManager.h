

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
#import "MemberTrainingRequest.h"
#import "GetTrainingForSelectedDateRequest.h"

@interface APIManager : NSObject

+ (id)sharedManager;

- (void) postToAPI : (NSString *) url withParams : (NSDictionary *) params completion:(void (^)(id response, NSError *error))completion;

#pragma mark - API Methods
- (void) loginControl: (NSString *)email password:(NSString*)password completion : (void (^)(id result_array, NSError *error)) block ;

- (void) getTrainingsForMember: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block ;

- (void) getTrainingsForMotion: (NSString *)trainingID completion : (void (^)(id result_array, NSError *error)) block;

- (void) getMainInformation: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block ;

- (void) addStartAndFinish: (MemberTrainingRequest *)request completion : (void (^)(id result_array, NSError *error)) block ;

- (void) getTrainingForSelectedDate: (GetTrainingForSelectedDateRequest *)request completion : (void (^)(id result_array, NSError *error)) block  ;
@end

