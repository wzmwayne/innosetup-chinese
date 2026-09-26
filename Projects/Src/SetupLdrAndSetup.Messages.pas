unit SetupLdrAndSetup.Messages;

{
  Inno Setup
  Copyright (C) 1997-2025 Jordan Russell
  Portions by Martijn Laan
  For conditions of distribution and use, see LICENSE.TXT.

  Message file handling functions - only to be used by Setup(Ldr)
}

{$IF not Defined(SETUPPROJ) and not Defined(SETUPLDRPROJ) }
  {$Message Error 'Only the Setup and SetupLdr projects should use this unit.'}
{$IFEND}

interface

uses
  Shared.SetupMessageIDs, Shared.Struct;

const
  SNewLine = #13#10;  { line break }
  SNewLine2 = #13#10#13#10;  { double line break }

var
  SetupMessages: array[TSetupMessageID] of String;
  MessagesLangOptions: TMessagesLangOptions;

function FmtMessage(S: PChar; const Args: array of String): String;
function FmtSetupMessage(const ID: TSetupMessageID; const Args: array of String): String;
function FmtSetupMessage1(const ID: TSetupMessageID; const Arg1: String): String;
procedure AssignSetupMessages(const P; const Size: Cardinal);
procedure LoadSetupMessages(const Filename: String; const Offset: Int64;
  const LoadMessagesLangOptions: Boolean);
function IntToHexStr8(I: Integer): String;

const
  { You don't have to translate these. The only time they are used is when an
    error occurs before or while the messages file is loaded. Otherwise, it
    uses the corresponding messages in the messages file. }
  SSetupFileMissing = '安装目录中缺少文件 %1。' +
    '请修正这个问题或获取程序的新副本。';
  SSetupFileCorrupt = '安装文件已损坏。请获取程序的' +
    '新副本。';
  SSetupFileCorruptOrWrongVer = '安装文件已损坏，或与 ' +
    '此版本的安装程序不兼容。请修正问题或 ' +
    '获取程序的新副本。';
  SMsgsFileMissing = '消息文件 "%s" 缺失。请修正 ' +
    '问题或获取程序的新副本。';
  { These currently always occur before the messages file is loaded }
  SMissingPassword = '请使用 /PASSWORD= 命令行参数指定密码。';
  SIncorrectPassword = '您输入的密码不正确，请重新输入。';

implementation

uses
  Windows, SysUtils, Compression.Base, Shared.CommonFunc, Shared.FileClass;

const
  SMsgsFileTooLarge = '内部错误：消息文件过大';

function FmtMessage(S: PChar; const Args: array of String): String;
var
  P: PChar;
  Z: String;
begin
  Result := '';
  if S = nil then Exit;
  while True do begin
    P := StrScan(S, '%');
    if P = nil then begin
      Result := Result + S;
      Break;
    end;
    if P <> S then begin
      SetString(Z, S, P - S);
      Result := Result + Z;
      S := P;
    end;
    Inc(P);
    if CharInSet(P^, ['1'..'9']) and (Ord(P^) - Ord('1') <= High(Args)) then begin
      Result := Result + Args[Ord(P^) - Ord('1')];
      Inc(S, 2);
    end
    else begin
      Result := Result + '%';
      Inc(S);
      if P^ = '%' then
        Inc(S);
    end;
  end;
end;

function FmtSetupMessage(const ID: TSetupMessageID; const Args: array of String): String;
begin
  Result := FmtMessage(PChar(SetupMessages[ID]), Args);
end;

function FmtSetupMessage1(const ID: TSetupMessageID; const Arg1: String): String;
begin
  Result := FmtSetupMessage(ID, [Arg1]);
end;

procedure FreeSetupMessages;
var
  I: TSetupMessageID;
begin
  for I := Low(SetupMessages) to High(SetupMessages) do
    SetupMessages[I] := '';
end;

procedure Corrupted;
begin
  raise Exception.Create(SSetupFileCorrupt);
end;

type
  PMessagesHeader = ^TMessagesHeader;

procedure AssignSetupMessages(const P; const Size: Cardinal);
{ Takes message data, and assigns the individual messages to SetupMessages. }
begin
  if (Size <= SizeOf(TMessagesHdrID) + SizeOf(TMessagesHeader)) or
     (TMessagesHdrID(P) <> MessagesHdrID) then
    Corrupted;
  const Header = PMessagesHeader(PByte(@P) + SizeOf(TMessagesHdrID));
  if (Header.TotalSize <> not Header.NotTotalSize) or
     (Header.TotalSize <> Size) or
     (Header.NumMessages <> (Ord(High(SetupMessages)) - Ord(Low(SetupMessages)) + 1)) then
    Corrupted;
  var M := PChar(PByte(Header) + SizeOf(TMessagesHeader));
  const EndP = PChar(PByte(@P) + Header.TotalSize);
  if (GetCRC32(M^, Cardinal((EndP - M) * SizeOf(Char))) <> Header.CRCMessages) or
     (EndP[-1] <> #0) then
    Corrupted;
  for var I := Low(SetupMessages) to High(SetupMessages) do begin
    if M >= EndP then
      Corrupted;
    const L = StrLen(M);
    SetString(SetupMessages[I], M, L);
    Inc(M, L + 1);
  end;
end;

procedure LoadSetupMessages(const Filename: String; const Offset: Int64;
  const LoadMessagesLangOptions: Boolean);
{ Loads Setup messages from an uncompressed file }
var
  F: TFile;
  TestID: TMessagesHdrID;
  Header: TMessagesHeader;
  P: Pointer;
begin
  FreeSetupMessages;
  if not NewFileExists(Filename) then
    raise Exception.CreateFmt(SMsgsFileMissing, [Filename]);
  F := TFile.Create(Filename, fdOpenExisting, faRead, fsRead);
  try
    F.Seek(Offset);
    if F.Read(TestID, SizeOf(TestID)) <> SizeOf(TestID) then
      Corrupted;
    if TestID <> MessagesHdrID then
      Corrupted;
    if F.Read(Header, SizeOf(Header)) <> SizeOf(Header) then
      Corrupted;
    if (Header.TotalSize <> not Header.NotTotalSize) or
       (Header.TotalSize <= SizeOf(TestID) + SizeOf(Header)) or
       (Header.NumMessages <> (Ord(High(SetupMessages)) - Ord(Low(SetupMessages)) + 1)) then
      Corrupted;

    F.Seek(Offset);
    GetMem(P, Header.TotalSize);
    try
      if F.Read(P^, Header.TotalSize) <> Header.TotalSize then
        Corrupted;
      AssignSetupMessages(P^, Header.TotalSize);
    finally
      FreeMem(P);
    end;

    if LoadMessagesLangOptions then begin
      if F.Read(MessagesLangOptions, SizeOf(MessagesLangOptions)) <> SizeOf(MessagesLangOptions) then
        Corrupted;
      if MessagesLangOptions.ID <> MessagesLangOptionsID then
        Corrupted;
    end;
  finally
    F.Free;
  end;
end;

function IntToHexStr8(I: Integer): String;
begin
  FmtStr(Result, '0x%.8x', [I]);
end;

initialization
finalization
  FreeSetupMessages;
end.
