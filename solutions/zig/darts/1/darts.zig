const math = @import("std").math;
pub const Coordinate = struct {
    x: f32,
    y: f32,
    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const distance: f32 = math.sqrt((self.x * self.x) + (self.y * self.y));
        var Score: usize = 0;
        if (distance <= 1) {
            Score = 10;
        } else if (distance <= 5) {
            Score = 5;
        } else if (distance <= 10) {
            Score = 1;
        } else {
            Score = 0;
        }
        return Score;
    }
};
