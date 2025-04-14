program Kmswizard;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Kmswizardcode
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Kms wizard';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.Run;
end.

