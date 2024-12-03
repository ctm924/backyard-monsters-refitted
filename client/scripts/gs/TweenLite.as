package gs
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import gs.plugins.*;
   import gs.utils.tween.*;
   
   public class TweenLite
   {
      public static const version:Number = 10.092;
      
      public static var plugins:Object = {};
      public static var killDelayedCallsTo:Function = TweenLite.killTweensOf;
      public static var defaultEase:Function = TweenLite.easeOut;
      public static var overwriteManager:Object;
      public static var currentTime:uint;
      public static var masterList:Dictionary = new Dictionary(false);
      public static var timingSprite:Sprite = new Sprite();
      private static var _tlInitted:Boolean;
      private static var _timer:Timer = new Timer(2000);
      protected static var _reservedProps:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "roundProps":1,
         "onStart":1,
         "onStartParams":1,
         "persist":1,
         "renderOnStart":1,
         "proxiedEase":1,
         "easeParams":1,
         "yoyo":1,
         "loop":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "orientToBezier":1,
         "timeScale":1
      };
      
      public var duration:Number;
      public var vars:Object;
      public var delay:Number;
      public var startTime:Number;
      public var initTime:Number;
      public var tweens:Array;
      public var target:Object;
      public var active:Boolean;
      public var ease:Function;
      public var initted:Boolean;
      public var combinedTimeScale:Number;
      public var gc:Boolean;
      public var started:Boolean;
      public var exposedVars:Object;
      protected var _hasPlugins:Boolean;
      protected var _hasUpdate:Boolean;
      
      public function TweenLite(param1:Object, param2:Number, param3:Object)
      {
         throw new Error("Missing implementation after conversion to Haxe");
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         throw new Error("Missing implementation after conversion to Haxe");
         return null; // Dummy return value
      }

      public static function delayedCall(param1:Number, param2:Function, param3:Array = null) : TweenLite
      {
         throw new Error("Missing implementation after conversion to Haxe");
         return null; // Dummy return value
      }
      
      public static function killTweensOf(param1:Object = null, param2:Boolean = false) : void
      {
         throw new Error("Missing implementation after conversion to Haxe");
      }
      
      protected static function killGarbage(param1:TimerEvent) : void
      {
         throw new Error("Missing implementation after conversion to Haxe");
      }
      

      
      public function initTweenVals() : void
      {
         throw new Error("Missing implementation after conversion to Haxe");
      }
     
   }
}