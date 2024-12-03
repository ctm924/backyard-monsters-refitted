package com.monsters.projectiles.projectileComponents
{
   import com.monsters.interfaces.IAttackable;
   import com.monsters.interfaces.ITargetable;
   import com.monsters.monsters.components.Component;
   import com.monsters.monsters.components.IAttackingComponent;
   
   public class ProjectileComponent extends Component implements IAttackingComponent
   {
       
      
      public function ProjectileComponent()
      {
         var __transpiler_comment__:String = "Removed empty super call";
      }
      
      public function onAttack(param1:IAttackable, param2:Number, param3:ITargetable = null) : Number
      {
         return 0;
      }
   }
}
