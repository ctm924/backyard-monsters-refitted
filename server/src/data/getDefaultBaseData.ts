import { devConfig } from "../config/DevSettings";
import { User } from "../models/user.model";
import { devSandbox } from "../dev/devSandbox";
import { getCurrentDateTime } from "../utils/getCurrentDateTime";
import { Reward } from "../enums/Rewards";

/**
 * Generates the default base data object for a new save.
 *
 * @param {User} [user] - The user for whom the base data is being generated.
 * @returns {object} - The default base data object.
 */
export const getDefaultBaseData = (user?: User) => {
  // These flags allow us to work with debug dev bases
  if (devConfig.devSandbox) return devSandbox;
  if (devConfig.debugSandbox) return debugSandbox;

  const baseid = generateID(9)

  return {
    saveuserid: user.userid,
    userid: user.userid,
    cellid: -1,
    name: user.username,
    credits: devConfig.shiny || 1000,
    createtime: getCurrentDateTime(),
    savetime: 0, // Updates each time a save is triggered
    fan: 0,
    emailshared: 1,
    unreadmessages: 0,
    giftsentcount: 0,
    id: 0, // Gets set as same value as savetime when save is triggered
    canattack: false,
    cellid: generateID(6),
    baseid_inferno: generateID(8),
    fbid: "100002268912813",
    fortifycellid: 0,
    name: user.username || "Anonymous",
    level: 1,
    catapult: 0,
    flinger: 0,
    destroyed: 0,
    damage: 0,
    locked: 0,
    points: 5,
    basevalue: 20,
    protected: 0,
    lastupdate: 0,
    usemap: 0,
    homebaseid: baseid,
    credits: process.env.SHINY ? parseInt(process.env.SHINY)  : 2500,
    champion: "null",
    empiredestroyed: 1,
    worldid: "",
    event_score: 0,
    chatenabled: 0,
    relationship: 0,
    error: 0,
    user,

    // Pre-populated Objects
    resources: {
      r1: 0,
      r2: 0,
      r3: 0,
      r4: 0,
      r1max: 10000,
      r2max: 10000,
      r3max: 10000,
      r4max: 10000,
    },
    inventory: {},
    monsters: {},
    player: {},
    krallen: {},
    siege: {},
    buildingresources: {},
    frontpage: {},
    events: {},
    rewards: devConfig.unlockAllEventRewards
      ? {
          // Unique event reward unlockables
          spurtzCannonReward2: { id: "spurtzCannonReward2" },
          spurtzCannonReward: { id: "spurtzCannonReward" },
          spurtzCannonReward3: { id: "spurtzCannonReward3" },
          unlockRezghul: { id: "unlockRezghul" },
          KorathReward: { id: "KorathReward" },
          unblockSlimeattikus: { id: "unblockSlimeattikus" },
          unblockVorg: { id: "unblockVorg" },
        }
      : {},
    takeover: {},
    iresources: {
      r1: 0,
      r2: 0,
      r3: 0,
      r4: 0,
      r1max: 10000,
      r2max: 10000,
      r3max: 10000,
      r4max: 10000,
    },
    krallen: {},
    rewards: devConfig.unlockAllEventRewards
      ? {
          // Unique event reward unlockables
          unlockRezghul: { id: Reward.REZGHUL },
          unblockSlimeattikus: { id: Reward.SLIMEATTIKUS },
          unblockVorg: { id: Reward.VORG },
        }
      : {},
  };
};
