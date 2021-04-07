unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.strutils, Unit2,Unit3, System.Generics.collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  System.inifiles, System.IOUtils, FMX.MultiView, FMX.Objects, FMX.Menus,
  FMX.Effects, FMX.Edit;

type
  TFormMain = class(TForm)
    mem_info: TMemo;
    pnl_main: TPanel;
    btn_upgrade_devtron: TButton;
    pnl_firmware_upgrade: TPanel;
    btn_upgrade_truhann: TButton;
    pnl_server_config: TPanel;
    btn_main_server_config: TButton;
    btn_second_server_config: TButton;
    pnl_main_sim: TPanel;
    pnl_dual_sim: TPanel;
    pnl_single_sim: TPanel;
    btn_sim_AB: TButton;
    btn_sim_BA: TButton;
    btn_sim_A: TButton;
    btn_sim_B: TButton;
    pnl_file_output_options: TPanel;
    Label1: TLabel;
    Line1: TLine;
    Line2: TLine;
    Label2: TLabel;
    Line3: TLine;
    Label3: TLabel;
    Line4: TLine;
    Label4: TLabel;
    btn_create_files: TButton;
    spbtn_add: TSpeedButton;
    spbtn_delete: TSpeedButton;
    Line6: TLine;
    Panel1: TPanel;
    Label5: TLabel;
    Line5: TLine;
    btn_properties_files: TButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    lbl_con_0_address: TLabel;
    Panel10: TPanel;
    Label12: TLabel;
    lbl_con_1_port: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Line7: TLine;
    Line8: TLine;
    Panel13: TPanel;
    Label16: TLabel;
    lbl_con_2_port: TLabel;
    Panel14: TPanel;
    Label18: TLabel;
    lbl_con_2_address: TLabel;
    Panel8: TPanel;
    Label8: TLabel;
    lbl_con_0_port: TLabel;
    Panel9: TPanel;
    Label10: TLabel;
    lbl_con_1_address: TLabel;
    Panel15: TPanel;
    Label20: TLabel;
    lbl_con_3_port: TLabel;
    Panel16: TPanel;
    Label22: TLabel;
    lbl_con_3_address: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label24: TLabel;
    lbl_devtron_1_port: TLabel;
    Panel19: TPanel;
    Label26: TLabel;
    lbl_devtron_0_address: TLabel;
    Panel20: TPanel;
    Label28: TLabel;
    lbl_devtron_0_port: TLabel;
    Panel21: TPanel;
    Label30: TLabel;
    lbl_devtron_1_address: TLabel;
    Panel22: TPanel;
    Panel23: TPanel;
    Label32: TLabel;
    lbl_eathernet_mac: TLabel;
    Panel24: TPanel;
    Label34: TLabel;
    lbl_eathernet_bandwidth_limit: TLabel;
    Label36: TLabel;
    Line9: TLine;
    Panel25: TPanel;
    Label37: TLabel;
    lbl_eathernet_bandwidth_usage: TLabel;
    Panel26: TPanel;
    Panel27: TPanel;
    Label39: TLabel;
    Line10: TLine;
    Panel28: TPanel;
    Label40: TLabel;
    lbl_Sim_Priority: TLabel;
    Panel29: TPanel;
    Label42: TLabel;
    lbl_Sim_1_IMEI: TLabel;
    Panel30: TPanel;
    Label44: TLabel;
    lbl_Sim_0_IMEI: TLabel;
    Panel31: TPanel;
    lbl_Sim_Inuse_Tag: TLabel;
    lbl_Sim_Inuse: TLabel;
    Label48: TLabel;
    Line11: TLine;
    Panel32: TPanel;
    Label49: TLabel;
    lbl_gsm_imei: TLabel;
    Panel33: TPanel;
    Label51: TLabel;
    lbl_heartbeat: TLabel;
    Panel34: TPanel;
    Label53: TLabel;
    lbl_debug_remote: TLabel;
    Panel35: TPanel;
    Label55: TLabel;
    lbl_application_firmware: TLabel;
    Label57: TLabel;
    lbl_Sim_0_provider: TLabel;
    lbl_sim_1_provider: TLabel;
    procedure btn_upgrade_devtronClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_upgrade_truhannClick(Sender: TObject);
    procedure PasteToMem(InputString: String);
    procedure UpdateLastUsed(KeywordValue: String);
    procedure MemoTextCompiler(Section: String; NumOfLines: Integer);
    procedure btn_main_server_configClick(Sender: TObject);
    procedure btn_second_server_configClick(Sender: TObject);
    procedure btn_sim_ABClick(Sender: TObject);
    procedure btn_sim_BAClick(Sender: TObject);
    procedure btn_sim_BClick(Sender: TObject);
    procedure btn_sim_AClick(Sender: TObject);
    procedure btn_create_filesClick(Sender: TObject);
    procedure spbtn_addClick(Sender: TObject);
    procedure spbtn_deleteClick(Sender: TObject);
    procedure btn_properties_filesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SearchforFile(UserFileName: String);
    procedure PopulateEntries(MyFileName: String);

  private
    { Private declarations }
    FSettingsFilePath: String;
    LastUsed: String;
    AddtoMem: boolean;
    procedure LoadSettings;
  public
    { Public declarations }
  end;

var
  inifile: TMemIniFile;
  FormMain: TFormMain;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

procedure TFormMain.btn_upgrade_truhannClick(Sender: TObject);
begin
  MemoTextCompiler('Truhann_Server_Upgrade', 2);
  UpdateLastUsed('TSU%A');
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  FileToSearch: String;
begin
  if formfileeditor.IsNumber(Edit1.Text) then
  begin
    FileToSearch := formfileeditor.ParseValue(Edit1.Text);
    SearchforFile(FileToSearch);
  end
  else
  begin
    showmessage('Please eneter the last few numbers of the file!');
    Edit1.Text := '';
    Edit1.TextPrompt := 'e.g. 120';
  end;

end;

procedure TFormMain.btn_create_filesClick(Sender: TObject);
var
  MyText: TStringlist;
  FilesPath: String;
  FileName: String;
begin
  Unit2.formfileeditor.Memo1.Lines.Clear;
  Unit2.formfileeditor.Memo1.Lines.Add(mem_info.Text);
  if NOT(mem_info.Text <> '') then
  begin
    showmessage('There is no content to be added to the file/s!');
  end
  else
    formfileeditor.show;
end;

procedure TFormMain.btn_main_server_configClick(Sender: TObject);
begin
  MemoTextCompiler('Main_Server_Config', 6);
  UpdateLastUsed('MSC%A');
end;

procedure TFormMain.btn_properties_filesClick(Sender: TObject);
begin
  Unit3.FormProperties.Show;
end;

procedure TFormMain.btn_second_server_configClick(Sender: TObject);
begin
  MemoTextCompiler('Second_Server_Config', 6);
  UpdateLastUsed('SSC%A');
end;

procedure TFormMain.btn_sim_ABClick(Sender: TObject);
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  if not AddtoMem then
    mem_info.Lines.Clear;
  mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimAB', ''));
  UpdateLastUsed('SP%AB');
end;

procedure TFormMain.btn_sim_AClick(Sender: TObject);
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  if not AddtoMem then
    mem_info.Lines.Clear;
  mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimA', ''));
  UpdateLastUsed('SP%A');
end;

procedure TFormMain.btn_sim_BAClick(Sender: TObject);
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  if not AddtoMem then
    mem_info.Lines.Clear;
  mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimBA', ''));
  UpdateLastUsed('SP%BA');
end;

procedure TFormMain.btn_sim_BClick(Sender: TObject);
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  if not AddtoMem then
    mem_info.Lines.Clear;
  mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimB', ''));
  UpdateLastUsed('SP%B');
end;

procedure TFormMain.btn_upgrade_devtronClick(Sender: TObject);
begin
  MemoTextCompiler('Devtron_Server_Upgrade', 2);
  UpdateLastUsed('DSU%A');
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FSettingsFilePath := Extractfilepath(ParamStr(0));
  if AddtoMem then
  begin
    spbtn_add.StyleLookup := 'stepperbuttonright';
    spbtn_add.Hint := 'Add to the File';
  end
  else
  begin
    spbtn_add.StyleLookup := 'stepperbuttonleft';
    spbtn_add.Hint := 'Overwirite the File';
  end;
  LoadSettings();
end;

procedure TFormMain.LoadSettings();
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  LastUsed := inifile.ReadString('System', 'LastUsed', '');
  PasteToMem(LastUsed);
end;

procedure TFormMain.MemoTextCompiler(Section: String; NumOfLines: Integer);
var
  I: Integer;
  FinalString: String;
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  for I := 1 to NumOfLines do
  begin
    FinalString := FinalString + inifile.ReadString(Section,
      'Line' + inttostr(I), '') + Slinebreak;
  end;

  if not AddtoMem then
    mem_info.Lines.Clear;

  mem_info.Lines.Add(FinalString);

end;

procedure TFormMain.UpdateLastUsed(KeywordValue: String);
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  inifile.writestring('System', 'LastUsed', KeywordValue);
  inifile.UpdateFile;
  inifile.Free;
end;

procedure TFormMain.PasteToMem(InputString: String);
var
  SectionString, LineString, FinalString: String;
  I, J: Integer;
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  SectionString := '';

  for I := 1 to InputString.Length do
  begin
    if NOT(InputString[I] = '%') then
    begin
      SectionString := SectionString + InputString[I];
    end
    else
    begin
      LineString := '';
      for J := I to InputString.Length do
      begin
        if NOT(InputString[J] = '%') then
        begin
          LineString := LineString + InputString[J];
        end;
      end;
      break;
    end;
  end;

  if not AddtoMem then
    mem_info.Lines.Clear;

  FinalString := SectionString + LineString;

  Case IndexText(FinalString, ['SPA', 'SPB', 'SPAB', 'SPBA', 'TSUA', 'DSUA',
    'MSCA', 'SSCA']) of
    0:
      mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimA', ''));
    1:
      mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimB', ''));
    2:
      mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimAB', ''));
    3:
      mem_info.Lines.Add(inifile.ReadString('Sim_Priority', 'SimBA', ''));
    4:
      MemoTextCompiler('Truhann_Server_Upgrade', 2);
    5:
      MemoTextCompiler('Devtron_Server_Upgrade', 2);
    6:
      MemoTextCompiler('Main_Server_Config', 6);
    7:
      MemoTextCompiler('Second_Server_Config', 6);
    -1:
      mem_info.Lines.Add('Please Check The .INI File');
  end;
  inifile.Free;
end;

procedure TFormMain.PopulateEntries(MyFileName: String);
var
  myfile: textfile;
  Text: string;
  ReceivingList: TArray<String>;
  I: Integer;
  TestString: String;
begin

  AssignFile(myfile, MyFileName);
  Reset(myfile);
  while not Eof(myfile) do
  begin
    ReadLn(myfile, Text);
    if Text <> '' then
    begin
      ReceivingList := Text.Split(['.']);
      for I := 0 to Length(ReceivingList) - 1 do
      begin
        if ReceivingList[0] = 'sim' then
        begin
          if ReceivingList[1].Substring(0, 12) = 'prioritylist' then
          begin
            lbl_Sim_Priority.StyledSettings := lbl_Sim_Priority.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_Sim_Priority.FontColor := TAlphaColors.Green;

            lbl_Sim_Priority.Text := ReceivingList[1].Substring(13);
          end
          else if ReceivingList[1].Substring(0, 5) = 'inuse' then
          begin
            lbl_Sim_Inuse.StyledSettings := lbl_Sim_Inuse.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_Sim_Inuse.FontColor := TAlphaColors.Green;

            lbl_Sim_Inuse.Text := ReceivingList[1].Substring(6);
          end
          else if (ReceivingList[1] = '0') AND
            (ReceivingList[2].Substring(0, 4) = 'ccid') then
          begin
            lbl_Sim_0_IMEI.StyledSettings := lbl_Sim_0_IMEI.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_Sim_0_IMEI.FontColor := TAlphaColors.Green;

            lbl_Sim_0_IMEI.Text := ReceivingList[2].Substring(5);
          end
          else if (ReceivingList[1] = '1') AND
            (ReceivingList[2].Substring(0, 4) = 'ccid') then
          begin
            lbl_Sim_1_IMEI.StyledSettings := lbl_Sim_1_IMEI.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_Sim_1_IMEI.FontColor := TAlphaColors.Green;

            lbl_Sim_1_IMEI.Text := ReceivingList[2].Substring(5);
          end;

          if lbl_Sim_0_IMEI.Text.Length > lbl_Sim_1_IMEI.Text.Length then
          begin
            lbl_Sim_0_provider.StyledSettings :=
              lbl_Sim_0_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_Sim_0_provider.FontColor := TAlphaColors.Green;

            lbl_sim_1_provider.StyledSettings :=
              lbl_sim_1_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_sim_1_provider.FontColor := TAlphaColors.Green;

            lbl_Sim_0_provider.Text := 'VODACOM';
            lbl_sim_1_provider.Text := 'MTN';
          end
          else if lbl_Sim_0_IMEI.Text.Length < lbl_Sim_1_IMEI.Text.Length then
          begin
            lbl_Sim_0_provider.StyledSettings :=
              lbl_Sim_0_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_Sim_0_provider.FontColor := TAlphaColors.Green;

            lbl_sim_1_provider.StyledSettings :=
              lbl_sim_1_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_sim_1_provider.FontColor := TAlphaColors.Green;

            lbl_Sim_0_provider.Text := 'MTN';
            lbl_sim_1_provider.Text := 'VODACOM';
          end
          else if lbl_Sim_0_IMEI.Text.Length = lbl_Sim_1_IMEI.Text.Length then
          begin
            lbl_Sim_0_provider.StyledSettings :=
              lbl_Sim_0_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_Sim_0_provider.FontColor := TAlphaColors.black;

            lbl_sim_1_provider.StyledSettings :=
              lbl_sim_1_provider.StyledSettings - [TStyledSetting.ssFontColor];
            lbl_sim_1_provider.FontColor := TAlphaColors.black;

            lbl_Sim_0_provider.Text := 'Provider';
            lbl_sim_1_provider.Text := 'Provider';
          end;

        end
        else if ReceivingList[0] = 'gsm' then
        begin
          if ReceivingList[1].Substring(0, 4) = 'imei' then
          begin
            lbl_gsm_imei.StyledSettings := lbl_gsm_imei.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_gsm_imei.FontColor := TAlphaColors.Green;

            lbl_gsm_imei.Text := ReceivingList[1].Substring(5);
          end;
        end
        else if ReceivingList[0] = 'application' then
        begin
          if ReceivingList[1].Substring(0, 7) = 'version' then
          begin
            lbl_application_firmware.StyledSettings :=
              lbl_application_firmware.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_application_firmware.FontColor := TAlphaColors.Green;

            lbl_application_firmware.Text := ReceivingList[1].Substring(8);
          end;
        end
        else if ReceivingList[0] = 'debug' then
        begin
          if ReceivingList[1].Substring(0, 6) = 'remote' then
          begin
            lbl_debug_remote.StyledSettings :=
              lbl_application_firmware.StyledSettings -
              [TStyledSetting.ssFontColor];
            lbl_debug_remote.FontColor := TAlphaColors.Green;

            lbl_debug_remote.Text := ReceivingList[1].Substring(7);
          end;
        end
        else if ReceivingList[0].Substring(0, 9) = 'heartbeat' then
        begin
          lbl_heartbeat.StyledSettings := lbl_heartbeat.StyledSettings -
            [TStyledSetting.ssFontColor];
          lbl_heartbeat.FontColor := TAlphaColors.Green;

          lbl_heartbeat.Text := ReceivingList[0].Substring(10);
        end
        else if ReceivingList[0] = 'connection' then
        begin
          if ReceivingList[1] = '0' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_con_0_address.StyledSettings :=
                lbl_con_0_address.StyledSettings - [TStyledSetting.ssFontColor];
              lbl_con_0_address.FontColor := TAlphaColors.Green;

              lbl_con_0_address.Text := ReceivingList[2].Substring(8) + '.' +
                ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_con_0_port.StyledSettings := lbl_con_0_port.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_con_0_port.FontColor := TAlphaColors.Green;

              lbl_con_0_port.Text := ReceivingList[2].Substring(5);
            end;
          end
          else if ReceivingList[1] = '1' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_con_1_address.StyledSettings :=
                lbl_con_1_address.StyledSettings - [TStyledSetting.ssFontColor];
              lbl_con_1_address.FontColor := TAlphaColors.Green;

              lbl_con_1_address.Text := ReceivingList[2].Substring(8) + '.' +
                ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_con_1_port.StyledSettings := lbl_con_1_port.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_con_1_port.FontColor := TAlphaColors.Green;

              lbl_con_1_port.Text := ReceivingList[2].Substring(5);
            end;
          end
          else if ReceivingList[1] = '2' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_con_2_address.StyledSettings :=
                lbl_con_2_address.StyledSettings - [TStyledSetting.ssFontColor];
              lbl_con_2_address.FontColor := TAlphaColors.Green;

              lbl_con_2_address.Text := ReceivingList[2].Substring(8) + '.' +
                ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_con_2_port.StyledSettings := lbl_con_2_port.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_con_2_port.FontColor := TAlphaColors.Green;

              lbl_con_2_port.Text := ReceivingList[2].Substring(5);
            end;
          end
          else if ReceivingList[1] = '3' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_con_3_address.StyledSettings :=
                lbl_con_3_address.StyledSettings - [TStyledSetting.ssFontColor];
              lbl_con_3_address.FontColor := TAlphaColors.Green;

              lbl_con_3_address.Text := ReceivingList[2].Substring(8) + '.' +
                ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_con_3_port.StyledSettings := lbl_con_3_port.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_con_3_port.FontColor := TAlphaColors.Green;

              lbl_con_3_port.Text := ReceivingList[2].Substring(5);
            end;
          end
        end
        else if ReceivingList[0] = 'devtron' then
        begin
          if ReceivingList[1] = '0' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_devtron_0_address.StyledSettings :=
                lbl_devtron_0_address.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_devtron_0_address.FontColor := TAlphaColors.Green;

              lbl_devtron_0_address.Text := ReceivingList[2].Substring(8) + '.'
                + ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_devtron_0_port.StyledSettings := lbl_con_0_port.StyledSettings
                - [TStyledSetting.ssFontColor];
              lbl_devtron_0_port.FontColor := TAlphaColors.Green;

              lbl_devtron_0_port.Text := ReceivingList[2].Substring(5);
            end;
          end
          else if ReceivingList[1] = '1' then
          begin
            if ReceivingList[2].Substring(0, 7) = 'address' then
            begin
              lbl_devtron_1_address.StyledSettings :=
                lbl_devtron_1_address.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_devtron_1_address.FontColor := TAlphaColors.Green;

              lbl_devtron_1_address.Text := ReceivingList[2].Substring(8) + '.'
                + ReceivingList[3] + '.' + ReceivingList[4] + '.' +
                ReceivingList[5];
            end
            else if ReceivingList[2].Substring(0, 4) = 'port' then
            begin
              lbl_devtron_1_port.StyledSettings := lbl_con_1_port.StyledSettings
                - [TStyledSetting.ssFontColor];
              lbl_devtron_1_port.FontColor := TAlphaColors.Green;

              lbl_devtron_1_port.Text := ReceivingList[2].Substring(5);
            end;
          end;
        end
        { ethernet.mac=00:20:B7:FF:FF:FF
          ethernet.bandwidth.limit=1073741824
          ethernet.bandwidth.usage=22452 }
        else if ReceivingList[0] = 'ethernet' then
        begin
          if ReceivingList[1].Substring(0, 3) = 'mac' then
          begin
            lbl_eathernet_mac.StyledSettings := lbl_eathernet_mac.StyledSettings
              - [TStyledSetting.ssFontColor];
            lbl_eathernet_mac.FontColor := TAlphaColors.Green;

            lbl_eathernet_mac.Text := ReceivingList[1].Substring(4);
          end
          else if ReceivingList[1] = 'bandwidth' then
          begin
            if ReceivingList[2].Substring(0, 5) = 'limit' then
            begin
              lbl_eathernet_bandwidth_limit.StyledSettings :=
                lbl_eathernet_bandwidth_limit.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_eathernet_bandwidth_limit.FontColor := TAlphaColors.Green;

              lbl_eathernet_bandwidth_limit.Text := ReceivingList[2]
                .Substring(6);

            end
            else if ReceivingList[2].Substring(0, 5) = 'usage' then
            begin
              lbl_eathernet_bandwidth_usage.StyledSettings :=
                lbl_eathernet_bandwidth_usage.StyledSettings -
                [TStyledSetting.ssFontColor];
              lbl_eathernet_bandwidth_usage.FontColor := TAlphaColors.Green;

              lbl_eathernet_bandwidth_usage.Text := ReceivingList[2]
                .Substring(6);

            end;

          end;

        end;
      end;
    end;
  end;
end;

procedure TFormMain.SearchforFile(UserFileName: STring);
var
  FiletoFind: String;
  FileFound: String;
begin
  FiletoFind := UserFileName + '.properties';

  for UserFileName in TDirectory.GetFiles(Extractfilepath(ParamStr(0)),
    '*.properties', TSearchOption.soTopDirectoryOnly) do
  begin
    FileFound := UserFileName.Substring(Length(UserFileName) -
      Length('10000000.properties'), 19);

    if FileFound = FiletoFind then
    begin
      PopulateEntries(FileFound);
    end;
  end;

end;

procedure TFormMain.spbtn_addClick(Sender: TObject);
begin
  AddtoMem := not AddtoMem;
  if AddtoMem then
  begin
    spbtn_add.StyleLookup := 'stepperbuttonright';
    spbtn_add.Hint := 'Add to the File';
  end
  else
  begin
    spbtn_add.StyleLookup := 'stepperbuttonleft';
    spbtn_add.Hint := 'Overwirite the File';
  end;
end;

procedure TFormMain.spbtn_deleteClick(Sender: TObject);
begin
  mem_info.Lines.Clear;
end;

procedure TFormMain.SpeedButton1Click(Sender: TObject);
begin
  // formmain.StyleBook:=stylebook1;
  // FormFileEditor.StyleBook:=stylebook1;
end;

end.

{ var
  myFile : TextFile;
  text   : string;

  begin
  // Try to open the Test.txt file for writing to
  AssignFile(myFile, 'Test.txt');
  Reset(myFile);
  while not Eof(myFile) do
  begin
  ReadLn(myFile, text);
  ShowMessage(text);
  end;

  // Write a couple of well known words to this file
  WriteLn(myFile, 'Hello World');

  // Close the file
  CloseFile(myFile);

  // Reopen the file for reading
  Reset(myFile);

  // Display the file contents
  while not Eof(myFile) do
  begin
  ReadLn(myFile, text);
  ShowMessage(text);
  end;

  // Close the file for the last time
  CloseFile(myFile);
  end;

  procedure MakeAStringlistAndSaveThat;
  var
  MyText: TStringlist;
  begin
  MyText:= TStringlist.create;
  try
  MyText.Add('line 1');
  MyText.Add('line 2');
  MyText.SaveToFile('c:\folder\filename.txt');
  finally
  MyText.Free
  end;
  end;


}
