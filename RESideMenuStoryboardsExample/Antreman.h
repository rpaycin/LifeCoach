//
//  Antreman.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "JSONModel.h"

@interface Antreman : JSONModel

@property (nonatomic, copy) NSString<Optional> *ID;
@property (nonatomic, copy) NSString<Optional> *AntremanAdi;
@property (nonatomic, copy) NSString<Optional> *AntremanGunSayisi;
@property (nonatomic, copy) NSString<Optional> *Aciklama;
@property (nonatomic, copy) NSString<Optional> *ToplamYapialanAntremanSayisi;
@property (nonatomic, copy) NSString<Optional> *SonYapilmaTarihi;
@end
