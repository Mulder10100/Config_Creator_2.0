unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.inifiles, Unit4,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Objects;

type
  TFormProperties = class(TForm)
    Panel_IP_Addresses: TPanel;
    Panel_SIM_Settigs_Filter_Tag: TPanel;
    Panel_Modem_Settings_Filter_Tag: TPanel;
    Panel_Compile: TPanel;
    Button1: TButton;
    Panel1: TPanel;
    lbl_IP_Address_Filter_Tag: TLabel;
    Label1: TLabel;
    Line1: TLine;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Label4: TLabel;
    ComboBox4: TComboBox;
    CheckBox4: TCheckBox;
    Panel3: TPanel;
    Label3: TLabel;
    ComboBox3: TComboBox;
    CheckBox3: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    CheckBox2: TCheckBox;
    Label_Sim_Settings_Filter_Tag: TLabel;
    Line2: TLine;
    Panel8: TPanel;
    Label8: TLabel;
    ComboBox8: TComboBox;
    CheckBox8: TCheckBox;
    Label_Modem_Settings_Filter_Tag: TLabel;
    Line3: TLine;
    Panel7: TPanel;
    Label7: TLabel;
    ComboBox7: TComboBox;
    CheckBox7: TCheckBox;
    Panel5: TPanel;
    Label5: TLabel;
    ComboBox5: TComboBox;
    CheckBox5: TCheckBox;
    Panel6: TPanel;
    Label6: TLabel;
    ComboBox6: TComboBox;
    CheckBox6: TCheckBox;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure UpdateConfig();
    procedure UpdateOBJ();
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProperties: TFormProperties;
  FSettingsFilePath: String;
  inifile: TMemIniFile;
  FileToSearch: TPerfectModem;
  Count: Integer;

implementation

{$R *.fmx}

procedure TFormProperties.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.IsChecked then
  begin
    ComboBox1.Enabled := true;
    FileToSearch.BPXAddress_0 := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
  end
  else if CheckBox1.IsChecked = false then
  begin
    ComboBox1.Enabled := false;
    FileToSearch.BPXAddress_0 := '';
  end;
end;

procedure TFormProperties.CheckBox2Change(Sender: TObject);
begin
  if CheckBox2.IsChecked then
  begin
    ComboBox2.Enabled := true;
    FileToSearch.BPXAddress_1 := ComboBox2.Items.Strings[ComboBox2.ItemIndex];
  end
  else if CheckBox2.IsChecked = false then
  begin
    ComboBox2.Enabled := false;
    FileToSearch.BPXAddress_1 := '';
  end;
end;

procedure TFormProperties.CheckBox3Change(Sender: TObject);
begin
  if CheckBox3.IsChecked then
  begin
    ComboBox3.Enabled := true;
    FileToSearch.DevtronAddress_0 := ComboBox3.Items.Strings
      [ComboBox3.ItemIndex];
  end
  else if CheckBox3.IsChecked = false then
  begin
    ComboBox3.Enabled := false;
    FileToSearch.DevtronAddress_0 := '';
  end;
end;

procedure TFormProperties.CheckBox4Change(Sender: TObject);
begin
  if CheckBox4.IsChecked then
  begin
    ComboBox4.Enabled := true;
    FileToSearch.DevtronAddress_1 := ComboBox4.Items.Strings
      [ComboBox4.ItemIndex];
  end
  else if CheckBox4.IsChecked = false then
  begin
    ComboBox4.Enabled := false;
    FileToSearch.DevtronAddress_1 := '';
  end;
end;

procedure TFormProperties.CheckBox5Change(Sender: TObject);
begin
  if CheckBox5.IsChecked then
  begin
    ComboBox5.Enabled := true;
    SpeedButton5.Enabled := true;
    FileToSearch.ModemHeartbeat := ComboBox5.Items.Strings[ComboBox5.ItemIndex];
  end
  else if CheckBox5.IsChecked = false then
  begin
    ComboBox5.Enabled := false;
    SpeedButton5.Enabled := false;
    FileToSearch.ModemHeartbeat := '';
  end;
end;

procedure TFormProperties.CheckBox6Change(Sender: TObject);
begin
  if CheckBox6.IsChecked then
  begin
    ComboBox6.Enabled := true;
    SpeedButton6.Enabled := true;
    FileToSearch.FirmwareVersion := ComboBox6.Items.Strings
      [ComboBox6.ItemIndex];
  end
  else if CheckBox6.IsChecked = false then
  begin
    ComboBox6.Enabled := false;
    SpeedButton6.Enabled := false;
    FileToSearch.FirmwareVersion := '';
  end;
end;

procedure TFormProperties.CheckBox7Change(Sender: TObject);
begin
  if CheckBox7.IsChecked then
  begin
    ComboBox7.Enabled := true;
    SpeedButton7.Enabled := true;
    FileToSearch.RemoteDebug := ComboBox7.Items.Strings[ComboBox7.ItemIndex];
  end
  else if CheckBox7.IsChecked = false then
  begin
    ComboBox7.Enabled := false;
    SpeedButton7.Enabled := false;
    FileToSearch.RemoteDebug := '';
  end;
end;

procedure TFormProperties.CheckBox8Change(Sender: TObject);
begin
  if CheckBox8.IsChecked then
  begin
    ComboBox8.Enabled := true;
    SpeedButton8.Enabled := true;
    FileToSearch.SimPriorityList := ComboBox8.Items.Strings
      [ComboBox8.ItemIndex];
  end
  else if CheckBox8.IsChecked = false then
  begin
    ComboBox8.Enabled := false;
    SpeedButton8.Enabled := false;
    FileToSearch.SimPriorityList := '';
  end;
end;

procedure TFormProperties.ComboBox1Change(Sender: TObject);
begin
  FormProperties.UpdateConfig;
  FormProperties.UpdateConfig;
end;

procedure TFormProperties.FormCreate(Sender: TObject);
var
  I, J: Integer;
  MyComboBox: TComboBox;
  IpAddress: String;
begin

  FileToSearch := TPerfectModem.Create;

  FSettingsFilePath := Extractfilepath(ParamStr(0));
  inifile := TMemIniFile.Create(FSettingsFilePath + 'Configurations.ini');

  for I := 1 to 8 do
  begin
    if (I > 0) AND (I < 5) then
    begin
      J := 1;
      Count := 1;
      while NOT(inifile.ReadString('IPFilters', 'IPAddress' + inttostr(J),
        '') = '') do
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Add(inifile.ReadString('IPFilters',
          'IPAddress' + inttostr(J), ''));
        J := J + 1;
        Count := Count + 1;
      end;

      if (I = 1) OR (I = 3) then
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
          TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Strings[0]);
      end
      else
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
          TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Strings[1]);
      end;
    end
    else if I = 5 then
    begin
      J := 1;
      while NOT(inifile.ReadString('ModemSettingsFilter',
        'ModemHeartbeat' + inttostr(J), '') = '') do
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Add(inifile.ReadString('ModemSettingsFilter',
          'ModemHeartbeat' + inttostr(J), ''));
        J := J + 1;
      end;
      TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
        TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.Strings[0]);
    end
    else if I = 6 then
    begin
      J := 1;
      while NOT(inifile.ReadString('ModemSettingsFilter',
        'FirmwareVersion' + inttostr(J), '') = '') do
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Add(inifile.ReadString('ModemSettingsFilter',
          'FirmwareVersion' + inttostr(J), ''));
        J := J + 1;
      end;
      TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
        TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.Strings[0]);
    end
    else if I = 7 then
    begin
      J := 1;
      while NOT(inifile.ReadString('ModemSettingsFilter',
        'RemoteDebug' + inttostr(J), '') = '') do
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Add(inifile.ReadString('ModemSettingsFilter',
          'RemoteDebug' + inttostr(J), ''));
        J := J + 1;
      end;
      TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
        TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.Strings[0]);
    end
    else if I = 8 then
    begin
      J := 1;
      while NOT(inifile.ReadString('ModemSettingsFilter',
        'SimPriorityList' + inttostr(J), '') = '') do
      begin
        TComboBox(FindComponent('Combobox' + inttostr(I)))
          .Items.Add(inifile.ReadString('ModemSettingsFilter',
          'SimPriorityList' + inttostr(J), ''));
        J := J + 1;
      end;
      TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
        TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.Strings[0]);
    end;
  end;
end;

procedure TFormProperties.SpeedButton1Click(Sender: TObject);
var
  IPNumber, I, J: Integer;
  NEW_IP_ADDRESS: String;
begin
  // add ip addresses
  inifile := TMemIniFile.Create(FSettingsFilePath + 'Configurations.ini');
  NEW_IP_ADDRESS := Inputbox('NEW IP ADDRESS',
    'Please enter the new IP Address', '1.2.3.4');
  if NOT(NEW_IP_ADDRESS = '1.2.3.4') then
  begin
    IPNumber := Count;
    inifile.writestring('IPFilters', 'IPAddress' + inttostr(IPNumber),
      NEW_IP_ADDRESS);
    inifile.UpdateFile;
    inifile.Free;
  end
  else
    exit;

  J := 1;
  while NOT(inifile.ReadString('IPFilters', 'IPAddress' + inttostr(J),
    '') = '') do
  begin
    J := J + 1; // how many ips
  end;

  for I := 1 to 8 do
  begin
    if (I > 0) AND (I < 5) then
    begin
      TComboBox(FindComponent('Combobox' + inttostr(I)))
        .Items.Add(inifile.ReadString('IPFilters',
        'IPAddress' + inttostr(J - 1), ''));
    end;
  end;

  { for I := 1 to 8 do
    begin
    if (I > 0) AND (I < 5) then
    begin
    J := 1;
    Count := 1;
    while NOT(inifile.ReadString('IPFilters', 'IPAddress' + inttostr(J),
    '') = '') do
    begin
    TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.Add(inifile.ReadString('IPFilters',
    'IPAddress' + inttostr(J), ''));
    J := J + 1;
    Count := Count + 1;
    end;

    if (I = 1) OR (I = 3) then
    begin
    TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
    TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.Strings[0]);
    end
    else
    begin
    TComboBox(FindComponent('Combobox' + inttostr(I))).ItemIndex :=
    TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.IndexOf(TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.Strings[1]);
    end;
    end }

  {
    TComboBox(FindComponent('Combobox' + inttostr(I)))
    .Items.Add(new_IP_Address);
    J := J + 1;
    Count := Count + 1;
  }
end;

procedure TFormProperties.UpdateConfig;
begin
  // update the config file
end;

procedure TFormProperties.UpdateOBJ;
begin
  // update the object to the new value;
end;

end.

{ inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  inifile.writestring('System', 'LastUsed', KeywordValue);
  inifile.UpdateFile;
  inifile.Free; }
