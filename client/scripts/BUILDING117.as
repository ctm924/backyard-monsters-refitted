package
{
   import flash.geom.Rectangle;
   
   public class BUILDING117 extends BHEAVYTRAP
   {
       
      
      public function BUILDING117()
      {
         var __transpiler_comment__:String = "Removed empty super call";
         _type = 117;
         _footprint = [new Rectangle(0,0,20,20)];
         SetProps();
      }
      
      override public function Constructed() : void
      {
         ++ACHIEVEMENTS._stats["heavytraps"];
         ACHIEVEMENTS.Check();
         super.Constructed();
      }
   }
}
