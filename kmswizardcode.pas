unit Kmswizardcode;

{$mode objfpc}
{$H+}

interface

uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    LabeledEdit1: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
  private

  public

  end;

var Form1: TForm1;

implementation

procedure window_setup();
begin
 Application.Title:='Kms wizard';
 Form1.Caption:='Kms wizard 0.3.5';
 Form1.BorderStyle:=bsDialog;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure interface_setup();
begin
 Form1.LabeledEdit1.LabelPosition:=lpLeft;
 Form1.LabeledEdit1.Text:='';
 Form1.Button1.Enabled:=False;
 Form1.Button1.ShowHint:=False;
 Form1.Button2.ShowHint:=Form1.Button1.ShowHint;
 Form1.Button3.ShowHint:=Form1.Button1.ShowHint;
 Form1.Button4.ShowHint:=Form1.Button1.ShowHint;
end;

procedure language_setup();
begin
 Form1.LabeledEdit1.EditLabel.Caption:='Server';
 Form1.Button1.Caption:='Activate';
 Form1.Button2.Caption:='Show the activation status';
 Form1.Button3.Caption:='Change the product key';
 Form1.Button4.Caption:='Reset the activation';
end;

procedure setup();
begin
 window_setup();
 interface_setup();
 language_setup();
end;

procedure execute_command(const command:string);
var shell,arguments:string;
begin
 shell:=GetEnvironmentVariable('COMSPEC');
 arguments:='/c '+command;
 if shell<>'' then ExecuteProcess(shell,arguments,[]);
end;

procedure do_activation(const server:string);
begin
 execute_command('slmgr /skms '+server);
 execute_command('slmgr /ato');
end;

procedure reset_activation();
begin
 execute_command('slmgr /upk');
 execute_command('slmgr /ckms');
 execute_command('slmgr /rearm');
end;

procedure change_product_key(const title:string);
var key:string;
begin
 key:=InputBox(title,'Enter a new product key','');
 if key<>'' then execute_command('slmgr /ipk '+key);
end;

procedure show_activation_status();
begin
 execute_command('slmgr /dli');
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
begin
 Form1.Button1.Enabled:=Form1.LabeledEdit1.Text<>'';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 do_activation(Form1.LabeledEdit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 show_activation_status();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 change_product_key(Application.Title);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 reset_activation();
end;

end.
