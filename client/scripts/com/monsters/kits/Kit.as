package com.monsters.kits
{
    public class Kit
    {
        public var build:Object;

        public var resourceWorth:Number;

        public var shinyWorth:uint;

        public function Kit(param1:Object)
        {
            var __transpiler_comment__:String = "Removed empty super call";
            this.build = param1;
            this.resourceWorth = popup_prefab.getResourceCostFromBuild(param1);
            this.shinyWorth = popup_prefab.getShinyWorthFromResources(this.resourceWorth);
        }
    }
}