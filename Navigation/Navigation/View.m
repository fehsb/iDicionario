//
//  View.m
//  Navigation
//
//  Created by Fernando on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "View.h"


@interface View ()

@end

@implementation View
{
    UILabel *titulo;
    //UIButton *botaoImagem;
    UIImage *figura;
    UIImageView *imagemView;
}

@synthesize letras, i, palavras,imagens;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    i = 0;
    
    letras = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    palavras = @[@"Abacaxi",@"Bola",@"Caixa",@"Dado",@"Elefante",@"Fogo",@"Girassol",@"Helicóptero",@"Igreja",@"Joaninha",@"Kart",@"Luva",@"Mão",@"Navio",
                 @"Óculos",@"Pato",@"Queijo",@"Rato",@"Sapo",@"Tatu",@"Uva",@"Vaca",@"Waffles",@"Xadrez",@"Yin-yang",@"Zebra"];
    
    imagens =@[@"A.jpg",@"B.jpg",@"C.jpg",@"D.jpg",@"E.png",@"F.png",@"G.jpg",@"H.png",@"I.jpg",@"J.jpg",@"K.jpg",@"L.jpg",@"M.jpg",@"N.png",@"O.png",@"P.jpg",@"Q.jpg",@"R.jpg",@"S.jpg",@"T.jpeg",@"U.jpg",@"V.jpg",@"W.jpeg",@"X.jpg",@"Y.jpg",@"Z.png"];
    
    self.title = [letras objectAtIndex:i];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *previous = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;

    
    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
    imagemView =[[UIImageView alloc]initWithFrame:CGRectMake(70, 150, 200, 200)];
    [imagemView setImage:figura];
    
    [self.view addSubview:imagemView];
     
//    botaoImagem = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
//    [botaoImagem setImage:figura forState:UIControlStateNormal];
//    [botaoImagem sizeToFit];
//    botaoImagem.center = self.view.center;
//    [self.view addSubview:botaoImagem];
    
    
    titulo = [[UILabel alloc] initWithFrame:CGRectMake(0,400,self.view.bounds.size.width,50)];
    [titulo setText:[palavras objectAtIndex:i]];
    titulo.textColor = [UIColor blackColor];
    titulo.textAlignment= NSTextAlignmentCenter;
    //[titulo sizeToFit];
    
    [self.view addSubview:titulo];
}

-(void)next:(id)sender {
//    LetraBViewController *proximo = [[LetraBViewController alloc]
//                                     initWithNibName:nil
//                                     bundle:NULL];
//    [self.navigationController pushViewController:proximo
//                                         animated:YES];
    [UIView animateWithDuration:0
                     animations:^{imagemView.alpha = 0.0;}];
                   //  completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
//
    if (i==25){
        i=-1;
    }
    
    i++;
    self.title = [letras objectAtIndex:i];
    [titulo setText:[palavras objectAtIndex:i]];
    titulo.textColor = [UIColor blackColor];
    titulo.textAlignment= NSTextAlignmentCenter;
    
    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
    [imagemView setImage:figura];
    //[imagemView sizeToFit];
    //imagemView.center = self.view.center;
    
    [self.view addSubview:imagemView];

    
    
//    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
//    [botaoImagem setImage:figura forState:UIControlStateNormal];
//    [botaoImagem sizeToFit];
//    botaoImagem.center = self.view.center;
//    
//    [self.view addSubview:botaoImagem];
    
    
    [self.view addSubview:titulo];
    [UIView animateWithDuration:0.7
                     animations:^{imagemView.alpha = 1.0;}];
                     //completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
}

-(void)previous:(id)sender{
    
    [UIView animateWithDuration:0
                     animations:^{imagemView.alpha = 0.0;}];
    
    if (i==0){
        i=26;
    }
    i--;
    self.title = [letras objectAtIndex:i];
    [titulo setText:[palavras objectAtIndex:i]];
    titulo.textColor = [UIColor blackColor];
    titulo.textAlignment= NSTextAlignmentCenter;
    
    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
    [imagemView setImage:figura];
    //[imagemView sizeToFit];
    //imagemView.center = self.view.center;
    
    [self.view addSubview:imagemView];

    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:[palavras objectAtIndex:i]];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    utterance.rate = 0.1;
    
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    
//    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
//    [botaoImagem setImage:figura forState:UIControlStateNormal];
//    [botaoImagem sizeToFit];
//    botaoImagem.center = self.view.center;
//    
//    [self.view addSubview:botaoImagem];
    
    
    [self.view addSubview:titulo];
    
    [UIView animateWithDuration:0.7
                     animations:^{imagemView.alpha = 1.0;}];
    

}

@end
