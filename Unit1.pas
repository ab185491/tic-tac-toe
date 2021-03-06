unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    strngrd1: TStringGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    procedure strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  isCircleTurn: Boolean;
  counter : Integer;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i: Integer;
  j: Integer;
begin
    counter := 0;
    isCircleTurn := False;
    for i := 0 to 2 do
      for j := 0 to 2 do
        strngrd1.Cells[i, j] := '';
    strngrd1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     isCircleTurn := False;
     counter := 0;
end;

function checkForGameOver(strngrd1: TStringGrid): Boolean;
var
  i, j: Integer;
  value : string;
  flag : Boolean;
begin
     for i := 0 to 2 do
     begin
        value := strngrd1.cells[i, 0];
        if (value = '')then
          Break;
        flag  := True;
        for j := 1 to 2 do
        begin
          if (strngrd1.Cells[i, j] <> value) then
          begin
            flag := False;
            Break;
          end;
        end;
        if (flag = True) then
        begin
          Result := True;
          Exit
        end;
     end;

     for i := 0 to 2 do
     begin
        value := strngrd1.cells[0, i];
        if (value = '') then
            Break;
        flag  := True;
        for j := 1 to 2 do
        begin
          if (strngrd1.Cells[j, i] <> value) then
          begin
            flag := False;
            Break;
          end;
        end;
        if (flag = True) then
        begin
          Result := True;
          Exit
        end;
     end;

     if ((strngrd1.cells[0,0] = strngrd1.cells[1, 1]) and (strngrd1.cells[1, 1] = strngrd1.cells[2,2]) and (strngrd1.cells[0,0] <> '')) then
     begin
       Result := True;
       Exit;
     end;

     if ((strngrd1.cells[2,0] = strngrd1.cells[1, 1]) and (strngrd1.cells[1, 1] = strngrd1.cells[0,2]) and (strngrd1.cells[2,0] <> '')) then
     begin
       Result := True;
       Exit;
     end;

     Result := False;

end;


function checkForDraw(strngrd1 : TStringGrid): Boolean;
//var
//  I: Integer;
//  J: Integer;
begin
//    for I := 0 to 2 do
//      for J := 0 to 2 do
//      begin
//        if (strngrd1.cells[I, J] = '' ) then
//        begin
//          Result := False;
//          Exit;
//        end;
//
//      end;
      if(counter = 9) then
        begin
           Result := True;
        end
      else
        Result := False;
end;

procedure TForm1.strngrd1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
      if (strngrd1.Cells[ACol, ARow] = '') then
      begin
          if(isCircleTurn) then
          begin
               strngrd1.Cells[ACol, ARow] := 'O';
               counter := counter + 1;
               if(checkForGameOver(strngrd1)) then
               begin
                  lbl3.Caption :=  'O Wins the Game' ;
                  strngrd1.Enabled := False;
                  btn1.Enabled := True;
               end
               else if (checkForDraw(strngrd1)) then
               begin
                    lbl3.Caption :=  'Draw';
                    strngrd1.Enabled := False;
                    btn1.Enabled := True;
               end
               else
                lbl2.Caption := 'X`s Turn' ;
          end
          else
          begin
              strngrd1.Cells[ACol, ARow] := 'X';
              counter := counter + 1;
              if(checkForGameOver(strngrd1)) then
               begin
                  lbl3.Caption :=  'X Wins the Game' ;
                  strngrd1.Enabled := False;
                  btn1.Enabled := True;
               end
               else if (checkForDraw(strngrd1)) then
               begin
                    lbl3.Caption :=  'It is a Draw';
                    strngrd1.Enabled := False;
                    btn1.Enabled := True;
               end
               else
                lbl2.Caption := 'O`s Turn' ;
              
          end;
          isCircleTurn := not isCircleTurn;
          CanSelect := False;
      end;

end;



end.
