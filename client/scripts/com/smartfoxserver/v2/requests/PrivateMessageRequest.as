package com.smartfoxserver.v2.requests
{
   import com.smartfoxserver.v2.entities.data.ISFSObject;
   
   public class PrivateMessageRequest extends GenericMessageRequest
   {
       
      
      public function PrivateMessageRequest(param1:String, param2:int, param3:ISFSObject = null)
      {
         var __transpiler_comment__:String = "Removed empty super call";
         _type = GenericMessageType.PRIVATE_MSG;
         _message = param1;
         _recipient = param2;
         _params = param3;
      }
   }
}
