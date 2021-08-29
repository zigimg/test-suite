const ImageReader = zigimg.ImageReader;
const ImageSeekStream = zigimg.ImageSeekStream;
const PixelFormat = zigimg.PixelFormat;
const assert = std.debug.assert;
const bmp = zigimg.bmp;
const color = zigimg.color;
const errors = zigimg.errors;
const std = @import("std");
const testing = std.testing;
const zigimg = @import("zigimg");
usingnamespace @import("../helpers.zig");

const MemoryRGBABitmap = @embedFile("../fixtures/bmp/windows_rgba_v5.bmp");

fn verifyBitmapRGBAV5(theBitmap: bmp.Bitmap, pixelsOpt: ?color.ColorStorage) !void {
    try expectEq(theBitmap.fileHeader.size, 153738);
    try expectEq(theBitmap.fileHeader.reserved, 0);
    try expectEq(theBitmap.fileHeader.pixelOffset, 138);
    try expectEq(theBitmap.width(), 240);
    try expectEq(theBitmap.height(), 160);

    try expectEqSlice(u8, @tagName(theBitmap.infoHeader), "V5");

    _ = switch (theBitmap.infoHeader) {
        .V5 => |v5Header| {
            try expectEq(v5Header.headerSize, bmp.BitmapInfoHeaderV5.HeaderSize);
            try expectEq(v5Header.width, 240);
            try expectEq(v5Header.height, 160);
            try expectEq(v5Header.colorPlane, 1);
            try expectEq(v5Header.bitCount, 32);
            try expectEq(v5Header.compressionMethod, bmp.CompressionMethod.Bitfields);
            try expectEq(v5Header.imageRawSize, 240 * 160 * 4);
            try expectEq(v5Header.horizontalResolution, 2835);
            try expectEq(v5Header.verticalResolution, 2835);
            try expectEq(v5Header.paletteSize, 0);
            try expectEq(v5Header.importantColors, 0);
            try expectEq(v5Header.redMask, 0x00ff0000);
            try expectEq(v5Header.greenMask, 0x0000ff00);
            try expectEq(v5Header.blueMask, 0x000000ff);
            try expectEq(v5Header.alphaMask, 0xff000000);
            try expectEq(v5Header.colorSpace, bmp.BitmapColorSpace.sRgb);
            try expectEq(v5Header.cieEndPoints.red.x, 0);
            try expectEq(v5Header.cieEndPoints.red.y, 0);
            try expectEq(v5Header.cieEndPoints.red.z, 0);
            try expectEq(v5Header.cieEndPoints.green.x, 0);
            try expectEq(v5Header.cieEndPoints.green.y, 0);
            try expectEq(v5Header.cieEndPoints.green.z, 0);
            try expectEq(v5Header.cieEndPoints.blue.x, 0);
            try expectEq(v5Header.cieEndPoints.blue.y, 0);
            try expectEq(v5Header.cieEndPoints.blue.z, 0);
            try expectEq(v5Header.gammaRed, 0);
            try expectEq(v5Header.gammaGreen, 0);
            try expectEq(v5Header.gammaBlue, 0);
            try expectEq(v5Header.intent, bmp.BitmapIntent.Graphics);
            try expectEq(v5Header.profileData, 0);
            try expectEq(v5Header.profileSize, 0);
            try expectEq(v5Header.reserved, 0);
        },
        else => unreachable,
    };

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Bgra32);

        try expectEq(pixels.len(), 240 * 160);

        const firstPixel = pixels.Bgra32[0];
        try expectEq(firstPixel.R, 0xFF);
        try expectEq(firstPixel.G, 0xFF);
        try expectEq(firstPixel.B, 0xFF);
        try expectEq(firstPixel.A, 0xFF);

        const secondPixel = pixels.Bgra32[1];
        try expectEq(secondPixel.R, 0xFF);
        try expectEq(secondPixel.G, 0x00);
        try expectEq(secondPixel.B, 0x00);
        try expectEq(secondPixel.A, 0xFF);

        const thirdPixel = pixels.Bgra32[2];
        try expectEq(thirdPixel.R, 0x00);
        try expectEq(thirdPixel.G, 0xFF);
        try expectEq(thirdPixel.B, 0x00);
        try expectEq(thirdPixel.A, 0xFF);

        const fourthPixel = pixels.Bgra32[3];
        try expectEq(fourthPixel.R, 0x00);
        try expectEq(fourthPixel.G, 0x00);
        try expectEq(fourthPixel.B, 0xFF);
        try expectEq(fourthPixel.A, 0xFF);

        const coloredPixel = pixels.Bgra32[(22 * 240) + 16];
        try expectEq(coloredPixel.R, 195);
        try expectEq(coloredPixel.G, 195);
        try expectEq(coloredPixel.B, 255);
        try expectEq(coloredPixel.A, 255);
    }
}

test "Read simple version 4 24-bit RGB bitmap" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/bmp/simple_v4.bmp");
    defer file.close();

    var theBitmap = bmp.Bitmap{};

    var stream_source = std.io.StreamSource{ .file = file };

    var pixelsOpt: ?color.ColorStorage = null;
    try theBitmap.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try expectEq(theBitmap.width(), 8);
    try expectEq(theBitmap.height(), 1);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == .Bgr24);

        const red = pixels.Bgr24[0];
        try expectEq(red.R, 0xFF);
        try expectEq(red.G, 0x00);
        try expectEq(red.B, 0x00);

        const green = pixels.Bgr24[1];
        try expectEq(green.R, 0x00);
        try expectEq(green.G, 0xFF);
        try expectEq(green.B, 0x00);

        const blue = pixels.Bgr24[2];
        try expectEq(blue.R, 0x00);
        try expectEq(blue.G, 0x00);
        try expectEq(blue.B, 0xFF);

        const cyan = pixels.Bgr24[3];
        try expectEq(cyan.R, 0x00);
        try expectEq(cyan.G, 0xFF);
        try expectEq(cyan.B, 0xFF);

        const magenta = pixels.Bgr24[4];
        try expectEq(magenta.R, 0xFF);
        try expectEq(magenta.G, 0x00);
        try expectEq(magenta.B, 0xFF);

        const yellow = pixels.Bgr24[5];
        try expectEq(yellow.R, 0xFF);
        try expectEq(yellow.G, 0xFF);
        try expectEq(yellow.B, 0x00);

        const black = pixels.Bgr24[6];
        try expectEq(black.R, 0x00);
        try expectEq(black.G, 0x00);
        try expectEq(black.B, 0x00);

        const white = pixels.Bgr24[7];
        try expectEq(white.R, 0xFF);
        try expectEq(white.G, 0xFF);
        try expectEq(white.B, 0xFF);
    }
}

test "Read a valid version 5 RGBA bitmap from file" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/bmp/windows_rgba_v5.bmp");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var theBitmap = bmp.Bitmap{};

    var pixelsOpt: ?color.ColorStorage = null;
    try theBitmap.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try verifyBitmapRGBAV5(theBitmap, pixelsOpt);
}

test "Read a valid version 5 RGBA bitmap from memory" {
    var stream_source = std.io.StreamSource{ .const_buffer = std.io.fixedBufferStream(MemoryRGBABitmap) };

    var theBitmap = bmp.Bitmap{};

    var pixelsOpt: ?color.ColorStorage = null;
    try theBitmap.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixelsOpt);

    defer {
        if (pixelsOpt) |pixels| {
            pixels.deinit(zigimg_test_allocator);
        }
    }

    try verifyBitmapRGBAV5(theBitmap, pixelsOpt);
}

test "Should error when reading an invalid file" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/bmp/notbmp.png");
    defer file.close();

    var stream_source = std.io.StreamSource{ .file = file };

    var theBitmap = bmp.Bitmap{};

    var pixels: ?color.ColorStorage = null;
    const invalidFile = theBitmap.read(zigimg_test_allocator, stream_source.reader(), stream_source.seekableStream(), &pixels);
    try expectError(invalidFile, errors.ImageError.InvalidMagicHeader);
}
