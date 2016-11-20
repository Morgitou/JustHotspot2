
' Copyright (C) Microsoft.  All rights reserved.

Main( )

function Main()
    	  
    DIM objShare
    DIM objEveryColl
    
    set objShare = Wscript.CreateObject("HNetCfg.HNetShare.1")
    if(IsObject(objShare) = FALSE ) then
        exit function
    end if
    
    set objEveryColl = objShare.EnumEveryConnection
    
    if (IsObject(objEveryColl) = TRUE) then
    
    DIM objNetConn
    
    for each objNetConn in objEveryColl
      DIM objShareCfg
      set objShareCfg = objShare.INetSharingConfigurationForINetConnection(objNetConn)
      if (IsObject(objShareCfg) = TRUE) then
        DIM objNCProps
        set objNCProps = objShare.NetConnectionProps(objNetConn)
        if (IsObject(objNCProps) = TRUE) then
          DIM str
          str = "Name: "   & objNCProps.Name & chr(13) & _
          "Guid: "       & objNCProps.Guid & chr(13) & _
          "DeviceName: " & objNCProps.DeviceName & chr(13) & _
          "Status: "     & objNCProps.Status & chr(13) & _
          "MediaType: "  & objNCProps.MediaType
            
          WScript.Echo( objNCProps.Name )
	  	    
	  	  

          'Add code here.
        end if
        
      end if
    next
    end if
    objFile.Close
end function