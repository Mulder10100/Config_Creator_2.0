unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.inifiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Objects;

type
  TPerfectModem = class(Tobject)
  private
    FBPXAddress_0: String;
    FBPXAddress_1: String;
    FDevtronAddress_0: String;
    FDevtronAddress_1: String;
    FModemHeartBeat: String;
    FFirmwareVersion: String;
    FRemoteDebug: String;
    FSimPriorityList: String;

  public
    constructor create();

    property BPXAddress_0: String read FBPXAddress_0 write FBPXAddress_0;

    property BPXAddress_1: String read FBPXAddress_1 write FBPXAddress_1;
    property DevtronAddress_0: String read FDevtronAddress_0
      write FDevtronAddress_0;
    property DevtronAddress_1: String read FDevtronAddress_1
      write FDevtronAddress_1;
    property ModemHeartbeat: String read FModemHeartBeat write FModemHeartBeat;
    property FirmwareVersion: String read FFirmwareVersion
      write FFirmwareVersion;
    property RemoteDebug: String read FRemoteDebug write FRemoteDebug;
    property SimPriorityList: String read FSimPriorityList
      write FSimPriorityList;

  end;

implementation

{ TPerfectModem }

constructor TPerfectModem.create;
begin
  FBPXAddress_0 := '';
  FBPXAddress_1 := '';
  FDevtronAddress_0 := '';
  FDevtronAddress_1 := '';
  FModemHeartBeat := '';
  FFirmwareVersion := '';
  FRemoteDebug := '';
  FSimPriorityList := '';
end;

end.
