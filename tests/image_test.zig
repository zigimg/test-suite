const assert = std.debug.assert;
const std = @import("std");
const testing = std.testing;
const zigimg = @import("zigimg");
const image = zigimg.image;
const Image = image.Image;
const color = zigimg.color;
const PixelFormat = zigimg.PixelFormat;
usingnamespace @import("helpers.zig");

test "Create Image Bpp1" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bpp1, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bpp1);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bpp1);
        try testing.expect(pixels.Bpp1.palette.len == 2);
        try testing.expect(pixels.Bpp1.indices.len == 24 * 32);
    }
}

test "Create Image Bpp2" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bpp2, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bpp2);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bpp2);
        try testing.expect(pixels.Bpp2.palette.len == 4);
        try testing.expect(pixels.Bpp2.indices.len == 24 * 32);
    }
}

test "Create Image Bpp4" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bpp4, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bpp4);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bpp4);
        try testing.expect(pixels.Bpp4.palette.len == 16);
        try testing.expect(pixels.Bpp4.indices.len == 24 * 32);
    }
}

test "Create Image Bpp8" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bpp8, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bpp8);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bpp8);
        try testing.expect(pixels.Bpp8.palette.len == 256);
        try testing.expect(pixels.Bpp8.indices.len == 24 * 32);
    }
}

test "Create Image Bpp16" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bpp16, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bpp16);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bpp16);
        try testing.expect(pixels.Bpp16.palette.len == 65536);
        try testing.expect(pixels.Bpp16.indices.len == 24 * 32);
    }
}

test "Create Image Rgb24" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Rgb24, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Rgb24);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Rgb24);
        try testing.expect(pixels.Rgb24.len == 24 * 32);
    }
}

test "Create Image Rgba32" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Rgba32, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Rgba32);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Rgba32);
        try testing.expect(pixels.Rgba32.len == 24 * 32);
    }
}

test "Create Image Rgb565" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Rgb565, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Rgb565);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Rgb565);
        try testing.expect(pixels.Rgb565.len == 24 * 32);
    }
}

test "Create Image Rgb555" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Rgb555, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Rgb555);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Rgb555);
        try testing.expect(pixels.Rgb555.len == 24 * 32);
    }
}

test "Create Image Bgra32" {
    const test_image = try Image.create(zigimg_test_allocator, 24, 32, PixelFormat.Bgra32, .Raw);
    defer test_image.deinit();

    try expectEq(test_image.width, 24);
    try expectEq(test_image.height, 32);
    try expectEq(test_image.pixel_format, PixelFormat.Bgra32);
    try testing.expect(test_image.pixels != null);

    if (test_image.pixels) |pixels| {
        try testing.expect(pixels == .Bgra32);
        try testing.expect(pixels.Bgra32.len == 24 * 32);
    }
}

const MemoryRGBABitmap = @embedFile("fixtures/bmp/windows_rgba_v5.bmp");

test "Should detect BMP properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/bmp/simple_v4.bmp",
        "tests/fixtures/bmp/windows_rgba_v5.bmp",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Bmp);
    }
}

test "Should detect PCX properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/pcx/test-bpp1.pcx",
        "tests/fixtures/pcx/test-bpp4.pcx",
        "tests/fixtures/pcx/test-bpp8.pcx",
        "tests/fixtures/pcx/test-bpp24.pcx",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Pcx);
    }
}

test "Should detect PBM properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/netpbm/pbm_ascii.pbm",
        "tests/fixtures/netpbm/pbm_binary.pbm",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Pbm);
    }
}

test "Should detect PGM properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/netpbm/pgm_ascii_grayscale8.pgm",
        "tests/fixtures/netpbm/pgm_binary_grayscale8.pgm",
        "tests/fixtures/netpbm/pgm_ascii_grayscale16.pgm",
        "tests/fixtures/netpbm/pgm_binary_grayscale16.pgm",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Pgm);
    }
}

test "Should detect PPM properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/netpbm/ppm_ascii_rgb24.ppm",
        "tests/fixtures/netpbm/ppm_binary_rgb24.ppm",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Ppm);
    }
}

test "Should detect PNG properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/png/basn0g01.png",
        "tests/fixtures/png/basi0g01.png",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Png);
    }
}

test "Should detect TGA properly" {
    const imageTests = &[_][]const u8{
        "tests/fixtures/tga/cbw8.tga",
        "tests/fixtures/tga/ccm8.tga",
        "tests/fixtures/tga/ctc24.tga",
        "tests/fixtures/tga/ubw8.tga",
        "tests/fixtures/tga/ucm8.tga",
        "tests/fixtures/tga/utc16.tga",
        "tests/fixtures/tga/utc24.tga",
        "tests/fixtures/tga/utc32.tga",
    };

    for (imageTests) |image_path| {
        const test_image = try Image.fromFilePath(zigimg_test_allocator, image_path);
        defer test_image.deinit();
        try testing.expect(test_image.image_format == .Tga);
    }
}

test "Should error on invalid path" {
    var invalidPath = Image.fromFilePath(zigimg_test_allocator, "notapathdummy");
    try expectError(invalidPath, error.FileNotFound);
}

test "Should error on invalid file" {
    var invalidFile = Image.fromFilePath(zigimg_test_allocator, "tests/helpers.zig");
    try expectError(invalidFile, error.ImageFormatInvalid);
}

test "Should read a 24-bit bitmap" {
    var test_image = try Image.fromFilePath(zigimg_test_allocator, "tests/fixtures/bmp/simple_v4.bmp");
    defer test_image.deinit();

    try expectEq(test_image.width, 8);
    try expectEq(test_image.height, 1);

    if (test_image.pixels) |pixels| {
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

test "Test Color iterator" {
    var test_image = try Image.fromFilePath(zigimg_test_allocator, "tests/fixtures/bmp/simple_v4.bmp");
    defer test_image.deinit();

    const expectedColors = [_]color.Color{
        color.Color.initRGB(1.0, 0.0, 0.0),
        color.Color.initRGB(0.0, 1.0, 0.0),
        color.Color.initRGB(0.0, 0.0, 1.0),
        color.Color.initRGB(0.0, 1.0, 1.0),
        color.Color.initRGB(1.0, 0.0, 1.0),
        color.Color.initRGB(1.0, 1.0, 0.0),
        color.Color.initRGB(0.0, 0.0, 0.0),
        color.Color.initRGB(1.0, 1.0, 1.0),
    };

    try expectEq(test_image.width, 8);
    try expectEq(test_image.height, 1);

    var it = test_image.iterator();
    var i: usize = 0;
    while (it.next()) |actual| {
        const expected = expectedColors[i];
        try expectEq(actual.R, expected.R);
        try expectEq(actual.G, expected.G);
        try expectEq(actual.B, expected.B);
        i += 1;
    }
}
