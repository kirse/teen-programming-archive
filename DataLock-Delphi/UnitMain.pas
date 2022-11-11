// -----------------------------------
// Data-Lock 2.0                     |
// -----------------------------------
// by Eric Kirse                     |
// http://www.kirsenet.com           |
// ---------------------------------------------------------------------
// --This program is BY NO MEANS to be replaced by algoritms such as
//  Rijndael or RC6!!  It is a pretty good example of encryption,
//  and teaches you some other things also (arrays, loading files, etc).
// --This algorithm is easily good enough to hide data from parents,
//  "illiterate" friends, wannabe hackers, siblings, etc.
// --The algorithm was written completely by ME!  You will not find it
// anywhere else on the net.
//
// -One last Note-:
// If you liked/used this code, please vote.  I will not force it on
// you or constantly show message boxes (like some users...).  I appreciate
// feedback.
// Thanks, Eric Kirse.

unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Gauges, UnitWait, UnitAbout, IdGlobal,
  Menus, ActnList, StdActns;

type
  TMain = class(TForm)
    Panel1: TPanel;
    Data: TRichEdit;
    Decrypt: TSpeedButton;
    GroupBox1: TGroupBox;
    KeyBox: TEdit;
    Encrypt: TSpeedButton;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    LoadFile: TMenuItem;
    SaveFile: TMenuItem;
    N1: TMenuItem;
    ExitDataLock: TMenuItem;
    Controls1: TMenuItem;
    DecryptData1: TMenuItem;
    EncryptData1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure EncryptClick(Sender: TObject);
    procedure DecryptClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DecryptData1Click(Sender: TObject);
    procedure EncryptData1Click(Sender: TObject);
    procedure LoadFileClick(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure ExitDataLockClick(Sender: TObject);
  private
    { Private declarations }
  public
    function EncryptData(Data: AnsiString): AnsiString;
    function Mid(Source: String; Start: integer; Length: integer): String;
    function Lft(Source: String; Length: integer): String;
    function GetAsciiVal(const sChar: String): Integer;
    function HexToDec(HexStr: AnsiString): AnsiString;
    function DecryptData(Data: AnsiString): AnsiString;
    function KeyCheck(UserKey: ShortString; Data: AnsiString): Boolean;
    procedure KeyCode(Key: ShortString);
  end;

var
  Main: TMain;
  PassChar: array[1..51] of ShortString;
  keyLen: Integer;
  keyActual: ShortString;

implementation

{$R *.dfm}

function TMain.KeyCheck(UserKey: ShortString; Data: AnsiString): Boolean;
// used to verify user has entered the correct key
//  i could not figure how to extract the key from the data itself,
//  so i simply put it at the beginning of the data.
//  INSECURE, I KNOW - but if the user deletes the key from the front,
//  they wont be able to decode it, they would have to disable this
//  function - this program is still good enough to hide data
//  from 90% of the general public...
var
        theEncKey: ShortString;
        theEncUserKey: ShortString;
        userPassChars: array[1..51] of ShortString;
        i: Integer;
        keyStrLen: ShortString;
        keyLen: Integer;
begin
        Result := False;
        theEncUserKey := '';
        keyLen := 0;
        keyStrLen := Mid(Data,1,2);
        // the length of our key is the number at the beginning
        //  of the data.

        // make sure it really is a number
        if IsNumeric(Char(keyStrLen[1])) then
          begin
            if IsNumeric(Char(keyStrLen[2])) then
              begin
                keyLen := StrToInt(keyStrLen);
              end;
          end
        else
          begin
                ShowMessage('Invalid data format.  Cannot verify key.');
                Exit;
          end;

        // extract the actual (correct key) from the data
        theEncKey := Mid(Data,3,keyLen);

                // this is the key (may be correct) that the user
                //  has entered
                for i := 1 to Length(UserKey) do
                begin
                        // chop their input into bits, and encrypt it -
                        // to be compared with the correct keys
                        userPassChars[i] := Mid(UserKey,i,1);
                        userPassChars[i] := IntToHex((255 Mod GetAsciiVal(userPassChars[i]) + 32),2);
                        theEncUserKey := theEncUserKey + userPassChars[i];
                end;

                // has the user entered the correct key?
                if Length(theEncUserKey) <> Length(theEncKey) then
                begin
                  KeyCheck := False;
                  // nope
                end
                else
                begin
                if theEncUserKey = theEncKey then
                begin
                  KeyCheck := True;
                  // yup
                end
                else
                begin
                  KeyCheck := False;
                  // nope
                end;
                end;
end;

function TMain.DecryptData(Data: AnsiString): AnsiString;
var
        fiveDataBit: ShortString;
        sixDataBit: ShortString;
        decombinedChar: ShortString;
        buildUpString: AnsiString;
        actualChar: ShortString;
        keyLen: ShortString;
        dataLen: LongWord;
        i: LongWord;
begin
        buildUpString := '';
        actualChar := '';
        decombinedChar := '';

        keyLen := Mid(Data,1,2);
        i := StrToInt(keyLen) + 3;
        dataLen := Length(Data);

        WaitForm.Progress.MaxValue := dataLen;
        WaitForm.Top := Main.Top + 80;
        WaitForm.Left := Main.Left + 50;
        WaitForm.Show;

        while (i <= dataLen) do
        begin
                fiveDataBit := Mid(Data,i,5);
                // get our hexed data
                sixDataBit := HexToDec(fiveDataBit);
                // hexToDec it - get a sixBit string
                decombinedChar := Mid(sixDataBit,1,3);
                // get the 3-char code from the 6-char string

                // our case to translate the 3-char string to an
                //  ASCII value
                case StrToInt(decombinedChar) of
                009, 309, 409, 509, 609, 709, 809, 909: decombinedChar := Lft(decombinedChar,1);
                253, 263, 273, 283, 293, 303, 313, 323, 330, 340, 350, 360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 660, 670, 680, 690, 700, 710, 726, 736, 746, 756, 766, 776, 786, 796, 806, 816, 826, 836, 846, 852, 862, 872, 882, 892, 902, 912, 922, 932, 942, 952, 962, 972, 982, 992: decombinedChar := Lft(decombinedChar,2);
                721: decombinedChar := '1';
                731: decombinedChar := '2';
                741: decombinedChar := '10';
                751: decombinedChar := '11';
                761: decombinedChar := '12';
                771: decombinedChar := '13';
                781: decombinedChar := '14';
                791: decombinedChar := '15';
                801: decombinedChar := '16';
                811: decombinedChar := '17';
                821: decombinedChar := '18';
                831: decombinedChar := '19';
                841: decombinedChar := '20';
                851: decombinedChar := '21';
                861: decombinedChar := '22';
                871: decombinedChar := '23';
                881: decombinedChar := '24';
                891: decombinedChar := '25';
                end;

                // convert our extracted ascii value to the
                //  character
                actualChar := Char(StrToInt(deCombinedChar));

                // build the character onto the string
                buildUpString := buildUpString + actualChar;

                // update our progress bar
                waitform.Progress.Progress := i;

                // the next bit (of length 5)
                i := i + 5;
        end;
        waitform.Progress.Progress := 0;
        waitform.Hide;
        DecryptData := buildUpString;
end;

function TMain.EncryptData(Data: AnsiString): AnsiString;
var
        tempString: AnsiString;
        combinedChars: ShortString;
        tempChar: ShortString;
        buildUpString: AnsiString;
        tempKeyChar: ShortString;
        tempKeyActual: AnsiString;

        dataLen: LongWord;
        i: LongWord;
        curKeyCodeNum: Byte;
begin
        tempString := '';
        combinedChars := '';
        tempChar := '';
        buildUpString := '';
        tempKeyChar := '';
        tempKeyActual := '';

        // the key is not long enough - or too long
        if (keyLen <= 1) then
                Exit;
        if (keyLen > 50) then
                Exit;

        curKeyCodeNum := 1;
        dataLen := Length(Data);
        tempString := Data;

        // set our progress-bar
        WaitForm.Progress.MaxValue := dataLen;

        // since i put the length of the key as the first 2-chars of the data
        //  the key length could be 9,8,7, etc.  Well, I extract the first
        //  TWO characters to get the length of the key, so we need to add
        //  a "0" to the keylength if it is less than 10.
        if Length(keyActual) < 10 then
        begin
                tempKeyActual := '0' + IntToStr(Length(KeyActual)) + keyActual;
                // our key is the first string to be built onto our
                //  encrypted data
                buildUpString := tempKeyActual + buildUpString;
        end
        else
        begin
                // the key is longer than ten, so no need to add a "0"
                buildUpString := IntToStr(Length(KeyActual)) + keyActual + buildUpString;
        end;
        
        WaitForm.Top := Main.Top + 80;
        WaitForm.Left := Main.Left + 50;
        WaitForm.Show;

        for i := 1 to dataLen do
        begin
                // used to go through the key and attach it to data.
                if curKeyCodeNum = KeyLen then
                begin
                        curKeyCodeNum := 1;
                end;

                // get our first character to encrypt - convert to its
                //  ascii value
                tempChar := IntToStr(GetAsciiVal(Mid(tempString,i,1)));

                // our current hexed key-bit, temporarily dehex it, as
                //  we are going to attach it to some data
                tempKeyChar := HexToDec(PassChar[curKeyCodeNum]);

                // basically, i want to have a 3-char number to represent
                //  the ascii value.  since some characters have ASCII
                //  value of say... 169, i dont need to convert them
                //  to a 3-char number (169 is 3-chars!)

                if Length(tempChar) = 2 then
                begin
                        // so, numbers 0-99 need to be "padded", so they
                        //  are 3-char numbers
                        case StrToInt(tempChar) of
                        0: tempChar := tempChar + '09';
                        1: tempChar := '721';
                        2: tempChar := '731';
                        3..9: tempChar := tempChar + '09';
                        10: tempChar := '741';
                        11: tempChar := '751';
                        12: tempChar := '761';
                        13: tempChar := '771';
                        14: tempChar := '781';
                        15: tempChar := '791';
                        16: tempChar := '801';
                        17: tempChar := '811';
                        18: tempChar := '821';
                        19: tempChar := '831';
                        20: tempChar := '841';
                        21: tempChar := '851';
                        22: tempChar := '861';
                        23: tempChar := '871';
                        24: tempChar := '881';
                        25: tempChar := '891';
                        26..32: tempChar := tempChar + '3';
                        33..71: tempChar := tempChar + '0';
                        72..84: tempChar := tempChar + '6';
                        85..99: tempChar := tempChar + '2';
                        end;
                end;

                if Length(tempKeyChar) = 2 then
                begin
                        // i also pad the ascii value of our keychars
                        //  since i will later combine the two 3-char numbers
                        case StrToInt(tempKeyChar) of
                        0..9: tempKeyChar := tempKeyChar + '05';
                        10: tempKeyChar := tempKeyChar + '2';
                        11..16: tempKeyChar := tempKeyChar + '7';
                        17..32: tempKeyChar := tempKeyChar + '1';
                        33..35: tempKeyChar := tempKeyChar + '6';
                        36..45: tempKeyChar := tempKeyChar + '3';
                        46..61: tempKeyChar := tempKeyChar + '4';
                        62..83: tempKeyChar := tempKeyChar + '9';
                        84..89: tempKeyChar := tempKeyChar + '5';
                        90..99: tempKeyChar := tempKeyChar + '8';
                        end;
                end;

                // combine our 2, 3-char numbers like so:
                // 3-char NUMBER (from data) + 3-char NUMBER (from key) = [6-char FINAL NUMBER]
                //  this 6-char final number is also hexed, so that it has a length of 5-chars
                //  all 6-char numbers created 5-char hexed values (useful for decryption)
                combinedChars := IntToHex(StrToInt(tempChar + tempKeyChar),5);

                // add our 5-char string to final encrypted string
                buildUpString := buildUpString + combinedChars;

                // next key bit
                curKeyCodeNum := curKeyCodeNum + 1;

                // update our progress bar
                WaitForm.Progress.Progress := i;
        end;
        waitform.Progress.Progress := 0;
        WaitForm.Hide;

        // return our encrypted string
        EncryptData := buildUpString;
end;

procedure TMain.KeyCode(Key: ShortString);
// used to generate a key based on user input (for encrypting)
var
        i: Integer;
        keyAsc: Integer;
begin
        if keyActual <> '' then
                keyActual := '';

        keyLen := Length(Key);

        if (keyLen <= 1) then
                ShowMessage('You must have an encryption key in order to encrypt data!');

        if (keyLen > 50) then
                ShowMessage('Please enter an encryption key under 50 characters.');

        for i := 1 to keyLen do
        begin
                // pretty self explanatory
                PassChar[i] := Mid(Key,i,1);
                keyAsc := GetAsciiVal(PassChar[i]);
                PassChar[i] := IntToStr(((255 Mod keyAsc) + 32));
                PassChar[i] := IntToHex(StrToInt(PassChar[i]),2);

                // add our bit to the final string
                keyActual := keyActual + PassChar[i];
        end
end;

procedure TMain.FormCreate(Sender: TObject);
begin
        Main.Top := 100;
        Main.Left := 100;
        data.PlainText := True;
        Data.Clear;

        // this will allow a user to associate Data-Lock with .dlf files,
        //  or drag a file over the application (and it will open it)!
        if (ParamCount > 0) and FileExists(ParamStr(1)) then
        begin
          Data.Lines.LoadFromFile(ParamStr(1));
        end;
end;

procedure TMain.EncryptClick(Sender: TObject);
begin
        WaitForm.Caption := 'Please Wait... Encrypting';
        KeyCode(KeyBox.Text);
        Data.Text := EncryptData(Data.Text);
        WaitForm.Caption := '';
end;

function TMain.Lft(Source: string; Length: integer): string;
// actually the "Left" function, i misspelled it somehow, was too lazy
// to change it
begin
  Result := copy(Source,1,Length);
end;

function TMain.Mid(Source: string; Start: integer; Length: integer): string;
begin
// gets a string based on position and length
  Result := copy(Source,Start,Length);
end;

function TMain.GetAsciiVal(const sChar: String): Integer;
begin
  Result := 0; // Reset the value of the Result because when delphi
               // creates ordinal variables their values are hardly ever 0
  if length(sChar) > 0 then
    Result := integer(char(sChar[1])); // what we do here is take the first
                                       // character in the string, cast it to
                                       // a char type variable and then the
                                       // integer() type cast will tell you
                                       // the ascii value of the character
end;

function TMain.HexToDec(HexStr: AnsiString): AnsiString;
// convert hexadecimal values to decimal
//  used in decryption function
var
        mult: Integer;
        decNum: Integer;
        ch: AnsiString;
        i: Integer;
begin
        mult := 1;
        decNum := 0;
        
        for i := Length(HexStr) downto 1 do
        begin
                ch := Mid(HexStr,i,1);
                if (ch >= '0') And (ch <= '9') then
                begin
                        decNum := decNum + (StrToInt(ch) * mult)
                end
                else
                begin
                    if (ch >= 'A') And (ch <= 'F') then
                    begin
                      decNum := decNum + ((GetAsciiVal(ch) - GetAsciiVal('A') + 10) * mult)
                    end
                    else
                    begin
                        if (ch >= 'a') And (ch <= 'f') Then
                        begin
                        decNum := decNum + ((GetAsciiVal(ch) - GetAsciiVal('a') + 10) * mult)
                        end

                        else
                        begin
                        Result := '';
                        exit;
                        end;
                    end;
                end;
        mult := mult * 16;
        end;
        Result := IntToStr(decNum);
end;
                  ck

procedure TMain.DecryptClick(Sender: TObject);
var
        keyCorrect: Boolean;
begin
        // did the user input the correct key?
        //  if so, decrypt.
        keyCorrect := KeyCheck(KeyBox.Text,Data.Text);

        if KeyCorrect = True then
        begin
          WaitForm.Caption := 'Please Wait... Decrypting';
          Data.Text := DecryptData(Data.Text);
          WaitForm.Caption := '';
        end
        else
        begin
          ShowMessage('Error: You have entered the incorrect key.');
        end;

end;

procedure TMain.AboutClick(Sender: TObject);
begin
        AboutForm.Top := Main.Top + 80;
        AboutForm.Left := Main.Left + 50;
        AboutForm.Show;
end;

procedure TMain.About1Click(Sender: TObject);
begin
        AboutForm.Top := Main.Top + 80;
        AboutForm.Left := Main.Left + 50;
        AboutForm.Show;
end;

procedure TMain.DecryptData1Click(Sender: TObject);
var
        keyCorrect: Boolean;
begin
        keyCorrect := KeyCheck(KeyBox.Text,Data.Text);

        if KeyCorrect = True then
        begin
          WaitForm.Caption := 'Please Wait... Decrypting';
          Data.Text := DecryptData(Data.Text);
          WaitForm.Caption := '';
        end
        else
        begin
          ShowMessage('Error: You have entered the incorrect key.');
        end;
end;

procedure TMain.EncryptData1Click(Sender: TObject);
begin
        WaitForm.Caption := 'Please Wait... Encrypting';
        KeyCode(KeyBox.Text);
        Data.Text := EncryptData(Data.Text);
        WaitForm.Caption := '';
end;

procedure TMain.LoadFileClick(Sender: TObject);
begin
        OpenDialog.Execute;
        if OpenDialog.FileName = '' then
          begin
          end
        else
          begin
                // loads a file...
                Data.Lines.LoadFromFile(OpenDialog.Filename);
          end;
end;

procedure TMain.SaveFileClick(Sender: TObject);
begin
        SaveDialog.execute;
        if SaveDialog.FileName = '' then
          begin
          end
        else
          begin
                // save our data to a file (user-specified)
        Data.Lines.SaveToFile(SaveDialog.FileName);
          end;
end;

procedure TMain.ExitDataLockClick(Sender: TObject);
begin
        // close data-lock
        Close();
end;

end.
