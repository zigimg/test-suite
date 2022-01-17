test "zigimg test suite" {
    _ = @import("color_test.zig");
    _ = @import("formats/bmp_test.zig");
    _ = @import("formats/jpeg_test.zig");
    _ = @import("formats/netpbm_test.zig");
    _ = @import("formats/pcx_test.zig");
    _ = @import("formats/png_test.zig");
    _ = @import("formats/qoi_test.zig");
    _ = @import("formats/tga_test.zig");
    _ = @import("image_test.zig");
    _ = @import("octree_quantizer_test.zig");
}
