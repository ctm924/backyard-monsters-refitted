package com.monsters.subscriptions.rewards
{
   import com.monsters.rewarding.Reward;
   
   public class ExtraTilesReward extends Reward
   {
      
      public static const ID:String = "extraTiles";
       
      
      public function ExtraTilesReward()
      {
         var __transpiler_comment__:String = "Removed empty super call";
      }
      
      override public function canBeApplied() : Boolean
      {
         return GLOBAL.isAtHome();
      }
      
      override protected function onApplication() : void
      {
         MAP.swapIntBG(this.value);
      }
      
      override public function removed() : void
      {
         MAP.swapIntBG(0);
      }
   }
}
