unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.strutils, System.inifiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Edit,
  FMX.ComboEdit, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.ScrollBox, FMX.Memo,
  System.ImageList, FMX.ImgList;

type
  TFormFileEditor = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    gb_sequential: TGroupBox;
    rb_sequential: TRadioButton;
    rb_unsequential: TRadioButton;
    Panel4: TPanel;
    Label1: TLabel;
    edt_start_files: TEdit;
    edt_end_files: TEdit;
    Label2: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    ListBox1: TListBox;
    Panel6: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Line1: TLine;
    Label5: TLabel;
    Line2: TLine;
    edt_num_files: TEdit;
    btn_change_num_files: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Label6: TLabel;
    Panel9: TPanel;
    Label7: TLabel;
    edt_File_Location: TEdit;
    Button3: TButton;
    Memo1: TMemo;
    Panel10: TPanel;
    Panel11: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel12: TPanel;
    Panel13: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ComboEdit1: TComboEdit;
    ToolBar1: TToolBar;
    SpeedButton6: TSpeedButton;
    Panel14: TPanel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    Panel15: TPanel;
    procedure rb_unsequentialChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edt_start_filesKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    function IsNumber(N: String): Boolean;
    procedure edt_end_filesKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure rb_sequentialChange(Sender: TObject);
    procedure addItemToListBox();
    procedure Button2Click(Sender: TObject);
    procedure ChangeNumofFiles();
    function doesRepeat(ReceivedValue: String): Boolean;
    function ParseValue(Value: String): String;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_change_num_filesClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChangeFileType();
    procedure ChangeFileLocation();
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFileEditor: TFormFileEditor;
  FStartNumber, FEndNumber: Integer;
  CancelPressed: Boolean;
  FSettingsFilePath: String;
  inifile: TMemIniFile;
  FileLocation: String;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

procedure TFormFileEditor.addItemToListBox;
var
  UserInputString: String;
begin
  CancelPressed := false;
  UserInputString := inputbox('Add New',
    'Please eneter the last 1 to 4 numbers of the file name:', 'e.g. 20');

  if IsNumber(UserInputString) then
  begin
    if doesRepeat(UserInputString) then
    begin
      ListBox1.Items.Add(ParseValue(UserInputString));
    end
    else
    begin
      showmessage('File: ' + ParseValue(UserInputString) +
        '.config, already exists in the list!');
    end;

  end
  else if UserInputString = '' then
  begin
    showmessage('Please enter the last few numbers of the serial number:');
    addItemToListBox;
  end
  else if UserInputString = 'e.g. 20' then
  begin
    showmessage('No file name was added to list');
    CancelPressed := true;
  end;

end;

procedure TFormFileEditor.btn_change_num_filesClick(Sender: TObject);
var
  I: Integer;
  NumberofFilesNeeded: Integer;
begin
  if IsNumber(edt_num_files.Text) then
  begin
    NumberofFilesNeeded := strtoint(edt_num_files.Text);
    for I := ListBox1.Items.count downto NumberofFilesNeeded do
    begin
      ListBox1.Items.Delete(I);
    end;
  end
  else
    showmessage('Please enter the number of files needed');
end;

procedure TFormFileEditor.Button1Click(Sender: TObject);
begin
  addItemToListBox;
  ChangeNumofFiles;
end;

procedure TFormFileEditor.Button2Click(Sender: TObject);
begin
  // Listbox1.ItemIndex[listbox1.Selected.Index];
  if ListBox1.Items.count = 0 then
  begin
    showmessage('There are no items to be removed');
  end
  else if ListBox1.ItemIndex > -1 then // always check if something is selected
  begin
    ListBox1.Items.Delete(ListBox1.ItemIndex);
  end
  else
    showmessage('Please Select an Item to remove');

  ChangeNumofFiles;
end;

procedure TFormFileEditor.Button3Click(Sender: TObject);
var
  I: Integer;
begin
  ChangeFileType;
  ChangeFileLocation;

  if FileLocation <> '' then
  begin
    if NOT(ListBox1.count = 0) then
    begin
      ProgressBar1.Max := ListBox1.count;
      ProgressBar1.Value := 0;
      for I := 0 to ListBox1.count - 1 do
      begin
        ProgressBar1.Value := I + 1;
        Memo1.Lines.SaveToFile(FileLocation + '\' + ListBox1.Items.Strings[I] +
          ComboEdit1.Text);
      end;

      if ProgressBar1.Value = ProgressBar1.Max then
      begin
        showmessage('Files have been made!');
        ProgressBar1.Value := 0;
      end
      else
      begin
        showmessage('Please add files to the list!');
      end;

    end;
  end;

end;

procedure TFormFileEditor.ChangeNumofFiles;
begin
  edt_num_files.Text := inttostr(ListBox1.Items.count);
end;

procedure TFormFileEditor.ChangeFileLocation;
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  inifile.writestring('System', 'FileLocation', edt_File_Location.Text);
  FileLocation := edt_File_Location.Text;
  inifile.UpdateFile;
  inifile.Free;
end;

procedure TFormFileEditor.ChangeFileType;
begin
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  inifile.writestring('System', 'FileType', ComboEdit1.Text);
  inifile.UpdateFile;
  inifile.Free;
end;

function TFormFileEditor.doesRepeat(ReceivedValue: String): Boolean;
var
  I: Integer;
  InList: Boolean;
begin
  InList := true;
  if ListBox1.Items.count > 0 then
  begin
    for I := 0 to ListBox1.Items.count - 1 do
    begin
      if ListBox1.Items.Strings[I] = ParseValue(ReceivedValue) then
      begin
        InList := false;
        result := false;
        break;
      end;
    end;
    if InList then
    begin
      result := true;
    end;
  end;
end;

procedure TFormFileEditor.edt_start_filesKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (NOT(edt_start_files.Text = '')) AND (NOT(IsNumber(edt_start_files.Text)))
  then
  begin
    showmessage('ONLY USE NUMBERS!');
    edt_start_files.Text := copy(edt_start_files.Text, 0,
      (Length(edt_start_files.Text) - 1));
  end
  else if NOT(edt_start_files.Text = '') then
  begin
    FStartNumber := strtoint(edt_start_files.Text);
  end;

end;

procedure TFormFileEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProgressBar1.Value := 0;
end;

procedure TFormFileEditor.FormCreate(Sender: TObject);
var
  I: Integer;
  jumpstring: string;
begin
  FSettingsFilePath := Extractfilepath(ParamStr(0));
  inifile := TMemIniFile.create(FSettingsFilePath + 'Configurations.ini');
  ComboEdit1.Text := inifile.ReadString('System', 'FileType', '');
  FileLocation := inifile.ReadString('System', 'FileLocation', '');
  edt_File_Location.Text := FileLocation;

  I := 1;
  while true do
  begin
    if NOT(inifile.ReadString('FileExtensions', 'Type' + inttostr(I), '') = '')
    then
    begin
      jumpstring := inifile.ReadString('FileExtensions',
        'Type' + inttostr(I), '');
      ComboEdit1.Items.Add(jumpstring);
    end
    else
      break;
    I := I + 1;
  end;

end;

procedure TFormFileEditor.edt_end_filesKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (NOT(edt_end_files.Text = '')) AND (NOT(IsNumber(edt_end_files.Text))) then
  begin
    showmessage('ONLY USE NUMBERS!');
    edt_end_files.Text := copy(edt_end_files.Text, 0,
      (Length(edt_end_files.Text) - 1));
  end
  else if NOT(edt_end_files.Text = '') then
  begin
    FEndNumber := strtoint(edt_end_files.Text);
  end;

end;

function TFormFileEditor.IsNumber(N: String): Boolean;
var
  I: Integer;
begin
  result := true;
  if Trim(N) = '' then
    exit(false);

  if (Length(Trim(N)) > 1) and (Trim(N)[1] = '0') then
    exit(false);

  for I := 1 to Length(N) do
  begin
    if not(N[I] in ['0' .. '9']) then
    begin
      result := false;
      break;
    end;
  end;
end;

function TFormFileEditor.ParseValue(Value: String): String;
begin
  case Value.Length of
    1:
      result := ('1000000' + Value);
    2:
      result := ('100000' + Value);
    3:
      result := ('10000' + Value);
    4:
      result := ('1000' + Value);
  else
    showmessage('Cannot enter more than 4 numbers');
    result := '0';
  end;
end;

procedure TFormFileEditor.rb_sequentialChange(Sender: TObject);
begin
  if rb_sequential.IsChecked then
  begin
    Panel4.Enabled := true;
    edt_start_files.Text := inttostr(FStartNumber);
    edt_end_files.Text := inttostr(FEndNumber);
  end;
end;

procedure TFormFileEditor.rb_unsequentialChange(Sender: TObject);
begin
  if rb_unsequential.IsChecked then
  begin
    Panel4.Enabled := false;
    edt_start_files.Text := '0';
    edt_end_files.Text := '0';
  end;
end;

procedure TFormFileEditor.SpeedButton1Click(Sender: TObject);
var
  Caption: String;
  Root: String;
  Directory: String;
begin
  Caption := 'Select a Folder';
  selectdirectory(Caption, FileLocation, Directory);

  edt_File_Location.Text := Directory;

  ChangeFileLocation;
end;

procedure TFormFileEditor.SpeedButton2Click(Sender: TObject);
var
  buttonSelected: Integer;
  MSGString: String;
begin
  MSGString := 'Do you want to remove all of the items in the list.';
  case messagedlg(MSGString, TMsgDlgType.mtConfirmation, mbokcancel, 0) of
    mrOK:
      begin
        ListBox1.Items.Clear;
      end;
  end;

  ChangeNumofFiles;
end;

procedure TFormFileEditor.SpeedButton3Click(Sender: TObject);
var
  I, count: Integer;
  NumofFilesS: String;
begin
  CancelPressed := false;
  // does it alot of times
  NumofFilesS := inputbox('Number of Files',
    'Please eneter the Amount of Files to be added to the list:', 'e.g. 20');
  if IsNumber(NumofFilesS) then
  begin
    count := strtoint(NumofFilesS);
  end;

  for I := 0 to count - 1 do
  begin
    if CancelPressed then
    begin
      break;
    end
    else
    begin
      addItemToListBox;
      ChangeNumofFiles
    end;

  end;

end;

procedure TFormFileEditor.SpeedButton4Click(Sender: TObject);
var
  buttonSelected: Integer;
  MSGString: String;
begin
  MSGString := 'Do you want to remove all of the items in the list.';
  case messagedlg(MSGString, TMsgDlgType.mtConfirmation, mbokcancel, 0) of
    mrOK:
      begin
        ListBox1.Items.Clear;
        edt_start_files.Text := '0';
        edt_end_files.Text := '0';
      end;
  end;

  ChangeNumofFiles;

end;

procedure TFormFileEditor.SpeedButton5Click(Sender: TObject);
var
  I, Start, Stop: Integer;
begin
  Start := strtoint(edt_start_files.Text);
  Stop := strtoint(edt_end_files.Text);

  ListBox1.Items.Clear;

  if Start >= Stop then
  begin
    showmessage('Please Check your values');
    edt_start_files.Text := '0';
    edt_end_files.Text := '0';
  end
  else
  begin
    for I := Start to Stop do
    begin
      ListBox1.Items.Add(ParseValue(inttostr(I)));
    end;
    ChangeNumofFiles;
  end;
end;

procedure TFormFileEditor.SpeedButton6Click(Sender: TObject);
begin
  FormFileEditor.Hide;
  ProgressBar1.Value := 0;
end;

end.
