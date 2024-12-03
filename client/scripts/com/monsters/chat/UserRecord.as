package com.monsters.chat
{
   public class UserRecord
   {
       
      
      private var name:String;
      
      private var id:String;
      
      public function UserRecord(param1:String, param2:String = null)
      {
         var __transpiler_comment__:String = "Removed empty super call";
         this.name = param2;
         this.id = param1;
      }
      
      public function get Name() : String
      {
         return this.name;
      }
      
      public function get Id() : String
      {
         return this.id;
      }
   }
}
