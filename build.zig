const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.option(std.builtin.Mode, "mode", "") orelse .Debug;
    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/all_test.zig" },
        .optimize = mode,
    });

    const test_step = b.step("test", "Run library tests");
    const test_run = b.addRunArtifact(main_tests);
    test_step.dependOn(&test_run.step);
}
