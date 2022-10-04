include <sled-fixtures/side-posts.scad>
include <sled-fixtures/corners.scad>
include <../libs/roundedcube/roundedcube.scad>


module blank2wSled() {
    import("2Wsled.stl");
}

module cutouts() {
    color("gray")
    roundedcube([107.32, 101.8, 15], true, 5, "z");
    
    // sidepost cutouts
    translate([-63.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
    translate([63.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
}


difference() {
    translate([1, 0, 0])
    blank2wSled();
    
    translate([0, 6, 0])
    cutouts();
}

translate([0, 6, 3.55])
corners(containerWidth=134.15, containerDepth=127.25, tolerance=0.15, cornerWD=10, cornerHeight=5, hullThickness=2);

translate([0, 6, 3.55])
sideposts(134.15, 36.6, 0.15, 0.15, 4);


// router
//color("gray", 0.5)
//translate([0, 6, 21.8])
//cube([134.15, 127.25, 36.6], center=true);
