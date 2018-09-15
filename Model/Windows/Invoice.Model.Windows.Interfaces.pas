unit Invoice.Model.Windows.Interfaces;

interface

uses
  System.Classes;

type
  iModelWindows = interface
     ['{809D7E61-B5FB-4849-BAE3-5CA5A1D05039}']
     function GetWindowsComputerName: String;
     function GetWindowsUserName: String;
     function GetAppInfo(AppInfo: String): String;
     function FileINI(FileName: String; Sector: String; Key: String; Value: String): String;
  end;

implementation

end.
