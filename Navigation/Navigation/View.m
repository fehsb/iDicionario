//
//  View.m
//  Navigation
//
//  Created by Fernando on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "View.h"
#import "Letra.h"

@interface View ()

@end

@implementation View
{
    UILabel *titulo;
    //UIButton *botaoImagem;
    UIImage *figura;
    UIImageView *imagemView;
    UIBarButtonItem *next;
    UIBarButtonItem *previous;
    Letra *letra;
}
@synthesize i;


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    next = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;
    
    [next setEnabled:YES];
    [previous setEnabled:YES];
    
    letra = [[Letra alloc]init];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = [letra.letras objectAtIndex:i];
    
    imagemView =[[UIImageView alloc]initWithFrame:CGRectMake(70, 150, 200, 200)];
    imagemView.image = [UIImage imageNamed:[letra.imagens objectAtIndex:i]];
    
    [self.view addSubview:imagemView];
    
    
    
    titulo = [[UILabel alloc] initWithFrame:CGRectMake(0,400,self.view.bounds.size.width,50)];
    [titulo setText:[letra.palavras objectAtIndex:i]];
    titulo.textColor = [UIColor blackColor];
    titulo.textAlignment= NSTextAlignmentCenter;
    
    [self.view addSubview:titulo];
    
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i]];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    utterance.rate = 0.1;
    
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    
    
    
}

-(void)next:(id)sender {
    //    i++;
    
    [next setEnabled:NO];
    if (self.navigationController.viewControllers.count < 3){
        View *proximo = [[View alloc]
                         initWithNibName:nil
                         bundle:NULL];
        
        //[self.navigationController pushViewController:proximo
        //                                     animated:YES];
        //  completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
        
        //    if (i==25){
        //        i=-1;
        //    }
        //
        
        proximo.i = (i+1==25)?0:i+1;
        
        //    [titulo setText:[palavras objectAtIndex:i]];
        //    titulo.textColor = [UIColor blackColor];
        //    titulo.textAlignment= NSTextAlignmentCenter;
        //
        //    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
        //    [imagemView setImage:figura];
        //
        //
        //    [proximo.view addSubview:imagemView];
        //
        //    [proximo.view addSubview:titulo];
        //
        //
        
        [self.navigationController pushViewController:proximo
                                             animated:YES];
    }
}

-(void)previous:(id)sender{
    //
    //    [UIView animateWithDuration:0
    //                     animations:^{imagemView.alpha = 0.0;}];
    //
    //    if (i==0){
    //        i=26;
    //    }
    //    i--;
    //    self.title = [letras objectAtIndex:i];
    //    [titulo setText:[palavras objectAtIndex:i]];
    //    titulo.textColor = [UIColor blackColor];
    //    titulo.textAlignment= NSTextAlignmentCenter;
    //
    //    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
    //    [imagemView setImage:figura];
    //    //[imagemView sizeToFit];
    //    //imagemView.center = self.view.center;
    //
    //    [self.view addSubview:imagemView];
    //
    AVSpeechUtterance *utterance;
    if (i==0) {
        utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i]];
    }else{
        utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i-1]];}
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    utterance.rate = 0.1;
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    //
    //    //    figura = [UIImage imageNamed:[imagens objectAtIndex:i]];
    //    //    [botaoImagem setImage:figura forState:UIControlStateNormal];
    //    //    [botaoImagem sizeToFit];
    //    //    botaoImagem.center = self.view.center;
    //    //
    //    //    [self.view addSubview:botaoImagem];
    //
    //
    //    [self.view addSubview:titulo];
    //
    //    [UIView animateWithDuration:0.7
    //                     animations:^{imagemView.alpha = 1.0;}];
    //
    //
    if (next.enabled == NO) {
        [next setEnabled:YES];}
    [previous setEnabled:NO];
    
    View *anterior = [[View alloc]
                      initWithNibName:nil
                      bundle:NULL];
    anterior.i = (i-1==0)?25:i-1;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [UIView animateWithDuration:0
                     animations:^{imagemView.alpha = 0.0;}];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:0.7
                     animations:^{imagemView.alpha = 1.0;}];
    //completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
}
@end
