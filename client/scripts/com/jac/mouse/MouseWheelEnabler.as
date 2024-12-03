package com.jac.mouse
{
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.utils.getTimer;
   
   public class MouseWheelEnabler
   {
      
      private static var initialised:Boolean = false;
      
      private static var currentItem:InteractiveObject;
      
      private static var browserMouseEvent:MouseEvent;
      
      private static var lastEventTime:uint = 0;
      
      public static var useRawValues:Boolean;
      
      public static var eventTimeout:Number = 50;
       
      
      public function MouseWheelEnabler()
      {
         var __transpiler_comment__:String = "Removed empty super call";
      }
      
      public static function init(param1:Stage, param2:Boolean = false) : void
      {
         if(!initialised)
         {
            initialised = true;
            print("init mousewheel");
            registerListenerForMouseMove(param1);
            registerJS();
         }
         useRawValues = param2;
      }
      
      private static function registerListenerForMouseMove(param1:Stage) : void
      {
         var stage:Stage = param1;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,function(param1:MouseEvent):void
         {
            currentItem = InteractiveObject(param1.target);
            browserMouseEvent = MouseEvent(param1);
         });
      }
      
      private static function registerJS() : void
      {
         var id:String = null;
         if(ExternalInterface.available)
         {
            id = "mws_" + Math.floor(Math.random() * 1000000);
            ExternalInterface.addCallback(id,function():void
            {
            });
            ExternalInterface.call(MouseWheelEnabler_JavaScript.CODE);
            ExternalInterface.call("mws.InitMouseWheelSupport",id);
            ExternalInterface.addCallback("externalMouseEvent",handleExternalMouseEvent);
         }
      }
      
      private static function handleExternalMouseEvent(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:uint;
         if((_loc4_ = uint(getTimer())) >= eventTimeout + lastEventTime)
         {
            if(useRawValues)
            {
               _loc3_ = param1;
            }
            else
            {
               _loc3_ = param2;
            }
            if(Boolean(currentItem) && Boolean(browserMouseEvent))
            {
               currentItem.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_WHEEL,true,false,browserMouseEvent.localX,browserMouseEvent.localY,browserMouseEvent.relatedObject,browserMouseEvent.ctrlKey,browserMouseEvent.altKey,browserMouseEvent.shiftKey,browserMouseEvent.buttonDown,int(_loc3_)));
            }
            lastEventTime = _loc4_;
         }
      }
      
      public static function getBrowserInfo() : BrowserInfo
      {
         var _loc1_:Object = null;
         var _loc2_:Object = null;
         var _loc3_:String = null;
         if(ExternalInterface.available)
         {
            _loc1_ = ExternalInterface.call("mws.getBrowserInfo");
            _loc2_ = ExternalInterface.call("mws.getPlatformInfo");
            _loc3_ = ExternalInterface.call("mws.getAgentInfo");
            return new BrowserInfo(_loc1_,_loc2_,_loc3_);
         }
         return null;
      }
   }
}

class MouseWheelEnabler_JavaScript
{
   
   public static const CODE:Object = null;
    
   
   public function MouseWheelEnabler_JavaScript()
   {
      var __transpiler_comment__:String = "Removed empty super call";
   }
}
