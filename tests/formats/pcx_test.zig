const ImageReader = zigimg.ImageReader;
const ImageSeekStream = zigimg.ImageSeekStream;
const PixelFormat = zigimg.PixelFormat;
const assert = std.debug.assert;
const color = zigimg.color;
const errors = zigimg.errors;
const pcx = zigimg.pcx;
const std = @import("std");
const testing = std.testing;
const zigimg = @import("zigimg");
usingnamespace @import("../helpers.zig");

test "PCX bpp1 (linear)" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/pcx/test-bpp1.pcx");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pcxFile = pcx.PCX{};

    var pixelsOpt: ?color.ColorStorage = null;
    try pcxFile.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectEq(pcxFile.width, 27);
    try expectEq(pcxFile.height, 27);
    try expectEq(pcxFile.pixel_format, PixelFormat.Bpp1);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Bpp1);

        try expectEq(pixels.Bpp1.indices[0], 0);
        try expectEq(pixels.Bpp1.indices[15], 1);
        try expectEq(pixels.Bpp1.indices[18], 1);
        try expectEq(pixels.Bpp1.indices[19], 1);
        try expectEq(pixels.Bpp1.indices[20], 1);
        try expectEq(pixels.Bpp1.indices[22 * 27 + 11], 1);

        const palette0 = pixels.Bpp1.palette[0].toIntegerColor8();

        try expectEq(palette0.R, 102);
        try expectEq(palette0.G, 90);
        try expectEq(palette0.B, 155);

        const palette1 = pixels.Bpp1.palette[1].toIntegerColor8();

        try expectEq(palette1.R, 115);
        try expectEq(palette1.G, 137);
        try expectEq(palette1.B, 106);
    }
}

test "PCX bpp4 (linear)" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/pcx/test-bpp4.pcx");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pcxFile = pcx.PCX{};

    var pixelsOpt: ?color.ColorStorage = null;
    try pcxFile.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectEq(pcxFile.width, 27);
    try expectEq(pcxFile.height, 27);
    try expectEq(pcxFile.pixel_format, PixelFormat.Bpp4);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Bpp4);

        try expectEq(pixels.Bpp4.indices[0], 1);
        try expectEq(pixels.Bpp4.indices[1], 9);
        try expectEq(pixels.Bpp4.indices[2], 0);
        try expectEq(pixels.Bpp4.indices[3], 0);
        try expectEq(pixels.Bpp4.indices[4], 4);
        try expectEq(pixels.Bpp4.indices[14 * 27 + 9], 6);
        try expectEq(pixels.Bpp4.indices[25 * 27 + 25], 7);

        const palette0 = pixels.Bpp4.palette[0].toIntegerColor8();

        try expectEq(palette0.R, 0x5e);
        try expectEq(palette0.G, 0x37);
        try expectEq(palette0.B, 0x97);

        const palette15 = pixels.Bpp4.palette[15].toIntegerColor8();

        try expectEq(palette15.R, 0x60);
        try expectEq(palette15.G, 0xb5);
        try expectEq(palette15.B, 0x68);
    }
}

test "PCX bpp8 (linear)" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/pcx/test-bpp8.pcx");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pcxFile = pcx.PCX{};

    var pixelsOpt: ?color.ColorStorage = null;
    try pcxFile.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectEq(pcxFile.width, 27);
    try expectEq(pcxFile.height, 27);
    try expectEq(pcxFile.pixel_format, PixelFormat.Bpp8);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Bpp8);

        try expectEq(pixels.Bpp8.indices[0], 37);
        try expectEq(pixels.Bpp8.indices[3 * 27 + 15], 60);
        try expectEq(pixels.Bpp8.indices[26 * 27 + 26], 254);

        const palette0 = pixels.Bpp8.palette[0].toIntegerColor8();

        try expectEq(palette0.R, 0x46);
        try expectEq(palette0.G, 0x1c);
        try expectEq(palette0.B, 0x71);

        const palette15 = pixels.Bpp8.palette[15].toIntegerColor8();

        try expectEq(palette15.R, 0x41);
        try expectEq(palette15.G, 0x49);
        try expectEq(palette15.B, 0x30);

        const palette219 = pixels.Bpp8.palette[219].toIntegerColor8();

        try expectEq(palette219.R, 0x61);
        try expectEq(palette219.G, 0x8e);
        try expectEq(palette219.B, 0xc3);
    }
}

test "PCX bpp24 (planar)" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/pcx/test-bpp24.pcx");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var pcxFile = pcx.PCX{};

    var pixelsOpt: ?color.ColorStorage = null;
    try pcxFile.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectEq(pcxFile.header.planes, 3);
    try expectEq(pcxFile.header.bpp, 8);

    try expectEq(pcxFile.width, 27);
    try expectEq(pcxFile.height, 27);
    try expectEq(pcxFile.pixel_format, PixelFormat.Rgb24);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Rgb24);

        try expectEq(pixels.Rgb24[0].R, 0x34);
        try expectEq(pixels.Rgb24[0].G, 0x53);
        try expectEq(pixels.Rgb24[0].B, 0x9f);

        try expectEq(pixels.Rgb24[1].R, 0x32);
        try expectEq(pixels.Rgb24[1].G, 0x5b);
        try expectEq(pixels.Rgb24[1].B, 0x96);

        try expectEq(pixels.Rgb24[26].R, 0xa8);
        try expectEq(pixels.Rgb24[26].G, 0x5a);
        try expectEq(pixels.Rgb24[26].B, 0x78);

        try expectEq(pixels.Rgb24[27].R, 0x2e);
        try expectEq(pixels.Rgb24[27].G, 0x54);
        try expectEq(pixels.Rgb24[27].B, 0x99);

        try expectEq(pixels.Rgb24[26 * 27 + 26].R, 0x88);
        try expectEq(pixels.Rgb24[26 * 27 + 26].G, 0xb7);
        try expectEq(pixels.Rgb24[26 * 27 + 26].B, 0x55);
    }
}
