package com.monsters.creep_types
{
   import utils.exposed.ExposedStructure;
   
   public class CreepUpgrade
   {
       
      
      private var m_UpgradePuttyCost:uint;
      
      private var m_UpgradeTime:uint;
      
      private var m_UpgradeProps:CreepProps;
      
      public function CreepUpgrade()
      {
         this.m_UpgradeProps = new CreepProps();
         var __transpiler_comment__:String = "Removed empty super call";
      }
      
      public function get upgradePuttyCost() : uint
      {
         return this.m_UpgradePuttyCost;
      }
      
      public function set upgradePuttyCost(param1:uint) : void
      {
         this.m_UpgradePuttyCost = param1;
      }
      
      public function get upgradeTime() : uint
      {
         return this.m_UpgradeTime;
      }
      
      public function set upgradeTime(param1:uint) : void
      {
         this.m_UpgradeTime = param1;
      }
      
      public function get upgradeProps() : CreepProps
      {
         return this.m_UpgradeProps;
      }
      
      public function set upgradeProps(param1:CreepProps) : void
      {
         this.m_UpgradeProps = param1;
      }
   }
}
