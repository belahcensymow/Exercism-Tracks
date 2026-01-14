const std = @import("std");

pub fn modifier(score: i8) i8 {
    const n: i8 = @divFloor((score - 10), 2);
    return n;
}

pub fn ability() i8 {
    const rand = std.crypto.random;
    var value: i8 = 0;
    var min: i8 = rand.intRangeAtMost(i8, 1, 6);
    for (0..3) |_| {
        const j: i8 = rand.intRangeAtMost(i8, 1, 6);
        if (j > min) value += j else {
            value += min;
            min = j;
        }
    }
    return value;
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const constitution = ability();
        return .{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = constitution,
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 10 + modifier(constitution),
        };
    }
};
