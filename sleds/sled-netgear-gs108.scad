include <sled-fixtures/side-posts.scad>
include <sled-fixtures/corners.scad>
include <../libs/roundedcube/roundedcube.scad>


module blank2wSled() {
    import("2Wsled.stl");
}

module cutouts() {
    // center void
    color("gray")
    translate([0, -10, 0])
    roundedcube([120, 70, 15], true, 5, "z");
    
    // rear void
    color("gray")
    translate([0, 70, 0])
    roundedcube([120, 23, 15], true, 5, "z");    
    
    // sidepost cutouts
    translate([-75.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
    translate([75.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
    
    // rear slot
    color("gray")
    translate([0, 45.57, 3])
    cube([158.30, 10.15, 1.15], center=true); 
}


difference() {
    translate([1, 0, 0])
    blank2wSled();
    
    translate([0, -7.15, 0])
    cutouts();
}

translate([0, -7.15, 3.55])
corners(containerWidth=158, containerDepth=101, tolerance=0.15, cornerWD=10, cornerHeight=5, hullThickness=1);

translate([0, -7.15, 3.55])
sideposts(158, 26, 0.15, 0, 1.4);

// netgear switch gs108
//color("gray", 0.5)
//translate([0, -7.15, 16.55])
//cube([158, 101, 26], center=true);
