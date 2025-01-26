import { Save } from "../../../models/save.model";
import { ORMContext } from "../../../server";
<<<<<<< HEAD
import Savefiles, { getWMDefaultBase, getIWMDescentBase } from "../../../data/savefiles";
import { getXPosition, getYPosition } from "./world";
import { logging } from "../../../utils/logger";

const iwm_descent = [201,202,203,204,205,206,207,208,209,210,211,212,213];

export const getWildMonsterSave = (baseid: number, level: number = 10): Save => {
    const fork = ORMContext.em.fork();
    if (iwm_descent.includes(baseid)){
        //logging(baseid.toString());
        const defaultSave = getIWMDescentBase(baseid);
        const save = fork.create(Save, {
            ...defaultSave,
            basename: "",
            baseid: baseid.toString(),
            basesaveid: baseid,
        });
        save.type = "iwm";
        save.baseid = baseid.toString();
        save.basesaveid = baseid;
        save.level = iwm_descent.indexOf(baseid) + 1;
        //logging(JSON.stringify(save));
        return save;
    }
    const x = getXPosition(baseid);
    const y = getYPosition(baseid);
    const tribe = (x + y) % 4;
    const world_level = 10;
    const wmid = (tribe * 10) + 1
=======
import { Tribes } from "../../../enums/Tribes";
import { legionnaire } from "../../../data/tribes/legionnaire";
import { abunaki } from "../../../data/tribes/abunaki";
import { dreadnaught } from "../../../data/tribes/dreadnaught";
import { kozu } from "../../../data/tribes/kozu";

/**
 * Generates a save for a wild monster based on the given base ID.
 *
 * The base ID is used to calculate the cell coordinates (`cellX`, `cellY`)
 * and derive a tribe index from the combined coordinates. Based on the tribe index,
 * it fetches tribe-specific save data and generates a `Save` object for a wild monster.
 *
 * @param {string} baseid - The base ID as a string, which will be converted to an integer.
 * @returns {Save} - A new `Save` object for the wild monster, with tribe-specific data.
 */
export const wildMonsterSave = (baseid: string) => {
  const baseId = parseInt(baseid);
>>>>>>> 8c57251b3303dd077169e2a62ca8f9efd2d76698

  const cellX = Math.floor(baseId / 1000) % 1000;
  const cellY = baseId % 1000;

  const tribeIndex = (cellX + cellY) % Tribes.length;
  const wmid = tribeIndex * 10 + 1;

  const { tribeSave } = fetchTribeData(tribeIndex);

  // Return a new save for the wild monster.
  return ORMContext.em.create(Save, {
    ...tribeSave,
    baseid,
    wmid,
    homebase: [cellX.toString(), cellY.toString()],
  });
};

/**
 * Fetches the tribe data based on the given tribe index.
 *
 * @param {number} tribeIndex - The tribe index.
 * @returns {object} - An object containing the tribe save data.
 */
const fetchTribeData = (tribeIndex: number) => {
  const tribes = [legionnaire, kozu, abunaki, dreadnaught];
  const selectedTribe = tribes[tribeIndex];

  // Get all keys from the selected tribe
  const keys = Object.keys(selectedTribe);

  // TODO: Should be based off levels not random
  // Select a random key
  const randomKey = keys[Math.floor(Math.random() * keys.length)];
  const tribeSave = selectedTribe[randomKey];

  return { tribeSave };
};
