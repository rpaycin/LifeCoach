
#import "APIManager.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "JSONModel.h"
#import "sporYonetim.h"
#import "HelperMethods.h"
#import "AntremanUye.h"
#import "Antreman.h"
#import "AntremanEgzersiz.h"
#import "MainInformationModel.h"
#import "MemberTrainingRequest.h"
#import "GetTrainingForSelectedDateRequest.h"
#import "GetTrainingForSelectedDateResponse.h"

#define LOGIN_CONTROL_URL [NSString stringWithFormat:@"/api/Sport/LoginControl"]
#define TRAINING_MEMBER_URL [NSString stringWithFormat:@"/api/Sport/GetTrainingsForMember"]
#define TRAINING_MOTION_URL [NSString stringWithFormat:@"/api/Sport/GetTrainingsForMotion"]
#define TRAINING_URL [NSString stringWithFormat:@"/api/Sport/GetTrainings"]
#define MAIN_INFORMATION [NSString stringWithFormat:@"/api/Sport/GetMainInformation"]
#define START_AND_FINISH_URL [NSString stringWithFormat:@"/api/Sport/AddStartAndFinish"]
#define TRAINING_FOR_SELECTEDDATE [NSString stringWithFormat:@"/api/Sport/GetTrainingForSelectedDate"]


@implementation APIManager

+ (id)sharedManager {
    static APIManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id) init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void) postToAPI : (NSString *) url withParams : (NSDictionary *) params completion:(void (^)(id response, NSError *error))completion {
    NSMutableDictionary *requestParams = [NSMutableDictionary dictionaryWithDictionary:params];
    
    //hud
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[APP_DELEGATE window ] animated:false];
    hud.labelText=@"Yükleniyor...";

    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
        hud.transform = CGAffineTransformMakeRotation(0.015309886183790671537767526745028724);
    
    //manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];

    NSString *completeUrl = [NSString stringWithFormat:@"%@%@",DEFAULT_SERVER_ADDRESS,url];

    [manager POST:completeUrl parameters:requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(DEBUG_MODE) {
            NSLog(@"API Response : %@ Status code : %ld",responseObject,(long)operation.response.statusCode);
        }
        completion(responseObject,nil);
        
        [hud hide:YES];
        [hud removeFromSuperview];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil,error);
        
        [hud hide:YES];
        [hud removeFromSuperview];
        
        if(DEBUG_MODE) {
            NSLog(@"API Error : %@ Status code : %ld",[error localizedDescription],(long)operation.response.statusCode);
        }
    }];
}

-(NSMutableArray*) convertArray:(id)array toClass:(Class) class{
    
    NSMutableArray *tempArray = [NSMutableArray new];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        @try {
            
            JSONModelError* error=nil;
            
            id response= [[class alloc] initWithDictionary:obj error:&error];
            
            if(error!=nil)
                NSLog(@"%@",error);
            else
                [tempArray addObject:response];
        }
        @catch (NSException *exception) {
        }
        
    }];
    return tempArray;
}

#pragma mark - API Methods
- (void) loginControl: (NSString *)email password:(NSString*)password completion : (void (^)(id result_array, NSError *error)) block {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",LOGIN_CONTROL_URL];

    NSDictionary *parameters = @{@"email": email,@"password":password};
    
    [self postToAPI:urlWithParams withParams:parameters completion:^(id response, NSError *error) {
        if(error == nil) {
            [HelperMethods saveUserDefaults:MemberID andValue:[response objectForKey:@"ID"]];
            [HelperMethods saveUserDefaults:MemberName andValue:[response objectForKey:@"Name"]];
            [HelperMethods saveUserDefaults:CompanyID andValue:[response objectForKey:@"CompanyID"]];
            
            block(response,nil);
        } else {
            block(false,error);
        }
    }];
}


- (void) getTrainingsForMember: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block  {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",TRAINING_MEMBER_URL];

    [self postToAPI:urlWithParams withParams:[request prepareRequestDictionary] completion:^(id response, NSError *error) {
        if(error == nil) {
            id results= [self convertArray:[response objectForKey:@"List"] toClass:[Antreman class]];
            block(results,nil);
        } else {
            block(false,error);
        }
    }];
}

- (void) getTrainingsForMotion: (NSString *)trainingID completion : (void (^)(id result_array, NSError *error)) block  {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",TRAINING_MOTION_URL];
    
    NSDictionary *parameters = @{@"TrainingID": trainingID};
    
    [self postToAPI:urlWithParams withParams:parameters completion:^(id response, NSError *error) {
        if(error == nil) {
            id results= [self convertArray:[response objectForKey:@"List"] toClass:[AntremanEgzersiz class]];
            block(results,nil);
        } else {
            block(false,error);
        }
    }];
}

- (void) getMainInformation: (BaseRequest *)request completion : (void (^)(id result_array, NSError *error)) block  {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",MAIN_INFORMATION];
    
    [self postToAPI:urlWithParams withParams:[request prepareRequestDictionary] completion:^(id response, NSError *error) {
        if(error == nil) {
            MainInformationModel *model=[MainInformationModel new];
            model.LastTrainingName= [response objectForKey:@"LastTrainingName"];
            model.TrainingWeekList= [response objectForKey:@"TrainingWeekList"];
            
            block(model,nil);
        } else {
            block(false,error);
        }
    }];
}


- (void) addStartAndFinish: (MemberTrainingRequest *)request completion : (void (^)(id result_array, NSError *error)) block  {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",START_AND_FINISH_URL];
    
    NSString *str=request.toJSONString;
    
    [self postToAPI:urlWithParams withParams:request.toDictionary completion:^(id response, NSError *error) {
        if(error == nil) {
            block(response,nil);
        } else {
            block(false,error);
        }
    }];
}

- (void) getTrainingForSelectedDate: (GetTrainingForSelectedDateRequest *)request completion : (void (^)(id result_array, NSError *error)) block  {
    NSString *urlWithParams = [NSString stringWithFormat:@"%@",TRAINING_FOR_SELECTEDDATE];

    
    [self postToAPI:urlWithParams withParams:request.toDictionary completion:^(id response, NSError *error) {
        if(error == nil) {
            id results= [self convertArray:[response objectForKey:@"List"] toClass:[GetTrainingForSelectedDateResponse class]];
            block(results,nil);
        } else {
            block(false,error);
        }
    }];
}

@end