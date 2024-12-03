package
{
   import flash.events.MouseEvent;
   
   public class STOREPOPUP extends STOREPOPUP_CLIP
   {
       
      
      public function STOREPOPUP()
      {
         var __transpiler_comment__:String = "Removed empty super call";
      }
      
      public function Hide(param1:MouseEvent = null) : void
      {
         STORE.Hide();
      }
      
      public function Center() : void
      {
         POPUPSETTINGS.AlignToCenter(this);
      }
      
      public function ScaleUp() : void
      {
         POPUPSETTINGS.ScaleUp(this);
      }
   }
}
