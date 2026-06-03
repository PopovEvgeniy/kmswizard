unit Kmswizardcode;

{
 This sofware was made by Popov Evgeniy Alekseyevich.
 It is distributed under the GNU GENERAL PUBLIC LICENSE (Version 2 or higher).
}

{$mode objfpc}
{$H+}

interface

uses kmsactivation, Classes, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TMainWindow }

  TMainWindow = class(TForm)
    ActivateButton: TButton;
    ShowStatusButton: TButton;
    ChangeKeyButton: TButton;
    ResetButton: TButton;
    ServerField: TLabeledEdit;
    procedure ActivateButtonClick(Sender: TObject);
    procedure ShowStatusButtonClick(Sender: TObject);
    procedure ChangeKeyButtonClick(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerFieldChange(Sender: TObject);
  private
    procedure window_setup();
    procedure interface_setup();
    procedure language_setup();
    procedure setup();
  public
    { public declarations }
  end;

var MainWindow: TMainWindow;

implementation

procedure TMainWindow.window_setup();
begin
 Application.Title:='Kms wizard';
 Self.Caption:='Kms wizard 0.3.9';
 Self.BorderStyle:=bsDialog;
 Self.Font.Name:=Screen.MenuFont.Name;
 Self.Font.Size:=14;
end;

procedure TMainWindow.interface_setup();
begin
 Self.ServerField.LabelPosition:=lpLeft;
 Self.ServerField.Text:='';
 Self.ActivateButton.Enabled:=False;
 Self.ActivateButton.ShowHint:=False;
 Self.ShowStatusButton.ShowHint:=False;
 Self.ChangeKeyButton.ShowHint:=False;
 Self.ResetButton.ShowHint:=False;
end;

procedure TMainWindow.language_setup();
begin
 Self.ServerField.EditLabel.Caption:='Server';
 Self.ActivateButton.Caption:='Activate';
 Self.ShowStatusButton.Caption:='Show the activation status';
 Self.ChangeKeyButton.Caption:='Change the product key';
 Self.ResetButton.Caption:='Reset the activation';
end;

procedure TMainWindow.setup();
begin
 Self.window_setup();
 Self.interface_setup();
 Self.language_setup();
end;

{$R *.lfm}

{ TMainWindow }

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 Self.setup();
end;

procedure TMainWindow.ServerFieldChange(Sender: TObject);
begin
 Self.ActivateButton.Enabled:=Self.ServerField.Text<>'';
end;

procedure TMainWindow.ActivateButtonClick(Sender: TObject);
begin
 do_activation(Self.ServerField.Text);
end;

procedure TMainWindow.ShowStatusButtonClick(Sender: TObject);
begin
 show_activation_status();
end;

procedure TMainWindow.ChangeKeyButtonClick(Sender: TObject);
begin
 change_product_key(InputBox(Application.Title,'Enter a new product key',''));
end;

procedure TMainWindow.ResetButtonClick(Sender: TObject);
begin
 reset_activation();
end;

end.
