package com.monsters.monsters.components.modifiers
{
   import com.monsters.interfaces.IPropertyModifier;
   
   public class AdditionPropertyModifier implements IPropertyModifier
   {
       
      
      public var value:Number;
      
      public function AdditionPropertyModifier(param1:Number = 0)
      {
         var __transpiler_comment__:String = "Removed empty super call";
         this.value = param1;
      }
      
      public function modify(param1:Number) : Number
      {
         return param1 + this.value;
      }
   }
}
