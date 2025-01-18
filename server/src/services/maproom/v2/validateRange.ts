import { Save } from "../../../models/save.model";
import { User } from "../../../models/user.model";
import { WorldMapCell } from "../../../models/worldmapcell.model";
import { ORMContext } from "../../../server";

interface OwnedOutpost {
  x: number;
  y: number;
  baseid: string;
}

/**
 * Validates if the target cell is within the attack range of the user's main base or any of their outposts.
 *
 * Invalidates an attack if:
 * 1. The attack cell is not found.
 * 2. No outposts are owned and the main base is out of range.
 * 3. The closest outpost is not found.
 * 4. The target is out of attack range.
 *
 * @param {User} user - The user object containing the save data.
 * @param {string} baseid - The ID of the base under attack.
 * @throws {Error} - attack invalidation error.
 */
export const validateRange = async (user: User, baseid: string) => {
  const { homebase, outposts, flinger } = user.save;

  // Retrieve the cell under attack
  const attackCell = await ORMContext.em.findOne(WorldMapCell, {
    base_id: BigInt(baseid),
  });

  if (!attackCell) throw new Error("Attack cell not found.");

  const [cellX, cellY] = [attackCell.x, attackCell.y];
  const [homeX, homeY] = homebase.map(Number);

  // First, we determine if the main yard is within range
  const mainYardRange = getMainYardRange(flinger);
  const distanceFromMain = calculateDistance(cellX, cellY, homeX, homeY);

  if (distanceFromMain <= mainYardRange) return;

  // Otherwise, we determine the closest outpost to the target cell
  if (outposts.length > 0) {
    let nearestOutpost: OwnedOutpost | null = null;
    let nearestDistance = Infinity;

    for (const outpost of outposts) {
      const [outpostX, outpostY, baseid] = outpost;
      const distance = calculateDistance(cellX, cellY, outpostX, outpostY);

      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestOutpost = { x: outpostX, y: outpostY, baseid };
      }
    }

    if (!nearestOutpost) throw new Error("Could not find the closest outpost.");

    // Retrieve the closest outpost and validate it's range
    const outpostSave = await ORMContext.em.findOne(Save, {
      baseid: BigInt(nearestOutpost.baseid),
    });

    if (!outpostSave) throw new Error("Outpost save not found.");

    const outpostRange = getOutpostRange(outpostSave.flinger);

    if (nearestDistance > outpostRange)
      throw new Error("Target is out of attack range.");
  } else {
    throw new Error("No outposts owned, and main base is out of range.");
  }
};

const calculateDistance = (
  cellX: number,
  cellY: number,
  baseX: number,
  baseY: number
) =>
  Math.round(
    Math.sqrt(Math.pow(baseX - cellX, 2) + Math.pow(baseY - cellY, 2))
  );

const getMainYardRange = (flinger: number) => {
  switch (flinger) {
    case 0:
      return 0;
    case 1:
      return 4;
    case 2:
      return 6;
    case 3:
      return 8;
    case 4:
      return 10;
    default:
      return 10;
  }
};

const getOutpostRange = (flinger: number) => {
  switch (flinger) {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    default:
      return 4;
  }
};
