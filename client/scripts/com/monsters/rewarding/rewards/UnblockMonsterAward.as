package com.monsters.rewarding.rewards
{
   import com.monsters.rewarding.Reward;
   
   public class UnblockMonsterAward extends Reward
   {
       
      
      protected var _monsterID:String;
      
      public function UnblockMonsterAward(param1:String)
      {
         var __transpiler_comment__:String = "Removed empty super call";
         this._monsterID = param1;
      }
      
      override public function canBeApplied() : Boolean
      {
         return GLOBAL.mode == GLOBAL.e_BASE_MODE.BUILD && !BASE.isInfernoMainYardOrOutpost;
      }
      
      override protected function onApplication() : void
      {
         CREATURELOCKER._creatures[this._monsterID].blocked = false;
      }
      
      override public function reset() : void
      {
         CREATURELOCKER._creatures[this._monsterID].blocked = true;
      }
   }
}
