const ImageReader = zigimg.ImageReader;
const ImageSeekStream = zigimg.ImageSeekStream;
const PixelFormat = zigimg.PixelFormat;
const assert = std.debug.assert;
const color = zigimg.color;
const errors = zigimg.errors;
const png = zigimg.png;
const std = @import("std");
const testing = std.testing;
const zigimg = @import("zigimg");
usingnamespace @import("../helpers.zig");

test "Read bgai4a08 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgai4a08.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() == null);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Grayscale8Alpha);

        try expectEq(pixels.Grayscale8Alpha[0].value, 255);
        try expectEq(pixels.Grayscale8Alpha[0].alpha, 0);

        try expectEq(pixels.Grayscale8Alpha[31].value, 255);
        try expectEq(pixels.Grayscale8Alpha[31].alpha, 255);

        try expectEq(pixels.Grayscale8Alpha[15 * 32 + 15].value, 131);
        try expectEq(pixels.Grayscale8Alpha[15 * 32 + 15].alpha, 123);

        try expectEq(pixels.Grayscale8Alpha[31 * 32 + 31].value, 0);
        try expectEq(pixels.Grayscale8Alpha[31 * 32 + 31].alpha, 255);
    }
}

test "Read bgbn4a08 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgbn4a08.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() != null);

    if (pngFile.getBackgroundColorChunk()) |bkgd_chunk| {
        try testing.expect(bkgd_chunk.color == .Grayscale);

        try expectEq(bkgd_chunk.grayscale, 0);
    }

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Grayscale8Alpha);

        try expectEq(pixels.Grayscale8Alpha[0].value, 255);
        try expectEq(pixels.Grayscale8Alpha[0].alpha, 0);

        try expectEq(pixels.Grayscale8Alpha[31].value, 255);
        try expectEq(pixels.Grayscale8Alpha[31].alpha, 255);

        try expectEq(pixels.Grayscale8Alpha[15 * 32 + 15].value, 131);
        try expectEq(pixels.Grayscale8Alpha[15 * 32 + 15].alpha, 123);

        try expectEq(pixels.Grayscale8Alpha[31 * 32 + 31].value, 0);
        try expectEq(pixels.Grayscale8Alpha[31 * 32 + 31].alpha, 255);
    }
}

test "Read bgai4a16 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgai4a16.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() == null);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Grayscale16Alpha);

        try expectEq(pixels.Grayscale16Alpha[0].value, 0);
        try expectEq(pixels.Grayscale16Alpha[0].alpha, 0);

        try expectEq(pixels.Grayscale16Alpha[31].value, 0);
        try expectEq(pixels.Grayscale16Alpha[31].alpha, 0);

        try expectEq(pixels.Grayscale16Alpha[15 * 32 + 15].value, 0);
        try expectEq(pixels.Grayscale16Alpha[15 * 32 + 15].alpha, 63421);

        try expectEq(pixels.Grayscale16Alpha[31 * 32 + 31].value, 0);
        try expectEq(pixels.Grayscale16Alpha[31 * 32 + 31].alpha, 0);
    }
}

test "Read bggn4a16 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bggn4a16.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() != null);

    if (pngFile.getBackgroundColorChunk()) |bkgd_chunk| {
        try testing.expect(bkgd_chunk.color == .Grayscale);

        try expectEq(bkgd_chunk.grayscale, 43908);
    }

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Grayscale16Alpha);

        try expectEq(pixels.Grayscale16Alpha[0].value, 0);
        try expectEq(pixels.Grayscale16Alpha[0].alpha, 0);

        try expectEq(pixels.Grayscale16Alpha[31].value, 0);
        try expectEq(pixels.Grayscale16Alpha[31].alpha, 0);

        try expectEq(pixels.Grayscale16Alpha[15 * 32 + 15].value, 0);
        try expectEq(pixels.Grayscale16Alpha[15 * 32 + 15].alpha, 63421);

        try expectEq(pixels.Grayscale16Alpha[31 * 32 + 31].value, 0);
        try expectEq(pixels.Grayscale16Alpha[31 * 32 + 31].alpha, 0);
    }
}

test "Read bgan6a08 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgan6a08.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() == null);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Rgba32);

        try expectEq(pixels.Rgba32[0].R, 255);
        try expectEq(pixels.Rgba32[0].G, 0);
        try expectEq(pixels.Rgba32[0].B, 8);
        try expectEq(pixels.Rgba32[0].A, 0);

        try expectEq(pixels.Rgba32[31].R, 255);
        try expectEq(pixels.Rgba32[31].G, 0);
        try expectEq(pixels.Rgba32[31].B, 8);
        try expectEq(pixels.Rgba32[31].A, 255);

        try expectEq(pixels.Rgba32[15 * 32 + 15].R, 32);
        try expectEq(pixels.Rgba32[15 * 32 + 15].G, 255);
        try expectEq(pixels.Rgba32[15 * 32 + 15].B, 4);
        try expectEq(pixels.Rgba32[15 * 32 + 15].A, 123);

        try expectEq(pixels.Rgba32[31 * 32 + 31].R, 0);
        try expectEq(pixels.Rgba32[31 * 32 + 31].G, 32);
        try expectEq(pixels.Rgba32[31 * 32 + 31].B, 255);
        try expectEq(pixels.Rgba32[31 * 32 + 31].A, 255);
    }
}

test "Read bgwn6a08 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgwn6a08.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() != null);

    if (pngFile.getBackgroundColorChunk()) |bkgd_chunk| {
        try testing.expect(bkgd_chunk.color == .TrueColor);

        try expectEq(bkgd_chunk.red, 255);
        try expectEq(bkgd_chunk.green, 255);
        try expectEq(bkgd_chunk.blue, 255);
    }

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Rgba32);

        try expectEq(pixels.Rgba32[0].R, 255);
        try expectEq(pixels.Rgba32[0].G, 0);
        try expectEq(pixels.Rgba32[0].B, 8);
        try expectEq(pixels.Rgba32[0].A, 0);

        try expectEq(pixels.Rgba32[31].R, 255);
        try expectEq(pixels.Rgba32[31].G, 0);
        try expectEq(pixels.Rgba32[31].B, 8);
        try expectEq(pixels.Rgba32[31].A, 255);

        try expectEq(pixels.Rgba32[15 * 32 + 15].R, 32);
        try expectEq(pixels.Rgba32[15 * 32 + 15].G, 255);
        try expectEq(pixels.Rgba32[15 * 32 + 15].B, 4);
        try expectEq(pixels.Rgba32[15 * 32 + 15].A, 123);

        try expectEq(pixels.Rgba32[31 * 32 + 31].R, 0);
        try expectEq(pixels.Rgba32[31 * 32 + 31].G, 32);
        try expectEq(pixels.Rgba32[31 * 32 + 31].B, 255);
        try expectEq(pixels.Rgba32[31 * 32 + 31].A, 255);
    }
}

test "Read bgan6a16 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgan6a16.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() == null);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Rgba64);

        try expectEq(pixels.Rgba64[0].R, 65535);
        try expectEq(pixels.Rgba64[0].G, 65535);
        try expectEq(pixels.Rgba64[0].B, 0);
        try expectEq(pixels.Rgba64[0].A, 0);

        try expectEq(pixels.Rgba64[31].R, 0);
        try expectEq(pixels.Rgba64[31].G, 65535);
        try expectEq(pixels.Rgba64[31].B, 0);
        try expectEq(pixels.Rgba64[31].A, 0);

        try expectEq(pixels.Rgba64[15 * 32 + 15].R, 65535);
        try expectEq(pixels.Rgba64[15 * 32 + 15].G, 65535);
        try expectEq(pixels.Rgba64[15 * 32 + 15].B, 0);
        try expectEq(pixels.Rgba64[15 * 32 + 15].A, 63421);

        try expectEq(pixels.Rgba64[31 * 32 + 31].R, 0);
        try expectEq(pixels.Rgba64[31 * 32 + 31].G, 0);
        try expectEq(pixels.Rgba64[31 * 32 + 31].B, 65535);
        try expectEq(pixels.Rgba64[31 * 32 + 31].A, 0);
    }
}

test "Read bgyn6a16 properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/bgyn6a16.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    try pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try testing.expect(pngFile.getBackgroundColorChunk() != null);

    if (pngFile.getBackgroundColorChunk()) |bkgd_chunk| {
        try testing.expect(bkgd_chunk.color == .TrueColor);

        try expectEq(bkgd_chunk.red, 65535);
        try expectEq(bkgd_chunk.green, 65535);
        try expectEq(bkgd_chunk.blue, 0);
    }

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Rgba64);

        try expectEq(pixels.Rgba64[0].R, 65535);
        try expectEq(pixels.Rgba64[0].G, 65535);
        try expectEq(pixels.Rgba64[0].B, 0);
        try expectEq(pixels.Rgba64[0].A, 0);

        try expectEq(pixels.Rgba64[31].R, 0);
        try expectEq(pixels.Rgba64[31].G, 65535);
        try expectEq(pixels.Rgba64[31].B, 0);
        try expectEq(pixels.Rgba64[31].A, 0);

        try expectEq(pixels.Rgba64[15 * 32 + 15].R, 65535);
        try expectEq(pixels.Rgba64[15 * 32 + 15].G, 65535);
        try expectEq(pixels.Rgba64[15 * 32 + 15].B, 0);
        try expectEq(pixels.Rgba64[15 * 32 + 15].A, 63421);

        try expectEq(pixels.Rgba64[31 * 32 + 31].R, 0);
        try expectEq(pixels.Rgba64[31 * 32 + 31].G, 0);
        try expectEq(pixels.Rgba64[31 * 32 + 31].B, 65535);
        try expectEq(pixels.Rgba64[31 * 32 + 31].A, 0);
    }
}
