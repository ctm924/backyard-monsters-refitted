package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="MapRoomPopup_InfernoDescent")]
   public dynamic class MapRoomPopup_InfernoDescent extends MovieClip
   {
       
      
      public var background_mc:frame_CLIP;
      
      public var bReturn:Button_CLIP;
      
      public var mcImage:MovieClip;
      
      public function MapRoomPopup_InfernoDescent()
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
