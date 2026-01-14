const std = @import("std");
pub const HighScores = struct {
    scores: []const i32,
    sorted_scores: []const i32,
    pub fn init(scores: []const i32) HighScores {
        const allocator = std.heap.page_allocator;
        const scores_copy = allocator.dupe(i32, scores) catch @constCast(&[_]i32{});
        std.mem.sort(i32, scores_copy, {}, std.sort.desc(i32));
        return HighScores{
            .scores = scores,
            .sorted_scores = scores_copy,
        };
    }

    pub fn latest(self: *const HighScores) ?i32 {
        if (self.scores.len == 0) return null;
        return self.scores[self.scores.len - 1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        var best: ?i32 = null;
        if (self.sorted_scores.len != 0) best = self.sorted_scores[0];
        return best;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        const length: usize = @min(self.scores.len, 3);
        return self.sorted_scores[0..length];
    }
};
