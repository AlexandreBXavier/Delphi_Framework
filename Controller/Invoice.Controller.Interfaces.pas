unit Invoice.Controller.Interfaces;

interface

type
     iControllerIniFileDefault = interface;
     iControllerWinInfoDefault = interface;
     iControllerAppInfoDefault = interface;

     iControllerIniFileFactory = interface
          ['{353DEFB6-3AF0-44D0-84EB-D520E664417E}']
          function Default: iControllerIniFileDefault;
     end;

     iControllerIniFileDefault = interface
          ['{A69FADDB-ACE2-4D43-AC05-B4A7E0054AA8}']
          function InputKey(Sector: String; Key: String; Value: String; IsCrypt: Boolean): String;
     end;

     iControllerWinInfoFactory = interface
          ['{8E4644BB-0F10-4F8D-B01A-896E3DC3F1D3}']
          function Default: iControllerWinInfoDefault;
     end;

     iControllerWinInfoDefault = interface
          ['{C6FF4BD0-606C-4B7E-A4AE-C263868DAF86}']
          function UserName: String;
          function ComputerName: String;
     end;

     iControllerAppInfoFactory = interface
          ['{F69EB5A1-57B8-4144-94C0-94DAFA900551}']
          function Default: iControllerAppInfoDefault;
     end;

     iControllerAppInfoDefault = interface
          ['{DF23FDBC-7819-4A0E-B4E2-2289313CFB28}']
          function CompanyName: String;
          function FileDescription: String;
          function FileVersion: String;
          function InternalName: String;
          function LegalCopyright: String;
          function LegalTradeMarks: String;
          function OriginalFilename: String;
          function ProductName: String;
          function ProductVersion: String;
          function Comments: String;
     end;


implementation

end.
