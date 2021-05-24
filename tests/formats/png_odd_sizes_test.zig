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

test "Read s01i3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s01i3p01.png");
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

    try expectEq(pngFile.header.width, 1);
    try expectEq(pngFile.header.height, 1);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 0);
        try expectEq(firstColor.B, 255);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0);
        try expectEq(secondColor.G, 0);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices[0], 0);
    }
}

test "Read s01n3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s01n3p01.png");
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

    try expectEq(pngFile.header.width, 1);
    try expectEq(pngFile.header.height, 1);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 0);
        try expectEq(firstColor.B, 255);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0);
        try expectEq(secondColor.G, 0);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices[0], 0);
    }
}

test "Read s02i3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s02i3p01.png");
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

    try expectEq(pngFile.header.width, 2);
    try expectEq(pngFile.header.height, 2);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 255);
        try expectEq(firstColor.B, 255);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0);
        try expectEq(secondColor.G, 0);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 4);
        try expectEq(pixels.Bpp1.indices[0], 0);
        try expectEq(pixels.Bpp1.indices[1], 0);
        try expectEq(pixels.Bpp1.indices[2], 0);
        try expectEq(pixels.Bpp1.indices[3], 0);
    }
}

test "Read s02n3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s02n3p01.png");
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

    try expectEq(pngFile.header.width, 2);
    try expectEq(pngFile.header.height, 2);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 255);
        try expectEq(firstColor.B, 255);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0);
        try expectEq(secondColor.G, 0);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 4);
        try expectEq(pixels.Bpp1.indices[0], 0);
        try expectEq(pixels.Bpp1.indices[1], 0);
        try expectEq(pixels.Bpp1.indices[2], 0);
        try expectEq(pixels.Bpp1.indices[3], 0);
    }
}

test "Read s03i3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s03i3p01.png");
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

    try expectEq(pngFile.header.width, 3);
    try expectEq(pngFile.header.height, 3);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 255);
        try expectEq(firstColor.B, 0);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0xFF);
        try expectEq(secondColor.G, 0x77);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 3 * 3);
        var index: usize = 0;
        while (index < 3 * 3) : (index += 1) {
            if (index == 1 * pngFile.header.width + 1) {
                try expectEq(pixels.Bpp1.indices[index], 1);
            } else {
                try expectEq(pixels.Bpp1.indices[index], 0);
            }
        }
    }
}

test "Read s03n3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s03n3p01.png");
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

    try expectEq(pngFile.header.width, 3);
    try expectEq(pngFile.header.height, 3);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 0);
        try expectEq(firstColor.G, 255);
        try expectEq(firstColor.B, 0);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 0xFF);
        try expectEq(secondColor.G, 0x77);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 3 * 3);
        var index: usize = 0;
        while (index < 3 * 3) : (index += 1) {
            if (index == 1 * pngFile.header.width + 1) {
                try expectEq(pixels.Bpp1.indices[index], 1);
            } else {
                try expectEq(pixels.Bpp1.indices[index], 0);
            }
        }
    }
}

test "Read s04i3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s04i3p01.png");
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

    try expectEq(pngFile.header.width, 4);
    try expectEq(pngFile.header.height, 4);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 255);
        try expectEq(firstColor.G, 0);
        try expectEq(firstColor.B, 119);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 255);
        try expectEq(secondColor.G, 255);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 4 * 4);

        const expected = [_]u8{
            1, 1, 1, 1,
            1, 0, 0, 1,
            1, 0, 0, 1,
            1, 1, 1, 1,
        };
        var index: usize = 0;
        while (index < 4 * 4) : (index += 1) {
            try expectEq(pixels.Bpp1.indices[index], @intCast(u1, expected[index]));
        }
    }
}

test "Read s04n3p01 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s04n3p01.png");
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

    try expectEq(pngFile.header.width, 4);
    try expectEq(pngFile.header.height, 4);

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp1);

        try expectEq(pixels.Bpp1.palette.len, 2);

        const firstColor = pixels.Bpp1.palette[0].toIntegerColor8();
        try expectEq(firstColor.R, 255);
        try expectEq(firstColor.G, 0);
        try expectEq(firstColor.B, 119);

        const secondColor = pixels.Bpp1.palette[1].toIntegerColor8();
        try expectEq(secondColor.R, 255);
        try expectEq(secondColor.G, 255);
        try expectEq(secondColor.B, 0);

        try expectEq(pixels.Bpp1.indices.len, 4 * 4);

        const expected = [_]u8{
            1, 1, 1, 1,
            1, 0, 0, 1,
            1, 0, 0, 1,
            1, 1, 1, 1,
        };
        var index: usize = 0;
        while (index < 4 * 4) : (index += 1) {
            try expectEq(pixels.Bpp1.indices[index], @intCast(u1, expected[index]));
        }
    }
}

test "Read s05i3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s05i3p02.png");
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

    try expectEq(pngFile.header.width, 5);
    try expectEq(pngFile.header.height, 5);

    const total_size = 5 * 5;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 255);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 119);
        try expectEq(color1.G, 0);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            2, 2, 2, 2, 2,
            2, 1, 1, 1, 2,
            2, 1, 0, 1, 2,
            2, 1, 1, 1, 2,
            2, 2, 2, 2, 2,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s05n3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s05n3p02.png");
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

    try expectEq(pngFile.header.width, 5);
    try expectEq(pngFile.header.height, 5);

    const total_size = 5 * 5;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 255);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 119);
        try expectEq(color1.G, 0);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            2, 2, 2, 2, 2,
            2, 1, 1, 1, 2,
            2, 1, 0, 1, 2,
            2, 1, 1, 1, 2,
            2, 2, 2, 2, 2,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s06i3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s06i3p02.png");
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

    try expectEq(pngFile.header.width, 6);
    try expectEq(pngFile.header.height, 6);

    const total_size = 6 * 6;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 0);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 119);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 255);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            2, 2, 2, 2, 2, 2,
            2, 1, 1, 1, 1, 2,
            2, 1, 0, 0, 1, 2,
            2, 1, 0, 0, 1, 2,
            2, 1, 1, 1, 1, 2,
            2, 2, 2, 2, 2, 2,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s06n3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s06n3p02.png");
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

    try expectEq(pngFile.header.width, 6);
    try expectEq(pngFile.header.height, 6);

    const total_size = 6 * 6;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 0);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 119);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 255);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            2, 2, 2, 2, 2, 2,
            2, 1, 1, 1, 1, 2,
            2, 1, 0, 0, 1, 2,
            2, 1, 0, 0, 1, 2,
            2, 1, 1, 1, 1, 2,
            2, 2, 2, 2, 2, 2,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s07i3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s07i3p02.png");
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

    try expectEq(pngFile.header.width, 7);
    try expectEq(pngFile.header.height, 7);

    const total_size = 7 * 7;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 255);
        try expectEq(color0.G, 0);
        try expectEq(color0.B, 119);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 255);
        try expectEq(color1.B, 119);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 255);
        try expectEq(color2.B, 0);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 0);
        try expectEq(color3.G, 0);
        try expectEq(color3.B, 255);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            3, 3, 3, 3, 3, 3, 3,
            3, 1, 1, 1, 1, 1, 3,
            3, 1, 2, 2, 2, 1, 3,
            3, 1, 2, 0, 2, 1, 3,
            3, 1, 2, 2, 2, 1, 3,
            3, 1, 1, 1, 1, 1, 3,
            3, 3, 3, 3, 3, 3, 3,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s07n3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s07n3p02.png");
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

    try expectEq(pngFile.header.width, 7);
    try expectEq(pngFile.header.height, 7);

    const total_size = 7 * 7;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 255);
        try expectEq(color0.G, 0);
        try expectEq(color0.B, 119);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 255);
        try expectEq(color1.B, 119);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 255);
        try expectEq(color2.B, 0);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 0);
        try expectEq(color3.G, 0);
        try expectEq(color3.B, 255);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            3, 3, 3, 3, 3, 3, 3,
            3, 1, 1, 1, 1, 1, 3,
            3, 1, 2, 2, 2, 1, 3,
            3, 1, 2, 0, 2, 1, 3,
            3, 1, 2, 2, 2, 1, 3,
            3, 1, 1, 1, 1, 1, 3,
            3, 3, 3, 3, 3, 3, 3,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s08i3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s08i3p02.png");
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

    try expectEq(pngFile.header.width, 8);
    try expectEq(pngFile.header.height, 8);

    const total_size = 8 * 8;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 255);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 119);
        try expectEq(color1.G, 0);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 119);
        try expectEq(color2.G, 255);
        try expectEq(color2.B, 0);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 255);
        try expectEq(color3.G, 0);
        try expectEq(color3.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            0, 0, 0, 0, 0, 0, 0, 0,
            0, 2, 2, 2, 2, 2, 2, 0,
            0, 2, 3, 3, 3, 3, 2, 0,
            0, 2, 3, 1, 1, 3, 2, 0,
            0, 2, 3, 1, 1, 3, 2, 0,
            0, 2, 3, 3, 3, 3, 2, 0,
            0, 2, 2, 2, 2, 2, 2, 0,
            0, 0, 0, 0, 0, 0, 0, 0,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s08n3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s08n3p02.png");
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

    try expectEq(pngFile.header.width, 8);
    try expectEq(pngFile.header.height, 8);

    const total_size = 8 * 8;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 255);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 119);
        try expectEq(color1.G, 0);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 119);
        try expectEq(color2.G, 255);
        try expectEq(color2.B, 0);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 255);
        try expectEq(color3.G, 0);
        try expectEq(color3.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            0, 0, 0, 0, 0, 0, 0, 0,
            0, 2, 2, 2, 2, 2, 2, 0,
            0, 2, 3, 3, 3, 3, 2, 0,
            0, 2, 3, 1, 1, 3, 2, 0,
            0, 2, 3, 1, 1, 3, 2, 0,
            0, 2, 3, 3, 3, 3, 2, 0,
            0, 2, 2, 2, 2, 2, 2, 0,
            0, 0, 0, 0, 0, 0, 0, 0,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s09i3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s09i3p02.png");
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

    try expectEq(pngFile.header.width, 9);
    try expectEq(pngFile.header.height, 9);

    const total_size = 9 * 9;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 0);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 119);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 255);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 255);
        try expectEq(color3.G, 119);
        try expectEq(color3.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 3, 3, 3, 3, 3, 3, 3, 0,
            0, 3, 2, 2, 2, 2, 2, 3, 0,
            0, 3, 2, 1, 1, 1, 2, 3, 0,
            0, 3, 2, 1, 0, 1, 2, 3, 0,
            0, 3, 2, 1, 1, 1, 2, 3, 0,
            0, 3, 2, 2, 2, 2, 2, 3, 0,
            0, 3, 3, 3, 3, 3, 3, 3, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s09n3p02 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s09n3p02.png");
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

    try expectEq(pngFile.header.width, 9);
    try expectEq(pngFile.header.height, 9);

    const total_size = 9 * 9;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp2);

        try expectEq(pixels.Bpp2.palette.len, 4);

        const color0 = pixels.Bpp2.palette[0].toIntegerColor8();
        try expectEq(color0.R, 0);
        try expectEq(color0.G, 255);
        try expectEq(color0.B, 0);

        const color1 = pixels.Bpp2.palette[1].toIntegerColor8();
        try expectEq(color1.R, 0);
        try expectEq(color1.G, 119);
        try expectEq(color1.B, 255);

        const color2 = pixels.Bpp2.palette[2].toIntegerColor8();
        try expectEq(color2.R, 255);
        try expectEq(color2.G, 0);
        try expectEq(color2.B, 255);

        const color3 = pixels.Bpp2.palette[3].toIntegerColor8();
        try expectEq(color3.R, 255);
        try expectEq(color3.G, 119);
        try expectEq(color3.B, 0);

        try expectEq(pixels.Bpp2.indices.len, total_size);

        const expected = [_]u8{
            0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 3, 3, 3, 3, 3, 3, 3, 0,
            0, 3, 2, 2, 2, 2, 2, 3, 0,
            0, 3, 2, 1, 1, 1, 2, 3, 0,
            0, 3, 2, 1, 0, 1, 2, 3, 0,
            0, 3, 2, 1, 1, 1, 2, 3, 0,
            0, 3, 2, 2, 2, 2, 2, 3, 0,
            0, 3, 3, 3, 3, 3, 3, 3, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0,
        };
        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp2.indices[index], @intCast(u2, expected[index]));
        }
    }
}

test "Read s32i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s32i3p04.png");
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

    const total_size = 32 * 32;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 0, 0, 0,  0,  0, 0, 0, 0, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 11, 10, 6, 3, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  0, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 0, 0, 0,  10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 0,  0,  0, 0, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 0,  0,  0, 0, 0, 0, 0,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s32n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s32n3p04.png");
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

    const total_size = 32 * 32;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 0, 0, 0,  0,  0, 0, 0, 0, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 11, 10, 6, 3, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  0, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 0, 0, 0,  10, 6, 3, 9, 2, 5,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 0,  0,  0, 0, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 0, 0, 0, 0,  0,  0, 0, 0, 0, 0,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s33i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s33i3p04.png");
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

    try expectEq(pngFile.header.width, 33);
    try expectEq(pngFile.header.height, 33);

    const total_size = 33 * 33;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  0,  0,  0,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  2,  2,  2,  2,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  0,  12, 12,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s33n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s33n3p04.png");
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

    try expectEq(pngFile.header.width, 33);
    try expectEq(pngFile.header.height, 33);

    const total_size = 33 * 33;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  0,  0,  0,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  2,  2,  2,  2,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  0,  12, 12,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s34i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s34i3p04.png");
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

    try expectEq(pngFile.header.width, 34);
    try expectEq(pngFile.header.height, 34);

    const total_size = 34 * 34;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  0, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 0, 0, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 0, 0, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s34n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s34n3p04.png");
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

    try expectEq(pngFile.header.width, 34);
    try expectEq(pngFile.header.height, 34);

    const total_size = 34 * 34;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  0, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 0,  0,  6, 3, 9, 2, 5, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 0, 0, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 0, 0,  0,  0, 0, 0, 0, 0, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s35i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s35i3p04.png");
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

    try expectEq(pngFile.header.width, 35);
    try expectEq(pngFile.header.height, 35);

    const total_size = 35 * 35;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  0,  0,  0,  0,  12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  11, 0,  0,  0,  0,  0,  0,  11,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0,  6,  6,  6,  0,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  5,  5,  5,  5,  5,  5,  0,  0,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 0,  0,  0,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  0,  0,  0,  7,  7,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s35n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s35n3p04.png");
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

    try expectEq(pngFile.header.width, 35);
    try expectEq(pngFile.header.height, 35);

    const total_size = 35 * 35;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  0,  0,  0,  0,  12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  11, 0,  0,  0,  0,  0,  0,  11,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0,  6,  6,  6,  0,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  5,  5,  5,  5,  5,  5,  0,  0,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 0,  0,  0,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  0,  0,  0,  7,  7,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s36i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s36i3p04.png");
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

    try expectEq(pngFile.header.width, 36);
    try expectEq(pngFile.header.height, 36);

    const total_size = 36 * 36;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 0, 0,  0, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 0, 0, 0, 0,  0, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 0, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 0, 0,  0, 7, 1,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s36n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s36n3p04.png");
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

    try expectEq(pngFile.header.width, 36);
    try expectEq(pngFile.header.height, 36);

    const total_size = 36 * 36;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 0, 0,  0, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 0, 0, 0, 0,  0, 7, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 0, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 0,  0, 0, 9, 2, 5, 12, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 0, 0, 0, 0, 0, 0,  0, 0, 1,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 0, 0,  0, 7, 1,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s37i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s37i3p04.png");
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

    try expectEq(pngFile.header.width, 37);
    try expectEq(pngFile.header.height, 37);

    const total_size = 37 * 37;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  10,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  0,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  0,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1,  1,  1,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s37n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s37n3p04.png");
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

    try expectEq(pngFile.header.width, 37);
    try expectEq(pngFile.header.height, 37);

    const total_size = 37 * 37;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  10,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  0,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  0,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  0,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1,  1,  1,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s38i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s38i3p04.png");
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

    try expectEq(pngFile.header.width, 38);
    try expectEq(pngFile.header.height, 38);

    const total_size = 38 * 38;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 0, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 0, 8, 11,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s38n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s38n3p04.png");
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

    try expectEq(pngFile.header.width, 38);
    try expectEq(pngFile.header.height, 38);

    const total_size = 38 * 38;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  10, 6, 3, 9, 2, 5, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            0, 0,  0,  6, 3, 9, 2, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 0,  0,  0, 0, 0, 0, 0, 0,  4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 0,  0, 0, 0, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 0, 8, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 0, 0, 0, 5, 12, 4, 7, 0, 0, 0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 0, 0, 0, 0,  0, 0, 0, 0, 11,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 0, 8, 11,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s39i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s39i3p04.png");
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

    try expectEq(pngFile.header.width, 39);
    try expectEq(pngFile.header.height, 39);

    const total_size = 39 * 39;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0,  0,  0,  0,  0,  0,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  10, 10, 10, 10, 10, 10, 0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  6,  6,  6,  6,  6,  6,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  12, 0,  0,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  0,  0,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0,  8,  8,  8,  8,  0,  0,  0,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,  0,  0,  0,  0,  0,  11,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  0,  0,  0,  0,  10, 10,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s39n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s39n3p04.png");
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

    try expectEq(pngFile.header.width, 39);
    try expectEq(pngFile.header.height, 39);

    const total_size = 39 * 39;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 10, 10, 10, 10, 10, 0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  6,  6,  6,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  0,  0,  0,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  0,  0,  0,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  0,  0,  5,  5,  0,  0,  0,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  0,  0,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  0,  0,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
            0,  0,  8,  8,  8,  8,  8,  8,  0,  0,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,
            0,  0,  0,  11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            10, 0,  0,  0,  0,  0,  0,  0,  0,  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
            6,  6,  0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0,  0,  0,  1,  1,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0,  0,  0,  0,  0,  0,  8,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,  11, 11, 11, 11, 0,  0,  0,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  10, 10, 10, 10, 10, 10, 0,  0,
            6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  6,  6,  6,  6,  6,  6,  0,  0,
            3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  0,  0,  3,  3,  3,  3,  3,  3,  0,  0,
            9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  0,  0,  9,  9,  9,  9,  9,  9,  0,  0,
            2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,
            5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,
            12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0,  0,  0,  0,  0,  12, 0,  0,
            4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  0,  0,
            7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  0,  0,
            1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  1,  1,  1,  1,  0,  0,
            8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  0,  0,  0,  8,  8,  8,  8,  0,  0,  0,
            11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0,  0,  0,  0,  0,  0,  0,  0,  11,
            10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0,  0,  0,  0,  0,  0,  10, 10,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s40i3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s40i3p04.png");
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

    try expectEq(pngFile.header.width, 40);
    try expectEq(pngFile.header.height, 40);

    const total_size = 40 * 40;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 0, 0, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 0,  0, 0, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 0,  0,  0, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 0,  0,  6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 0, 0, 0, 0,  10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 0, 0, 0, 0,  0,  6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 0, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 0, 0, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 0, 0, 0, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 0, 0, 0, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 0, 0, 0, 0,  0,  6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 0, 0, 0, 0,  10, 6,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}

test "Read s40n3p04 data properly" {
    const file = try testOpenFile(zigimg_test_allocator, "tests/fixtures/png/s40n3p04.png");
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

    try expectEq(pngFile.header.width, 40);
    try expectEq(pngFile.header.height, 40);

    const total_size = 40 * 40;

    try testing.expect(pixelsOpt != null);

    if (pixelsOpt) |pixels| {
        try testing.expect(pixels == PixelFormat.Bpp4);

        try expectEq(pixels.Bpp4.palette.len, 16);

        const palette = [_]u32{
            0x000000,
            0xff0077,
            0x00ffff,
            0x00ff00,
            0x7700ff,
            0x0077ff,
            0x77ff00,
            0xff00ff,
            0xff0000,
            0x00ff77,
            0xffff00,
            0xff7700,
            0x0000ff,
        };

        for (palette) |raw_color, i| {
            const expected = color.IntegerColor8.fromHtmlHex(raw_color);

            try expectEq(pixels.Bpp4.palette[i].toIntegerColor8(), expected);
        }

        try expectEq(pixels.Bpp4.indices.len, total_size);

        const expected = [_]u8{
            8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 0, 0, 0, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 0, 0, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 0,  0, 0, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 0,  0, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 0,  0,  0, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 0,  0,  6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            0, 0,  0,  0, 0, 0, 0, 0, 0,  0, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 0, 0, 0, 0,  10, 6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 0, 0, 0, 0,  0,  6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 0, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 0, 0, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 0, 0, 0, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 0, 0, 0, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 0, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  0, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 12, 4, 7, 1, 8, 11, 0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 0, 0, 0,  4, 7, 1, 8, 0,  0,  0,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 0, 0,  0, 0, 0, 0, 0,  0,  6,
            8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 12, 4, 7, 1, 8, 11, 10, 6, 3, 9, 2, 5, 0,  0, 0, 0, 0, 0,  10, 6,
        };

        try expectEq(pixels.Bpp4.indices.len, expected.len);

        var index: usize = 0;
        while (index < total_size) : (index += 1) {
            try expectEq(pixels.Bpp4.indices[index], @intCast(u4, expected[index]));
        }
    }
}
