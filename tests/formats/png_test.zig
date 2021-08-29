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

test "Should error on non PNG images" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/bmp/simple_v4.bmp");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pngFile = png.PNG.init(zigimg_test_allocator);
    defer pngFile.deinit();

    var pixelsOpt: ?color.ColorStorage = null;
    const invalidFile = pngFile.read(stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);
    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectError(invalidFile, errors.ImageError.InvalidMagicHeader);
}

test "Read PNG header properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/basn0g01.png");
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

    try expectEq(pngFile.header.width, 32);
    try expectEq(pngFile.header.height, 32);
    try expectEq(pngFile.header.bit_depth, 1);
    try testing.expect(pngFile.header.color_type == .Grayscale);
    try expectEq(pngFile.header.compression_method, 0);
    try expectEq(pngFile.header.filter_method, 0);
    try testing.expect(pngFile.header.interlace_method == .Standard);

    try testing.expect(pngFile.pixel_format == .Grayscale1);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Grayscale1);
    }
}

test "Read gAMA chunk properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/basn0g01.png");
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

    const gammaChunkOpt = pngFile.findFirstChunk("gAMA");

    try testing.expect(gammaChunkOpt != null);

    if (gammaChunkOpt) |gammaChunk| {
        try expectEq(gammaChunk.gAMA.toGammaExponent(), 1.0);
    }
}

test "Png Suite" {
    _ = @import("png_basn_test.zig");
    _ = @import("png_basi_test.zig");
    _ = @import("png_odd_sizes_test.zig");
    _ = @import("png_bkgd_test.zig");
}

test "Misc tests" {
    _ = @import("png_misc_test.zig");
}
