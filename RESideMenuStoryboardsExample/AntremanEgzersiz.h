//
//  AntremanEgzersiz.h
//  SporYonetimi
//
//  Created by Obase Bilgisayar on 01/04/15.
//  Copyright (c) 2015 ResitEdipCompany. All rights reserved.
//

#import "JSONModel.h"

@interface AntremanEgzersiz :JSONModel

@property (nonatomic) int ID;
@property (nonatomic,copy) NSString<Optional> *Adi;
@property (nonatomic) int KasNumarasi;
@property (nonatomic,copy) NSString<Optional> *KasGrubu;
@property (nonatomic,copy) NSString<Optional> *KasGrubuImgText;
@property (nonatomic,copy) NSString<Optional> *Aciklama;
@property (nonatomic,copy) NSString<Optional> *SecilenResimUrl;
@property (nonatomic) int SetSayisi;
@property (nonatomic) int TekrarSayisi;
@property (nonatomic,copy) NSString<Optional> *CihazNo;


@end
