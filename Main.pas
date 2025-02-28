unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  erreichtePkt, MaxPkt: Integer;
  Prozent: Real;
  Note: String;
begin
  erreichtePkt := StrToInt(Edit1.Text);
  MaxPkt := StrToInt(Edit2.Text);

  if MaxPkt <= 0 then raise Exception.Create('Maximale Punktzahl darf nicht 0 oder kleiner sein!');
  if erreichtePkt > MaxPkt then raise Exception.Create('Maximale Punktzahl darf nicht kleiner sein als die Erreichte Punktzahl!');

  Prozent := erreichtePkt / MaxPkt * 100;

  // Quelle: https://de.wikipedia.org/wiki/Vorlage%3APunktesystem_der_gymnasialen_Oberstufe
  case Trunc(Prozent) of
    95 .. 100:
      Note := 'Sehr gut (15)';
    90 .. 94:
      Note := 'Sehr gut (14)';
    85 .. 89:
      Note := 'Sehr gut (13)';
    80 .. 84:
      Note := 'Gut (12)';
    75 .. 79:
      Note := 'Gut (11)';
    70 .. 74:
      Note := 'Gut (10)';
    65 .. 69:
      Note := 'Befriedigend (9)';
    60 .. 64:
      Note := 'Befriedigend (8)';
    55 .. 59:
      Note := 'Befriedigend (7)';
    50 .. 54:
      Note := 'Ausreichend (6)';
    45 .. 49:
      Note := 'Ausreichend (5)';
    40 .. 44:
      Note := 'Schwach ausreichend (4)';
    33 .. 39:
      Note := 'Mangelhaft (3)';
    27 .. 32:
      Note := 'Mangelhaft (2)';
    20 .. 26:
      Note := 'Mangelhaft (1)';
    0 .. 19:
      Note := 'Ungenügend (0)';
  end;

  ShowMessage('Deine Note:' + Note);
end;

end.
