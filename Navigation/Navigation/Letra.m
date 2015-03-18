//
//  Letra.m
//  Navigation
//
//  Created by Fernando on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra
@synthesize letras,palavras,imagens;

-(instancetype)init {
    
    if(self = [super init]){
        letras = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
        
        palavras = @[@"Abacaxi",@"Bola",@"Caixa",@"Dado",@"Elefante",@"Fogo",@"Girassol",@"Helicóptero",@"Igreja",@"Joaninha",@"Kart",@"Luva",@"Mão",@"Navio",
                     @"Óculos",@"Pato",@"Queijo",@"Rato",@"Sapo",@"Tatu",@"Uva",@"Vaca",@"Waffles",@"Xadrez",@"Yin-yang",@"Zebra"];
        imagens = @[@"A.jpg",@"B.jpg",@"C.jpg",@"D.jpg",@"E.png",@"F.png",@"G.jpg",@"H.png",@"I.jpg",@"J.jpg",@"K.jpg",@"L.jpg",@"M.jpg",@"N.png",@"O.png",@"P.jpg",@"Q.jpg",@"R.jpg",@"S.jpg",@"T.jpeg",@"U.jpg",@"V.jpg",@"W.jpeg",@"X.jpg",@"Y.jpg",@"Z.png"];
    }
    
    return self;
}



@end
