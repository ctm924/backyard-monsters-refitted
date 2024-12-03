package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="buildingInfo")]
   public dynamic class buildingInfo extends MovieClip
   {
       
      
      public var tInfoRight:TextField;
      
      public var tName:TextField;
      
      public var mcBG:MovieClip;
      
      public var tInfoLeft:TextField;
      
      public function buildingInfo()
      {
         var __transpiler_comment__:String = "Removed empty super call";
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
