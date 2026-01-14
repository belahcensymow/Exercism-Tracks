const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    return initAllergenSet(score).contains(allergen);
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var s = score;
    if (s > 255) s %= 256;
    var allergenList = EnumSet(Allergen).initEmpty();
    if (s >= 128) {
        allergenList.insert(.cats);
        s -= 128;
    }
    if (s >= 64) {
        allergenList.insert(.pollen);
        s -= 64;
    }
    if (s >= 32) {
        allergenList.insert(.chocolate);
        s -= 32;
    }
    if (s >= 16) {
        allergenList.insert(.tomatoes);
        s -= 16;
    }
    if (s >= 8) {
        allergenList.insert(.strawberries);
        s -= 8;
    }
    if (s >= 4) {
        allergenList.insert(.shellfish);
        s -= 4;
    }
    if (s >= 2) {
        allergenList.insert(.peanuts);
        s -= 2;
    }
    if (s >= 1) {
        allergenList.insert(.eggs);
        s -= 1;
    }
    return allergenList;
}
