//
//  View.m
//  Navigation
//
//  Created by Fernando on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "View.h"
#import "Letra.h"
#import "TableViewController.h"

@interface View ()

@end

@implementation View
{
    UITextField *titulo;
    //UIButton *botaoImagem;
    UIImage *figura;
    UIImageView *imagemView;
    UIBarButtonItem *next;
    UIBarButtonItem *previous;
    Letra *letra;
    NSArray *views;
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
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 70, self.view.frame.size.width, 44);
    UIBarButtonItem *editar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    NSArray *items = [[NSArray alloc]initWithObjects:editar, nil];
    [toolbar setItems:items animated:YES];
    [self.view addSubview:toolbar];
    
    self.navigationController.toolbar.hidden = false;
    
    imagemView =[[UIImageView alloc]initWithFrame:CGRectMake(70, 150, 200, 200)];
    imagemView.image = [UIImage imageNamed:[letra.imagens objectAtIndex:i]];
    
    [self.view addSubview:imagemView];
    
    
    
    titulo = [[UITextField alloc] initWithFrame:CGRectMake(0,400,self.view.bounds.size.width,50)];
    [titulo setText:[letra.palavras objectAtIndex:i]];
    titulo.textColor = [UIColor blackColor];
    titulo.textAlignment= NSTextAlignmentCenter;

    [self.view addSubview:titulo];
    titulo.enabled = NO;
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i]];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    utterance.rate = 0.1;
    
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    
    self.resignFirstResponder;
    
}

-(void)next:(id)sender {
    //    i++;
    
    [next setEnabled:NO];
    View *proximo = [[View alloc]
                     initWithNibName:nil
                     bundle:NULL];

    if (self.navigationController.viewControllers.count == 3){
        
        views = [[NSArray alloc]initWithObjects:self, nil];
        [self.navigationController setViewControllers:views];
    }
         proximo.i = (i+1==25)?0:i+1;
        
        [self.navigationController pushViewController:proximo
                                             animated:YES];
        
        
        //[self.navigationController pushViewController:proximo
        //                                     animated:YES];
        //  completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
        
        //    if (i==25){
        //        i=-1;
        //    }
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
    if (self.navigationController.viewControllers.count==3) {
        views = [[NSArray alloc]initWithObjects:anterior,self, nil];
        [self.navigationController setViewControllers:views];
    }
    if (self.navigationController.viewControllers.count == 1){
        views = [[NSArray alloc]initWithObjects:anterior,self, nil];
        [self.navigationController setViewControllers:views];
    }
    anterior.i = (i-1==0)?25:i-1;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setTitle:@"Dicionario"];
    [UIView animateWithDuration:0
                     animations:^{imagemView.alpha = 0.0;}];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:0.7
                     animations:^{imagemView.alpha = 1.0;}];
    //completion:^(BOOL finished){ [imagemView removeFromSuperview]; }];
}

-(void)editar:(id)sender
{
    if(titulo.enabled){
        titulo.enabled = NO;
    }else titulo.enabled = YES;
    
    self.resignFirstResponder;

}

@end
