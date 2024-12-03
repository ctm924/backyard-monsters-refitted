package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="icon_invite")]
   public dynamic class icon_invite extends MovieClip
   {
       
      
      public var mcHit:MovieClip;
      
      public var mcSpinner:MovieClip;
      
      public function icon_invite()
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
