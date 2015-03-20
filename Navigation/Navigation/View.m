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
    CGPoint startLocation, lastLocation;
    NSArray *views;
    CGSize sizeImagem;
    UILongPressGestureRecognizer *lpgr;
    
    UIImagePickerController *pick;
}
@synthesize i;


- (void)viewDidLoad {
    
    pick = [[UIImagePickerController alloc]init];
    
    pick.delegate = self;
    pick.allowsEditing = YES;
    
    lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(LongPress:)];
    lpgr.minimumPressDuration = 1.0;
    
    [self.view addGestureRecognizer:lpgr];
    
    
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
    UIBarButtonItem *fotoPick = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(fotoPick:)];
    NSArray *items = [[NSArray alloc]initWithObjects:editar, fotoPick, nil];
    [toolbar setItems:items animated:YES];
    [self.view addSubview:toolbar];
    
    self.navigationController.toolbar.hidden = false;
    
    imagemView =[[UIImageView alloc]initWithFrame:CGRectMake(70, 150, 200, 200)];
    imagemView.image = [UIImage imageNamed:[letra.imagens objectAtIndex:i]];
    imagemView.userInteractionEnabled = YES;
    
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
        
       }

-(void)previous:(id)sender{
      AVSpeechUtterance *utterance;
    if (i==0) {
        utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i]];
    }else{
        utterance = [[AVSpeechUtterance alloc] initWithString:[letra.palavras objectAtIndex:i-1]];}
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    utterance.rate = 0.1;
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    
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

-(void)fotoPick:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"Album" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                         pick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                                        [self presentViewController:pick animated:YES completion:nil];
                                                          }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:pick animated:YES completion:nil];
    
        
    }];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancelar" style:UIAlertActionStyleCancel handler:Nil];
    
    [alert addAction:cancel];
    [alert addAction:camera];
    [alert addAction:album];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [pick dismissViewControllerAnimated:YES completion:nil];
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    imagemView.image = img;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    lastLocation = [touch locationInView: self.view];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [touches anyObject];

    
    startLocation = [touch locationInView: self.view];
    
    imagemView.center = CGPointMake(startLocation.x,startLocation.y);
    
    
    }

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)LongPress:(UILongPressGestureRecognizer *)sender
{
    if(lpgr.state == UIGestureRecognizerStateBegan)
    {
        [UIView animateWithDuration:2.5
                            animations:^{
                                imagemView.transform = CGAffineTransformMakeScale(2, 2);
                            }];
            
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        imagemView.transform = CGAffineTransformMakeScale(1, 1);

    }
        

}




@end
