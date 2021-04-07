program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {FormMain},
  Unit2 in 'Unit2.pas' {FormFileEditor},
  Unit3 in 'Unit3.pas' {FormProperties},
  Unit4 in 'Unit4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormFileEditor, FormFileEditor);
  Application.CreateForm(TFormProperties, FormProperties);
  Application.Run;

end.
